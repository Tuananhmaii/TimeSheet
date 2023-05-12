using MimeKit;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Timesheets_System.Common.Const;
using Timesheets_System.Common.Util;
using Timesheets_System.Controllers;

namespace Timesheets_System.Views
{
    public partial class frmForgotPassword : Form
    {
        UserController _userController = new UserController();
        Random random = new Random();

        public frmForgotPassword()
        {
            InitializeComponent();
        }

        private void btForgotPassword_Click(object sender, EventArgs e)
        {
            var user = _userController.GetUserByID(txbUsername.Text);
            if (String.IsNullOrEmpty(txbUsername.Text))
            {
                MessageBox.Show("Vui lòng nhập tài khoản", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (user == null)
            {
                MessageBox.Show("Tài khoản không tìm thấy . Xin hãy thử lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            var randomCode = (random.Next(999999)).ToString();

            // Config email
            var email = new MimeMessage();
            email.From.Add(MailboxAddress.Parse("anhphoncute@gmail.com"));
            email.To.Add(MailboxAddress.Parse(user.Email));
            email.Subject = "Mật khẩu mới";
            email.Body = new TextPart(MimeKit.Text.TextFormat.Html) { Text = $"This is your new password: {randomCode}" };


            //Config SMTP services
            using (var emailClient = new MailKit.Net.Smtp.SmtpClient())
            {
                emailClient.Connect("smtp.gmail.com", 587, MailKit.Security.SecureSocketOptions.StartTls);
                emailClient.Authenticate("anhphoncute@gmail.com", "crzwxezkmyvdoslc");
                emailClient.Send(email);
                emailClient.Disconnect(true);
            }

            //Đổi mật khẩu mới = random code 
            var encrypted = StringUtil.Encrytion(randomCode);
            _userController.ChangePassword(txbUsername.Text, encrypted);

            MessageBox.Show("Thông tin đã được gửi tới email của bạn. Hãy đăng nhập bằng mật khẩu mới",
                "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            frmLogin.loggedUser = null;
            frmLogin frm = new frmLogin();
            frm.Show();
            this.Close();
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
