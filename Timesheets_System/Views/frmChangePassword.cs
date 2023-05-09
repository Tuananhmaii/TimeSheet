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
using System.Windows.Forms;
using Timesheets_System.Common.Util;
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Views
{
    public partial class frmChangePassword : Form
    {
        private string _current_user_id = frmLogin.loggedUser.Username;
        UserController _userController = new UserController();
        TimesheetsController _timesheetsController = new TimesheetsController();

        public frmChangePassword()
        {
            InitializeComponent();
        }

        // Đổi mật khẩu
        private void btChangePassword_Click(object sender, EventArgs e)
        {
            UserDTO user = _userController.GetUserByID(_current_user_id);
            if (checkConstraint(txbOldPassword.Text, txbNewPassword.Text, txbNewPasswordConfirm.Text, user.Password))
            {
                if (isValidPassword(txbNewPassword.Text.ToString()))
                {
                    var encrypted = StringUtil.Encrytion(txbNewPassword.Text);
                    _userController.ChangePassword(_current_user_id, encrypted);
                    MessageBox.Show("Đổi mật khẩu thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.Close();
                }
            }
        }

        // Check độ mạnh mật khẩu
        private bool isValidPassword(string password)
        {
            string specialChars = "^(?=.*?[^\\w]).+$";
            bool isMatch = Regex.IsMatch(password, specialChars);

            if (password.Length < 8)
            {
                MessageBox.Show("Mật khẩu phải dài hơn 8 kí tự",
                        "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (!password.Any(char.IsUpper))
            {
                MessageBox.Show("Mật khẩu phải chứa 1 chữ hoa",
                        "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (!password.Any(char.IsLower))
            {
                MessageBox.Show("Mật khẩu phải chứa 1 chữ thường",
                        "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (!password.Any(char.IsDigit))
            {
                MessageBox.Show("Mật khẩu phải chứa 1 chữ số",
                        "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (!isMatch)
            {
                MessageBox.Show("Mật khẩu phải chứa 1 kí tự đặc biệt",
                        "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            return true;
        }

        // Check input
        private bool checkConstraint(string oldPassword, string newPassword, string newPasswordConfirm, string userPassword)
        {
            if (String.IsNullOrEmpty(newPassword) || String.IsNullOrEmpty(oldPassword) || String.IsNullOrEmpty(newPasswordConfirm))
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (!StringUtil.Encrytion(oldPassword).Equals(userPassword))
            {
                MessageBox.Show("Sai mật khẩu. Xin hãy thử lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            if (!newPassword.Equals(newPasswordConfirm))
            {
                MessageBox.Show("Mật khẩu mới không khớp. Xin hãy thử lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (newPassword == oldPassword || newPasswordConfirm == oldPassword)
            {
                MessageBox.Show("Mật khẩu mới trùng với mật khẩu cũ. Xin hãy thử lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            return true;
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
