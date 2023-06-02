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
using Timesheets_System.Views.Screen;

namespace Timesheets_System.Views
{
    public partial class frmPermissionGrant : Form
    {
        public frmPermissionGrant()
        {
            InitializeComponent();
            
        }

        #region "Custom title"
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
            panel6.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void panel6_MouseLeave(object sender, EventArgs e)
        {
            panel6.BackColor = COLORS.TITLE_BACKCOLOR;
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
            panel7.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void panel7_MouseLeave(object sender, EventArgs e)
        {
            panel7.BackColor = COLORS.TITLE_BACKCOLOR;
        }

        private void panel8_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
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

        private void frmPermissionGrant_Load(object sender, EventArgs e)
        {
            tabControl1.Dock = DockStyle.Fill;

            frmScreen frmScreen = new frmScreen();
            frmScreen.TopLevel = false;
            frmScreen.FormBorderStyle = FormBorderStyle.None;
            frmScreen.Dock = DockStyle.Fill;
            tabPage1.Controls.Add(frmScreen);
            frmScreen.Show();

            frmUserRole frmUserRole = new frmUserRole();
            frmUserRole.TopLevel = false;
            frmUserRole.FormBorderStyle = FormBorderStyle.None;
            frmUserRole.Dock = DockStyle.Fill;
            tabPage2.Controls.Add(frmUserRole);
            frmUserRole.Show();
        }
    }
}
