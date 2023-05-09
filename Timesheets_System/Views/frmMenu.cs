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
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;
using Timesheets_System.Views.User;

namespace Timesheets_System.Views
{
    public partial class frmMenu : Form
    {
        private string current_user_id;
        ScreenAuthController _screenAuthController = new ScreenAuthController();

        public frmMenu()
        {
            InitializeComponent();
        }

        private void frmMenu_Load(object sender, EventArgs e)
        {
            frmInit();
        }

        private void frmInit()
        {
            // If not login then exit application
            if (frmLogin.loggedUser == null)
            {
                return;
            }
            else
            {
                current_user_id = frmLogin.loggedUser.Username;
            }

            // Display fullname
            lbl_Username.Text += frmLogin.loggedUser.Fullname.ToUpper();

            try
            {
                // Enable/Disable menu item
                EnableMenuItem();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi trong lúc load main:" + ex.Message);
            }
        }


        private void EnableMenuItem()
        {
            // Get all screen authentication by authentication group of logged user
            UserDTO _userDTO = frmLogin.loggedUser;
            ScreenAuthDTO _screenAuthDTO = new ScreenAuthDTO();
            _screenAuthDTO.Auth_Group_ID = _userDTO.Auth_Group_ID;
            _screenAuthDTO.Allowed_To_Open = PERMISSION_TO_OPEN_SCREEN.ALLOWED;

            List<ScreenAuthDTO> screenAuthList = _screenAuthController.GetScreenAuthList(_screenAuthDTO);

            // Get all tool strip menu item in menu strip
            var allToolStripMenuItem = new List<ToolStripMenuItem>();
            GetAllToolStripMenuItems(ms_Menu.Items, allToolStripMenuItem);

            // Loop all item
            foreach (ToolStripMenuItem item in allToolStripMenuItem)
            {
                // Loop all screen authentication
                foreach (var screen in screenAuthList)
                {
                    // Tool strip menu item name = screen id and this user allowed to open this screen
                    if (item.Name == screen.Screen_ID && screen.Allowed_To_Open == PERMISSION_TO_OPEN_SCREEN.ALLOWED)
                    {
                        // If sub item is enabled then enable parent item
                        if (item.OwnerItem != null) item.OwnerItem.Enabled = true;
                        item.Enabled = true;
                        break;
                    }
                    else
                    {
                        // User cannot open this item => DISABLE
                        item.Enabled = false;
                    }
                }
            }
        }

        private void GetAllToolStripMenuItems(ToolStripItemCollection items, List<ToolStripMenuItem> result)
        {
            // Loop all items in menu
            foreach (ToolStripItem item in items)
            {
                // Get tool strip menu item and add to result
                if (item is ToolStripMenuItem menuItem)
                {
                    result.Add(menuItem);
                    // Recursive if item has DropDownItems
                    GetAllToolStripMenuItems(menuItem.DropDownItems, result);
                }
            }
        }

        //Move form
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private static extern void ReleaseCapture();

        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private static extern void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);

        private void ms_Menu_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void tsmi_Logout_Click(object sender, EventArgs e)
        {
            if(MessageBox.Show("Bạn có muốn đăng xuất?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                frmLogin.loggedUser = null;
                frmLogin frm = new frmLogin();  
                frm.Show();
                this.Close();
            }   
        }

        private void frmTimesheets_Click(object sender, EventArgs e)
        {
            frmTimesheets form = new frmTimesheets();
            form.ShowDialog();
        }

        private void frmPersonalTimesheet_Click(object sender, EventArgs e)
        {
            DateTime currentDateTime = DateTime.Now;
            frmPersonalTimesheet form = new frmPersonalTimesheet(current_user_id, currentDateTime);
            form.ShowDialog();
        }

        private void frmPersonalInfo_Click(object sender, EventArgs e)
        {
            fUserDetail form = new fUserDetail();
            form.ShowDialog();
        }

        private void frmEmployeeList_Click(object sender, EventArgs e)
        {
            frmUserList form = new frmUserList();
            form.ShowDialog();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát ứng dụng?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                Application.Exit();
            }
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


        private void frmDepartment_Click(object sender, EventArgs e)
        {
            frmDepartment form = new frmDepartment();
            form.ShowDialog();
        }

        private void frmTeam_Click(object sender, EventArgs e)
        {
            frmTeam form = new frmTeam();
            form.ShowDialog();
        }

        private void frmChangPassword_Click(object sender, EventArgs e)
        {
            frmChangePassword form = new frmChangePassword();
            form.ShowDialog();
        }

        #region "Custom title"
        private void panel6_MouseEnter(object sender, EventArgs e)
        {
            panel6.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void panel6_MouseLeave(object sender, EventArgs e)
        {
            panel6.BackColor = COLORS.TITLE_BACKCOLOR;
        }

        private void panel7_MouseEnter(object sender, EventArgs e)
        {
            panel7.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void panel7_MouseLeave(object sender, EventArgs e)
        {
            panel7.BackColor = COLORS.TITLE_BACKCOLOR;
        }

        private void panel8_MouseEnter(object sender, EventArgs e)
        {
            panel8.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void panel8_MouseLeave(object sender, EventArgs e)
        {
            panel8.BackColor = COLORS.TITLE_BACKCOLOR;
        }
        #endregion
    }
}
    