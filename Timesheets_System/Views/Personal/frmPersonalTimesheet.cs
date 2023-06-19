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
            TitleBarManager titleBarManager = new TitleBarManager(panel2, pn_Minimize, pn_Maximize, pn_Close);
            this.Text = string.Empty;
            this.ControlBox = false;
            this.MaximizedBounds = Screen.FromHandle(this.Handle).WorkingArea;
        }

        public frmPersonalTimesheet(string fullName, int year, int month)
        {
            InitializeComponent();
            TitleBarManager titleBarManager = new TitleBarManager(panel2, pn_Minimize, pn_Maximize, pn_Close);
            this.Text = string.Empty;
            this.ControlBox = false;
            this.MaximizedBounds = Screen.FromHandle(this.Handle).WorkingArea;

            UserDTO user = _userController.GetUserWithFullInfo(fullName);

            lName.Text = user.Fullname;
            lPosition.Text = user.Position_name;
            lDepartment.Text = user.Department_name;
            lTeam.Text = user.Team_name;

            cbMonth.DataSource = Enumerable.Range(1, 12).ToList();
            cbMonth.SelectedItem = month;

            cbYear.DataSource = Enumerable.Range(2022, DateTime.Now.Year - 2022 + 1).ToList();
            cbYear.SelectedItem = year;

            dtvgPersonalTimeSheet.DataSource = _timesSheetDetailController.GetUserTimeSheetDetailByMonth(fullName, year, month);
            dtvgPersonalTimeSheet.AutoGenerateColumns = false;
            dtvgPersonalTimeSheet.Columns["Username"].Visible = false;
        }

        private void Load()
        {
            UserDTO user = _userController.GetUserWithFullInfo(frmLogin.userFullName);

            lName.Text = user.Fullname;
            lPosition.Text = user.Position_name;
            lDepartment.Text = user.Department_name;
            lTeam.Text = user.Team_name;

            cbMonth.DataSource = Enumerable.Range(1, 12).ToList();
            cbMonth.SelectedItem = DateTime.Now.Month - 1;

            cbYear.DataSource = Enumerable.Range(2022, DateTime.Now.Year - 2022 + 1).ToList();
            cbYear.SelectedItem = DateTime.Now.Year;

            dtvgPersonalTimeSheet.DataSource = _timesSheetDetailController.GetUserTimeSheetDetailByMonth(frmLogin.userFullName, Int32.Parse(cbYear.Text), Int32.Parse(cbMonth.Text));
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

    }
}
