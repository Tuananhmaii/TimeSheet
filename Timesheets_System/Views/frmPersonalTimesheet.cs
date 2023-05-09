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
    public partial class frmPersonalTimesheet : MaterialForm
    {
        Point mouseOffset;
        private string _current_user_username; // Lấy username của người dùng hiện tại với type string
        private UserDTO _current_user; // Tạo một người dùng hiện tại cục bộ để show thông tin
        private DateTime _selected_date;
        UserController _userController = new UserController();
        TimesheetsDetailsController _timesheetsDetailsController = new TimesheetsDetailsController();

        public frmPersonalTimesheet(string current_user_id, DateTime dateTime)
        {
            _selected_date = dateTime;
            _current_user_username = current_user_id;
            InitializeComponent();
            var materialSkinManager = MaterialSkinManager.Instance;
            materialSkinManager.AddFormToManage(this);
            materialSkinManager.Theme = MaterialSkinManager.Themes.LIGHT;
            materialSkinManager.ColorScheme = new ColorScheme(Primary.LightBlue800, Primary.LightBlue700, Primary.LightBlue500, Accent.LightBlue200, TextShade.WHITE);
        }

        private void frmPersonalTimesheet_Load(object sender, EventArgs e)
        {
            frmInit();
            loadListView();
        }

        private void frmInit()
        {
            try
            {
                dateTimePicker1.Value = _selected_date;
                _current_user = _userController.GetUserByID(_current_user_username);
                UserDTO current_user_value = _userController.GetForeignValue(_current_user_username);
                lblFullname.Text = _current_user.Fullname.ToString();
                lblDepartment.Text = current_user_value.Department_name;
                lblTeam.Text = current_user_value.Team_name;
                lblChucVu.Text = current_user_value.Position_name;
            }
            catch 
            {
            }
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

        private void loadListView()
        {
            try
            {
                TimesheetsDetailsDTO timesheetsDetailsDTO = new TimesheetsDetailsDTO();
                timesheetsDetailsDTO.Date = dateTimePicker1.Value;
                //timesheetsDetailsDTO.month = dateTimePicker1.Value.Month;
                string current_user = frmLogin.loggedUser.Fullname.ToString();
                timesheetsDetailsDTO.Fullname = current_user;

                List<TimesheetsDetailsDTO> afterTimesheetsDetailsDTO = _timesheetsDetailsController.GetUserTimeSheetDetailByMonth(timesheetsDetailsDTO);
                //Display data in the materialListView
                materialListView1.Columns.Clear();
                materialListView1.Items.Clear();
                materialListView1.FullRowSelect = true;
                materialListView1.Columns.Add("date");
                materialListView1.Columns.Add("checkin");
                materialListView1.Columns.Add("checkout");
                materialListView1.Columns.Add("working_hours");

                // customize the appearance of the control
                materialListView1.UseCompatibleStateImageBehavior = false;
                materialListView1.View = View.Details;
                //materialListView1.BackColor = MaterialSkinManager.Instance.ColorScheme.BackgroundDefault;
                materialListView1.ForeColor = MaterialSkinManager.Instance.ColorScheme.TextColor;
                //materialListView1.Font = MaterialSkinManager.Instance.getFontByType(MaterialSkinManager.fontType.ListView);
                materialListView1.HeaderStyle = ColumnHeaderStyle.Nonclickable;

                // Change the background color of the column headers
                materialListView1.HeaderStyle = ColumnHeaderStyle.Nonclickable;
                //materialListView1.HeaderBackColor = Color.FromArgb(55, 71, 79);

                // Set the font and foreground color of the column headers
                materialListView1.Font = new Font("Segoe UI", 9, FontStyle.Regular);
                //materialListView1.HeaderFont = new Font("Segoe UI", 9, FontStyle.Bold);
                //materialListView1.HeaderForeColor = Color.White;

                // Change the background color of the items in the control
                materialListView1.BackColor = Color.White;
                //materialListView1.AlternateBackColor = Color.FromArgb(242, 242, 242);

                // Set the font and foreground color of the items in the control
                materialListView1.ForeColor = Color.Black;
                materialListView1.Font = new Font("Segoe UI", 9, FontStyle.Regular);

                // Set the alignment of the columns
                materialListView1.Columns[0].TextAlign = HorizontalAlignment.Center;
                materialListView1.Columns[1].TextAlign = HorizontalAlignment.Center;
                materialListView1.Columns[2].TextAlign = HorizontalAlignment.Center;
                materialListView1.Columns[3].TextAlign = HorizontalAlignment.Center;

                // customize the appearance of the columns
                materialListView1.Columns[0].Width = 160;
                materialListView1.Columns[1].Width = 100;
                materialListView1.Columns[2].Width = 110;
                materialListView1.Columns[3].Width = 150;

                // customize the text of the columns
                materialListView1.Columns[0].Text = "DATE";
                materialListView1.Columns[1].Text = "CHECK IN";
                materialListView1.Columns[2].Text = "CHECK OUT";
                materialListView1.Columns[3].Text = "WORKING TIME";


                foreach (TimesheetsDetailsDTO timesheetsDetailsDTO1 in afterTimesheetsDetailsDTO)
                {
                    var item = new ListViewItem(new[]
                    {
                        timesheetsDetailsDTO1.Date.ToString("yyyy-MM-dd"),
                        timesheetsDetailsDTO1.Checkin.ToString("hh:mm tt"),
                        timesheetsDetailsDTO1.Checkout.ToString("hh:mm tt"),
                        timesheetsDetailsDTO1.Working_Hours.ToString()
                    });
                    materialListView1.Items.Add(item);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex.Message);
            }
        }

        private void btn_Submit_Click(object sender, EventArgs e)
        {
            loadListView();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }
    }
}