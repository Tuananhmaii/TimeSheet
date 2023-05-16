using Microsoft.Office.Interop.Excel;
using Microsoft.Reporting.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Forms;
using Timesheets_System.Common.Const;
using Timesheets_System.Common.Util;
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Timesheets_System.Views
{
    public partial class frmIndividualTimeSheetReport : Form
    {
        UserController _userController = new UserController();
        TimesheetsDetailsController _timesSheetDetailController = new TimesheetsDetailsController();
        string userName = frmLogin.loggedUser.Username;
        
        public frmIndividualTimeSheetReport()
        {
            InitializeComponent();
            Load();
        }

        public void ExportToPDF()
        {
            string deviceInfo = "";
            string[] streamIds;
            Warning[] warnings;

            string mimeType = string.Empty;
            string enCoding = string.Empty;
            string extension = string.Empty;

            ReportViewer report = new ReportViewer();
            report.ProcessingMode = ProcessingMode.Local;
            report.LocalReport.ReportPath = "../../bin/debug/RDLC/IndividualTimeSheetReport.rdlc";

            report.LocalReport.DataSources.Add(new ReportDataSource("TimeSheetDetailDS",
                _timesSheetDetailController.GetIndividualReport(userName, Int32.Parse(cbYear.Text), Int32.Parse(cbMonth.Text))));

            ReportParameter pName = new ReportParameter("pName", txbName.Text.ToString());
            report.LocalReport.SetParameters(pName);
            ReportParameter pDepartment = new ReportParameter("pDepartment", txbDepartment.Text.ToString());
            report.LocalReport.SetParameters(pDepartment);
            ReportParameter pTeam = new ReportParameter("pTeam", txbTeam.Text.ToString());
            report.LocalReport.SetParameters(pTeam);
            ReportParameter pPosition = new ReportParameter("pPosition", txbPosition.Text.ToString());
            report.LocalReport.SetParameters(pPosition);
            ReportParameter pYear = new ReportParameter("pYear", cbYear.Text.ToString());
            report.LocalReport.SetParameters(pYear);
            ReportParameter pMonth = new ReportParameter("pMonth", cbMonth.Text.ToString());
            report.LocalReport.SetParameters(pMonth);

            report.RefreshReport();

            var bytes = report.LocalReport.Render("PDF", deviceInfo, out mimeType,
                   out enCoding, out extension, out streamIds, out warnings);

            saveFileDialog1.FileName = "IndividualTimeSheetReport";
            saveFileDialog1.DefaultExt = "pdf";

            saveFileDialog1.Filter = "PDF files (*.pdf)|*.pdf|All files (*.*)|*.*";
            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
                string fileName = saveFileDialog1.FileName;
                File.WriteAllBytes(fileName, bytes);
                System.Diagnostics.Process.Start(fileName);
            }
        }

        private void Load()
        {
            cbMonth.DataSource = Enumerable.Range(1, 12).ToList();
            cbMonth.SelectedItem = DateTime.Now.Month - 1;

            cbYear.DataSource = Enumerable.Range(2022, DateTime.Now.Year - 2022 + 1).ToList();
            cbYear.SelectedItem = DateTime.Now.Year;

            string userId = frmLogin.loggedUser.Username;
            UserDTO user = _userController.GetForeignValue(userId);

            txbName.Text = user.Fullname;
            txbPosition.Text = user.Position_name;
            txbDepartment.Text = user.Department_name;
            txbTeam.Text = user.Team_name;

        }
        private void btExportData_Click(object sender, EventArgs e)
        {
            var list = _timesSheetDetailController.GetIndividualReport(userName, Int32.Parse(cbYear.Text), Int32.Parse(cbMonth.Text));
            if (!list.Any())
            {
                MessageBox.Show("Không có data, xin hãy thử lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else
            {
                ExportToPDF();
            }
        }
        #region "Custom title"
        private void panel2_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private static extern void ReleaseCapture();

        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private static extern void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);

        private void pn_Minimize_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void pn_Maximize_Click(object sender, EventArgs e)
        {
            if (WindowState == FormWindowState.Normal)
            {
                this.WindowState = FormWindowState.Maximized;
            }
            else
            {
                this.WindowState = FormWindowState.Normal;
            }
        }

        private void pn_Close_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void pn_Minimize_MouseEnter_1(object sender, EventArgs e)
        {
            pn_Minimize.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void pn_Minimize_MouseLeave_1(object sender, EventArgs e)
        {
            pn_Minimize.BackColor = COLORS.TITLE_BACKCOLOR;
        }

        private void pn_Maximize_MouseEnter_1(object sender, EventArgs e)
        {
            pn_Maximize.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void pn_Maximize_MouseLeave_1(object sender, EventArgs e)
        {
            pn_Maximize.BackColor = COLORS.TITLE_BACKCOLOR;
        }

        private void pn_Close_MouseEnter_1(object sender, EventArgs e)
        {
            pn_Close.BackColor = COLORS.TITLE_ENTERCOLOR;
            btnClose.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void pn_Close_MouseLeave_1(object sender, EventArgs e)
        {
            pn_Close.BackColor = COLORS.TITLE_BACKCOLOR;
            btnClose.BackColor = COLORS.TITLE_BACKCOLOR;
        }
        #endregion
    }
}
