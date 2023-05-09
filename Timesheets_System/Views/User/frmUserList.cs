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
using Timesheets_System.Models.DTO;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Window;

namespace Timesheets_System.Views.User
{
    public partial class frmUserList : Form
    {
        private UserDTO _current_user;
        private string caption;

        public frmUserList()
        {
            InitializeComponent();
            this.Text = string.Empty;
            this.ControlBox = false;
            this.MaximizedBounds = Screen.FromHandle(this.Handle).WorkingArea;
        }

        //Move form
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private static extern void ReleaseCapture();

        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private static extern void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void panel6_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void panel6_MouseEnter(object sender, EventArgs e)
        {
            panel6.BackColor = SystemColors.Window;
        }

        private void panel6_MouseLeave(object sender, EventArgs e)
        {
            Color myColor = Color.FromArgb(2, 136, 209);
            panel6.BackColor = myColor;
        }

        private void panel7_Click(object sender, EventArgs e)
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

        private void panel7_MouseEnter(object sender, EventArgs e)
        {
            panel7.BackColor = SystemColors.Window;
        }

        private void panel7_MouseLeave(object sender, EventArgs e)
        {
            Color myColor = Color.FromArgb(2, 136, 209);
            panel7.BackColor = myColor;
        }

        private void panel8_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void panel8_MouseEnter(object sender, EventArgs e)
        {
            panel8.BackColor = SystemColors.Window;
        }

        private void panel8_MouseLeave(object sender, EventArgs e)
        {
            Color myColor = Color.FromArgb(2, 136, 209);
            panel8.BackColor = myColor;
        }

        private void frmUserList_Load(object sender, EventArgs e)
        {
            panel3.Dock = DockStyle.Fill;
            _current_user = frmLogin.loggedUser;
            label3.Text = _current_user.Fullname;
            panel7_Click(sender, e);
            btnAllEmployees_Click(sender, e);
        }

        private void btnAllEmployees_Click(object sender, EventArgs e)
        {
            frmDepartmentDetail frmDepartment = new frmDepartmentDetail(panel3, "All");
            frmDepartment.TopLevel = false;
            frmDepartment.AutoScroll = true;
            frmDepartment.FormBorderStyle = FormBorderStyle.None;
            panel3.Controls.Clear();
            frmDepartment.Size = panel3.Size;
            frmDepartment.Dock = DockStyle.Fill;
            panel3.BackColor = SystemColors.GrayText;
            panel3.Controls.Add(frmDepartment);
            frmDepartment.Show();
        }

        private void btn_Acount_Click(object sender, EventArgs e)
        {
            frmDepartmentDetail frmDepartment = new frmDepartmentDetail(panel3, "ACCOUNT");
            frmDepartment.TopLevel = false;
            frmDepartment.AutoScroll = true;
            frmDepartment.FormBorderStyle = FormBorderStyle.None;
            panel3.Controls.Clear();
            frmDepartment.Size = panel3.Size;
            frmDepartment.Dock = DockStyle.Fill;
            panel3.BackColor = SystemColors.Window;
            panel3.Controls.Add(frmDepartment);
            frmDepartment.Show();
        }

        private void btn_BOD_Click(object sender, EventArgs e)
        {
            frmDepartmentDetail frmDepartment = new frmDepartmentDetail(panel3, "BOD");
            frmDepartment.TopLevel = false;
            frmDepartment.AutoScroll = true;
            frmDepartment.FormBorderStyle = FormBorderStyle.None;
            panel3.Controls.Clear();
            frmDepartment.Size = panel3.Size;
            frmDepartment.Dock = DockStyle.Fill;
            panel3.BackColor = SystemColors.Window;
            panel3.Controls.Add(frmDepartment);
            frmDepartment.Show();
        }

        private void btn_DEV_Click(object sender, EventArgs e)
        {
            frmDepartmentDetail frmDepartment = new frmDepartmentDetail(panel3, "DEV");
            frmDepartment.TopLevel = false;
            frmDepartment.AutoScroll = true;
            frmDepartment.FormBorderStyle = FormBorderStyle.None;
            panel3.Controls.Clear();
            frmDepartment.Size = panel3.Size;
            frmDepartment.Dock = DockStyle.Fill;
            panel3.BackColor = SystemColors.Window;
            panel3.Controls.Add(frmDepartment);
            frmDepartment.Show();
        }

        private void btn_HR_Click(object sender, EventArgs e)
        {
            frmDepartmentDetail frmDepartment = new frmDepartmentDetail(panel3, "HR");
            frmDepartment.TopLevel = false;
            frmDepartment.AutoScroll = true;
            frmDepartment.FormBorderStyle = FormBorderStyle.None;
            panel3.Controls.Clear();
            frmDepartment.Size = panel3.Size;
            frmDepartment.Dock = DockStyle.Fill;
            panel3.BackColor = SystemColors.Window;
            panel3.Controls.Add(frmDepartment);
            frmDepartment.Show();
        }

        private void btn_MKT_Click(object sender, EventArgs e)
        {
            frmDepartmentDetail frmDepartment = new frmDepartmentDetail(panel3, "MKT");
            frmDepartment.TopLevel = false;
            frmDepartment.AutoScroll = true;
            frmDepartment.FormBorderStyle = FormBorderStyle.None;
            panel3.Controls.Clear();
            frmDepartment.Size = panel3.Size;
            frmDepartment.Dock = DockStyle.Fill;
            panel3.BackColor = SystemColors.Window;
            panel3.Controls.Add(frmDepartment);
            frmDepartment.Show();
        }

        private void btn_PRODUCT_Click(object sender, EventArgs e)
        {
            frmDepartmentDetail frmDepartment = new frmDepartmentDetail(panel3, "PRODUCT");
            frmDepartment.TopLevel = false;
            frmDepartment.AutoScroll = true;
            frmDepartment.FormBorderStyle = FormBorderStyle.None;
            panel3.Controls.Clear();
            frmDepartment.Size = panel3.Size;
            frmDepartment.Dock = DockStyle.Fill;
            panel3.BackColor = SystemColors.Window;
            panel3.Controls.Add(frmDepartment);
            frmDepartment.Show();
        }
    }
}
