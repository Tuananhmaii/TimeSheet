using MimeKit;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
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
    }
}
