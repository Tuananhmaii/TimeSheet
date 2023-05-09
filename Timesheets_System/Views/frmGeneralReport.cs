using Microsoft.Office.Interop.Excel;
using Microsoft.Reporting.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
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

namespace Timesheets_System.Views
{
    public partial class frmGeneralReport : Form
    {
        TimesheetsController _timeSheetController = new TimesheetsController();

        public frmGeneralReport()
        {
            InitializeComponent();
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
            report.LocalReport.ReportPath = "../../GeneralTimeSheetReport.rdlc";
            report.LocalReport.DataSources.Add(new ReportDataSource("TimeSheetDS", _timeSheetController.GetGeneralTimeSheet(txbDepartment.Text.ToString(), txbTeam.Text.ToString(),
                Int32.Parse(txbYear.Text), Int32.Parse(txbMonth.Text))));
            report.RefreshReport();

            var bytes = report.LocalReport.Render("PDF", deviceInfo, out mimeType,
                   out enCoding, out extension, out streamIds, out warnings);

            string fileName = @"D:\GeneralTimeSheetReport.pdf";
            File.WriteAllBytes(fileName, bytes);
            System.Diagnostics.Process.Start(fileName);

        }

        private void btExportData_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txbYear.Text) || String.IsNullOrEmpty(txbMonth.Text))
            {
                MessageBox.Show("Vui lòng nhập tháng và năm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            _timeSheetController.GetGeneralTimeSheet(txbDepartment.Text.ToString(), txbTeam.Text.ToString(), Int32.Parse(txbYear.Text), Int32.Parse(txbMonth.Text));
            MessageBox.Show("Thong tin đã được xuất ra", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            ExportToPDF();
        }
    }
}
