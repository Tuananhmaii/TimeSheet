using Microsoft.Reporting.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Timesheets_System.Controllers;

namespace Timesheets_System.Views
{
    public partial class frmTestReport : Form
    {
        TimesheetsController _timesheetsController = new TimesheetsController();
        public frmTestReport()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ExportToPDF();
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
            report.LocalReport.ReportPath = "../../TimeSheetReport.rdlc";
            report.LocalReport.DataSources.Add(new ReportDataSource("TimeSheetDS", _timesheetsController.GetTimeSheetsReport()));
            report.RefreshReport();

            var bytes = report.LocalReport.Render("PDF", deviceInfo, out mimeType,
                   out enCoding, out extension, out streamIds, out warnings);

            string fileName = @"D:\TimeSheetReport.pdf";
            File.WriteAllBytes(fileName, bytes);
            System.Diagnostics.Process.Start(fileName);

        }
    }
}
