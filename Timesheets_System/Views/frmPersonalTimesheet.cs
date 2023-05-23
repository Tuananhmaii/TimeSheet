using MaterialSkin;
using MaterialSkin.Controls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Views
{
    public partial class frmPersonalTimesheet : Form
    {
        Point mouseOffset;
        UserController _userController = new UserController();
        TimesheetsDetailsController _timesSheetDetailController = new TimesheetsDetailsController();
        string userName = frmLogin.loggedUser.Username;

        public frmPersonalTimesheet(string current_user_id, DateTime dateTime)
        {
            InitializeComponent();
        }

        private void frmPersonalTimesheet_Load(object sender, EventArgs e)
        {
            cbMonth.DataSource = Enumerable.Range(1, 12).ToList();
            cbMonth.SelectedItem = DateTime.Now.Month - 1;

            cbYear.DataSource = Enumerable.Range(2022, DateTime.Now.Year - 2022 + 1).ToList();
            cbYear.SelectedItem = DateTime.Now.Year;

            string userId = frmLogin.loggedUser.Username;
            UserDTO user = _userController.GetForeignValue(userId);

            lName.Text = user.Fullname;
            lPosition.Text = user.Position_name;
            lDepartment.Text = user.Department_name;
            lTeam.Text = user.Team_name;
        }

        private void btn_Submit_Click_1(object sender, EventArgs e)
        {
            dtvgPersonalTimeSheet.DataSource = _timesSheetDetailController.GetIndividualReport(userName, Int32.Parse(cbYear.Text), Int32.Parse(cbMonth.Text));
            if (dtvgPersonalTimeSheet.Rows.Count == 0)
            {
                MessageBox.Show("Không có data", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            dtvgPersonalTimeSheet.AutoGenerateColumns = false;
            dtvgPersonalTimeSheet.Columns["Username"].Visible = false;
        }

        private void pn_Title_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                mouseOffset = new Point(-e.X, -e.Y);
            }
        }

        private void pn_Title_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                Point mousePos = Control.MousePosition;
                mousePos.Offset(mouseOffset.X, mouseOffset.Y);
                Location = mousePos;
            }
        }
    }
}