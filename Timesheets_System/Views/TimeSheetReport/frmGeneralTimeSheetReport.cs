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
using System.Windows.Media;
using Timesheets_System.Common.Const;
using Timesheets_System.Common.Util;
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Timesheets_System.Views
{
    public partial class frmGeneralTimeSheetReport : Form
    {
        TimesheetsController _timeSheetController = new TimesheetsController();
        DepartmentController _departmentController = new DepartmentController();
        TeamController _teamController = new TeamController();

        public frmGeneralTimeSheetReport()
        {
            InitializeComponent();
            TitleBarManager titleBarManager = new TitleBarManager(TopBar, pn_Minimize, pn_Maximize, pn_Close);
            Load();
        }

        public void ExportToPDF(List<TimesheetsDTO> list)
        {
            string deviceInfo = "";
            string[] streamIds;
            Warning[] warnings;

            string mimeType = string.Empty;
            string enCoding = string.Empty;
            string extension = string.Empty;

            ReportViewer report = new ReportViewer();
            report.ProcessingMode = ProcessingMode.Local;
            report.LocalReport.ReportPath = "../../bin/debug/RDLC/GeneralTimeSheetReport.rdlc";

            report.LocalReport.DataSources.Add(new ReportDataSource("TimeSheetDS", list));

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

            saveFileDialog1.FileName = $"TimesheetsReport_{cbDepartment.Text}_{cbTeam.Text}_{cbMonth.Text}_{cbYear.Text}";
            saveFileDialog1.DefaultExt = "pdf";

            saveFileDialog1.Filter = "PDF files (*.pdf)|*.pdf|All files (*.*)|*.*";
            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
                string fileName = saveFileDialog1.FileName;
                File.WriteAllBytes(fileName, bytes);
                System.Diagnostics.Process.Start(fileName);
            }
        }

        private void btExportData_Click_1(object sender, EventArgs e)
        {
            if (cbDepartment.SelectedValue == null)
            {
                cbDepartment.SelectedValue = "";
            }
            if (cbTeam.SelectedValue == null)
            {
                cbTeam.SelectedValue = "";
            }
            var list = _timeSheetController.GetGeneralTimeSheet(cbDepartment.SelectedValue.ToString(), cbTeam.SelectedValue.ToString(),
                                                            Int32.Parse(cbYear.Text), Int32.Parse(cbMonth.Text));
            if (!list.Any())
            {
                MessageBox.Show("Không có data, xin hãy thử lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else
            {
                ExportToPDF(list);
            }
        }

        private void Load()
        {
            cbMonth.DataSource = Enumerable.Range(1, 12).ToList();
            cbMonth.SelectedItem = DateTime.Now.Month - 1;

            cbYear.DataSource = Enumerable.Range(2022, DateTime.Now.Year - 2022 + 1).ToList();
            cbYear.SelectedItem = DateTime.Now.Year;

            getAllDepartments();
            getAllTeams(null);
        }
        private void cbDepartment_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            if (cbDepartment.SelectedValue != null)
            {
                getAllTeams(cbDepartment.SelectedValue.ToString());
            }
            // Index 0 có value = null 
            if (cbDepartment.SelectedIndex == 0)
            {
                getAllTeams(null);
            }
        }

        private void getAllTeams(string department)
        {
            if (department == null)
            {
                List<TeamDTO> teams = _teamController.GetTeamDTO();
                teams.Insert(0, new TeamDTO { Team_id = "", Team_name = "", Department_name = "", Department_id = "" });
                cbTeam.DataSource = teams;
                cbTeam.DisplayMember = "team_name";
                cbTeam.ValueMember = "team_id";
                cbTeam.SelectedIndex = -1;
            }
            else
            {
                List<TeamDTO> teams = _teamController.GetTeamDTO(department);
                teams.Insert(0, new TeamDTO { Team_id = "", Team_name = "", Department_name = "", Department_id = "" });
                cbTeam.DataSource = teams;
                cbTeam.DisplayMember = "team_name";
                cbTeam.ValueMember = "team_id";
                cbTeam.SelectedIndex = -1;
            }
        }
        private void getAllDepartments()
        {
            var departments = _departmentController.GetDepartmentDTO();
            departments.Insert(0, new DepartmentDTO { Department_id = "", Department_name = "", Descriptions = "" });
            cbDepartment.DataSource = departments;
            cbDepartment.DisplayMember = "department_name";
            cbDepartment.ValueMember = "department_id";
            cbDepartment.SelectedIndex = -1;
        }
    }
}
