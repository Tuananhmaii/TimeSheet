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
using Timesheets_System.Views;

namespace Timesheets_System
{
    public partial class frmPersonalTimesheet : Form
    {
        UserController _userController = new UserController();
        TimesheetsDetailsController _timesSheetDetailController = new TimesheetsDetailsController();

        public frmPersonalTimesheet()
        {
            InitializeComponent();
            Load();
            this.Text = string.Empty;
            this.ControlBox = false;
            this.MaximizedBounds = Screen.FromHandle(this.Handle).WorkingArea;
        }

        public frmPersonalTimesheet(string userName, int year, int month)
        {
            InitializeComponent();
            this.Text = string.Empty;
            this.ControlBox = false;
            this.MaximizedBounds = Screen.FromHandle(this.Handle).WorkingArea;

            UserDTO user = _userController.GetUserWithFullInfo(userName);

            lName.Text = user.Fullname;
            lPosition.Text = user.Position_name;
            lDepartment.Text = user.Department_name;
            lTeam.Text = user.Team_name;

            cbMonth.DataSource = Enumerable.Range(1, 12).ToList();
            cbMonth.SelectedItem = month;

            cbYear.DataSource = Enumerable.Range(2022, DateTime.Now.Year - 2022 + 1).ToList();
            cbYear.SelectedItem = year;

            dtvgPersonalTimeSheet.DataSource = _timesSheetDetailController.GetIndividualReport(userName, year, month);
            dtvgPersonalTimeSheet.AutoGenerateColumns = false;
            dtvgPersonalTimeSheet.Columns["Username"].Visible = false;
        }

        private void Load()
        {
            UserDTO user = _userController.GetUserWithFullInfo(frmLogin.user_id);

            lName.Text = user.Fullname;
            lPosition.Text = user.Position_name;
            lDepartment.Text = user.Department_name;
            lTeam.Text = user.Team_name;

            cbMonth.DataSource = Enumerable.Range(1, 12).ToList();
            cbMonth.SelectedItem = DateTime.Now.Month - 1;

            cbYear.DataSource = Enumerable.Range(2022, DateTime.Now.Year - 2022 + 1).ToList();
            cbYear.SelectedItem = DateTime.Now.Year;

            dtvgPersonalTimeSheet.DataSource = _timesSheetDetailController.GetIndividualReport(user.Username, Int32.Parse(cbYear.Text), Int32.Parse(cbMonth.Text));
            dtvgPersonalTimeSheet.AutoGenerateColumns = false;
            dtvgPersonalTimeSheet.Columns["Username"].Visible = false;
        }

        private void btn_Submit_Click(object sender, EventArgs e)
        {
            SubmitLoad();
        }

        public void SubmitLoad()
        {
            dtvgPersonalTimeSheet.DataSource = _timesSheetDetailController.GetUserTimeSheetDetailByMonth(lName.Text, Int32.Parse(cbYear.Text), Int32.Parse(cbMonth.Text));
            if (dtvgPersonalTimeSheet.Rows.Count == 0)
            {
                MessageBox.Show("Không có data", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            dtvgPersonalTimeSheet.AutoGenerateColumns = false;
            dtvgPersonalTimeSheet.Columns["Username"].Visible = false;
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

        
    }
}
