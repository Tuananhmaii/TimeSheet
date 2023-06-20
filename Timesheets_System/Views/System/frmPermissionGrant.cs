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
            TitleBarManager titleBarManager = new TitleBarManager(TopBar, pn_Minimize, pn_Maximize, pn_Close);
        }
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
