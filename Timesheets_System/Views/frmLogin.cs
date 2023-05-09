using MaterialSkin;
using MaterialSkin.Controls;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using Timesheets_System.Common.Const;
using Timesheets_System.Common.Util;
using Timesheets_System.Controllers;
using Timesheets_System.Models.DAO;
using Timesheets_System.Models.DTO;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ProgressBar;

namespace Timesheets_System.Views
{
    public partial class frmLogin : Form
    {
        UserController _userController = new UserController();
        ScreenAuthController _screenAuthController = new ScreenAuthController();
        public static UserDTO loggedUser;
        public static string user_id;


        public frmLogin()
        {
            InitializeComponent();
        }

        private Boolean ElementCheck()
        {
            //Check username is empty
            if (txt_Username.Text == string.Empty)
            {
                MessageBox.Show("Vui lòng nhập tài khoản", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            //Check username is empty
            if (txt_Password.Text == string.Empty)
            {
                MessageBox.Show("Vui lòng nhập mật khẩu", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            return true;
        }

        private void txt_Password_KeyPress(object sender, KeyPressEventArgs e)
        {
            //Processing login event when press Enter 
            if (e.KeyChar == (char)Keys.Enter)
            {
                btnLogin.PerformClick();
            }
        }

        private void txt_Username_KeyPress(object sender, KeyPressEventArgs e)
        {
            //Processing login event when press Enter 
            if (e.KeyChar == (char)Keys.Enter)
            {
                btnLogin.PerformClick();
            }
        }

        //Move form
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private static extern void ReleaseCapture();

        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private static extern void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);

        private void frmLogin_Load(object sender, EventArgs e)
        {
            panel1.Dock = DockStyle.Fill;
            txt_Password.PasswordChar = '*';
        }

        private void panel2_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnMaximize_Click(object sender, EventArgs e)
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

        private void btnMinimize_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                //Check username, password textbox
                if (!ElementCheck()) return;

                //Get user by username
                UserDTO _userDTO = _userController.GetUserByID(txt_Username.Text);

                //Check username is exist
                if (_userDTO == null)
                {
                    MessageBox.Show("Tài khoản không tồn tại", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                //Check password is incorrect
                if (StringUtil.Encrytion(txt_Password.Text) != _userDTO.Password)
                {
                    MessageBox.Show("Mật khẩu không chính xác", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                //Get authentication of user with menu screen
                //ScreenAuthDTO _screenAuthDTO = new ScreenAuthDTO();
                //_screenAuthDTO.Auth_Group_ID = _userDTO.Auth_Group_ID;
                //_screenAuthDTO.Screen_ID = "frmMenu";
                //_screenAuthDTO.Allowed_To_Open = PERMISSION_TO_OPEN_SCREEN.ALLOWED;

                //_screenAuthDTO = _screenAuthController.GetScreenAuthByAuthGrID(_screenAuthDTO);

                //if (_screenAuthDTO == null)
                //{
                //    //User not permission to access menu
                //    MessageBox.Show("Bạn chưa có quyền truy cập", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                //    return;
                //}
                //else
                //{
                //User can access menu
                frmMenu frmMenu = new frmMenu();
                loggedUser = _userDTO;
                user_id = _userDTO.Username;
                Thread.Sleep(500);
                frmMenu.Show();
                this.Hide();
                //}
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi đăng nhập: " + ex.Message);
            }
        }
        #region "Custom title"
        private void panel6_MouseClick(object sender, MouseEventArgs e)
        {
            Color myColor = Color.FromArgb(25, 110, 191);
            pn_Close.BackColor = myColor;
        }

        private void lblForgetPass_Click(object sender, EventArgs e)
        {
            frmForgotPassword form = new frmForgotPassword();
            form.ShowDialog();
        }

        private void pn_Minimize_MouseEnter(object sender, EventArgs e)
        {
            pn_Minimize.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void pn_Minimize_MouseLeave(object sender, EventArgs e)
        {
            pn_Minimize.BackColor = COLORS.TITLE_BACKCOLOR;
        }

        private void pn_Maximize_MouseEnter(object sender, EventArgs e)
        {
            pn_Maximize.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void pn_Maximize_MouseLeave(object sender, EventArgs e)
        {
            pn_Maximize.BackColor = COLORS.TITLE_BACKCOLOR;
        }

        private void pn_Close_MouseEnter(object sender, EventArgs e)
        {
            pn_Close.BackColor = COLORS.TITLE_ENTERCOLOR;
            btnClose.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void pn_Close_MouseLeave(object sender, EventArgs e)
        {
            pn_Close.BackColor = COLORS.TITLE_BACKCOLOR;
            btnClose.BackColor = COLORS.TITLE_BACKCOLOR;
        }
        #endregion
    }
}
