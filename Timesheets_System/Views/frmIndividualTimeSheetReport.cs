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
            report.LocalReport.ReportPath = "../../RDLC/IndividualTimeSheetReport.rdlc";

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
    }
}
