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
    public partial class frmGeneralReport : Form
    {
        TimesheetsController _timeSheetController = new TimesheetsController();
        DepartmentController _departmentController = new DepartmentController();
        TeamController _teamController = new TeamController();

        public frmGeneralReport()
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
            report.LocalReport.ReportPath = "../../RDLC/GeneralTimeSheetReport.rdlc";

            report.LocalReport.DataSources.Add(new ReportDataSource("TimeSheetDS",
                _timeSheetController.GetGeneralTimeSheet(cbDepartment.Text.ToString(), cbTeam.Text.ToString(),
                Int32.Parse(cbYear.Text), Int32.Parse(cbMonth.Text))));

            ReportParameter pDepartment = new ReportParameter("pDepartment", cbDepartment.Text.ToString());
            report.LocalReport.SetParameters(pDepartment);
            ReportParameter pTeam = new ReportParameter("pTeam", cbTeam.Text.ToString());
            report.LocalReport.SetParameters(pTeam);
            ReportParameter pYear = new ReportParameter("pYear", cbYear.Text.ToString());
            report.LocalReport.SetParameters(pYear);
            ReportParameter pMonth = new ReportParameter("pMonth", cbMonth.Text.ToString());
            report.LocalReport.SetParameters(pMonth);

            report.RefreshReport();

            var bytes = report.LocalReport.Render("PDF", deviceInfo, out mimeType,
                   out enCoding, out extension, out streamIds, out warnings);

            saveFileDialog1.FileName = "GeneralTimeSheetReport";
            saveFileDialog1.DefaultExt = "pdf";

            saveFileDialog1.Filter = "PDF files (*.pdf)|*.pdf|All files (*.*)|*.*";
            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
                string fileName = saveFileDialog1.FileName;
                File.WriteAllBytes(fileName, bytes);
                System.Diagnostics.Process.Start(fileName);
            }
        }

        private void btExportData_Click(object sender, EventArgs e)
        {
            var list = _timeSheetController.GetGeneralTimeSheet(cbDepartment.Text.ToString(), cbTeam.Text.ToString(), Int32.Parse(cbYear.Text), Int32.Parse(cbMonth.Text));
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

        private void Load()
        {
            cbMonth.DataSource = Enumerable.Range(1, 12).ToList();
            cbMonth.SelectedItem = DateTime.Now.Month - 1;

            cbYear.DataSource = Enumerable.Range(2022, DateTime.Now.Year - 2022 + 1).ToList();
            cbYear.SelectedItem = DateTime.Now.Year;

            cbDepartment.DataSource = _departmentController.GetDepartmentDTO();
            cbDepartment.ValueMember = "department_id";
            cbDepartment.SelectedIndex = -1;

            cbTeam.DataSource = _teamController.GetTeamDTO();
            cbTeam.ValueMember = "team_id";
            cbTeam.SelectedIndex = -1;
        }
    }
}
