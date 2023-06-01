using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Forms;
using Timesheets_System.Common.Const;
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Window;

namespace Timesheets_System.Views.User
{
    public partial class frmUserList : Form
    {
        UserController _userController = new UserController();
        DepartmentController _departmentController = new DepartmentController();
        TeamController _teamController = new TeamController();
        PositionController _positionController = new PositionController();
        List<UserDTO> userDTOs = new List<UserDTO>();
        string current_department_id;
        public frmUserList()
        {
            InitializeComponent();
            FormInit();
            this.Text = string.Empty;
            this.ControlBox = false;
            this.MaximizedBounds = Screen.FromHandle(this.Handle).WorkingArea;
        }

        private void FormInit()
        {
            dtgvDepartmentDetail.DataSource = _userController.GetAllUsers();
            cb_Department.Items.Clear();
            cb_Position.Items.Clear();
            cb_Team.Items.Clear();

            //Load department cbx
            List<DepartmentDTO> _departmentDTO = _departmentController.GetDepartmentDTO();
            _departmentDTO.Insert(0, new DepartmentDTO { Department_id = "", Department_name = "", Descriptions = "" });
            cb_Department.DataSource = _departmentDTO;
            cb_Department.DisplayMember = "Department_name";
            cb_Department.ValueMember = "Department_id";
        }

        // Code xử lý load gridView theo 3 cbBox
        private void LoadData()
        {
            try
            {
                if (cb_Department.SelectedIndex == 0)
                {
                    userDTOs = _userController.GetAllUsers();
                    if (cb_Team.Text == "" && cb_Position.Text != "")
                    {
                        userDTOs = _userController.GetAllUsersHaveDepartmentYet();
                        userDTOs = userDTOs.Where(userDTOs => userDTOs.Position_id == cb_Position.SelectedValue.ToString()).ToList();
                    }
                }
                
                else
                {
                    if (cb_Department.SelectedValue.ToString() == "None")
                    {
                        userDTOs = _userController.GetUsersHaveNoDepartment();
                    }
                    else
                    {
                        userDTOs = _userController.GetUsersByDepartment(cb_Department.SelectedValue.ToString());
                    }
                    if (cb_Team.Text != "" && cb_Position.Text == "") { userDTOs = userDTOs.Where(userDTOs => userDTOs.Team_id == cb_Team.SelectedValue.ToString()).ToList(); }
                    else if (cb_Team.Text == "" && cb_Position.Text != "") { userDTOs = userDTOs.Where(userDTOs => userDTOs.Position_id == cb_Position.SelectedValue.ToString()).ToList(); }
                    else if (cb_Team.Text != "" && cb_Position.Text != "") { userDTOs = userDTOs.Where(userDTOs => userDTOs.Team_id == cb_Team.SelectedValue.ToString() && userDTOs.Position_id == cb_Position.SelectedValue.ToString()).ToList(); }

                }
                
                dtgvDepartmentDetail.DataSource = userDTOs;
            }
            catch
            {
                MessageBox.Show("Có lỗi xảy ra!");
            }    
        }

        //Tự động thay đổi cbteam sau khi thay đổi cbdepartment
        private void cb_Department_SelectionChangeCommitted(object sender, EventArgs e)
        {
            //Load team cbx;
            current_department_id = cb_Department.SelectedValue.ToString();
            Console.WriteLine(current_department_id);

            List<TeamDTO> _teamDTO = _teamController.GetTeamDTO(current_department_id);
            cb_Team.DataSource = _teamDTO;
            cb_Team.DisplayMember = "Team_name";
            cb_Team.ValueMember = "Team_id";
            cb_Team.Text = "";
            cb_Position.Text = "";
            LoadData();
        }

        private void cb_Team_SelectionChangeCommitted(object sender, EventArgs e)
        {
            try
            {
                cb_Position.Text = "";
                LoadData();
            }
            catch { }
        }

        private void cb_Position_SelectionChangeCommitted(object sender, EventArgs e)
        {
            LoadData();
        }

        private void cb_Position_MouseClick(object sender, MouseEventArgs e)
        {
            //Load position cbx
            List<PositionDTO> _positionDTO = _positionController.GetPositionDTO();
            cb_Position.DataSource = _positionDTO;
            cb_Position.DisplayMember = "Position_name";
            cb_Position.ValueMember = "Position_id";
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (frmLogin.loggedUser.Auth_Group_ID == PERMISSION_AUTH_GROUP.ADMIN)
            {
                frmUserDetail newUser = new frmUserDetail();
                newUser.SetUsername("");
                newUser.createSaveButton();
                newUser.ShowDialog();
            }
            else
            {
                MessageBox.Show("Bạn chưa có quyền thực hiện thao tác này!");
            }
            LoadData();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the selected row
                DataGridViewRow selectedRow = dtgvDepartmentDetail.SelectedRows[0];

                // Get the username of the first column of the selected row
                string username = selectedRow.Cells[0].Value.ToString();
                if (MessageBox.Show("Bạn chắc chắn muốn xóa nhân viên này?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    _userController.DeleteUserByID(username);
                    MessageBox.Show("Xóa nhân viên thành công!");
                    LoadData();
                }
            }
            catch 
            {
                MessageBox.Show("Bạn cần chọn nhận viên để xóa!");
            }
        }

        private void dtgvDepartmentDetail_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                // Get the selected row
                DataGridViewRow selectedRow = dtgvDepartmentDetail.SelectedRows[0];

                // Get the value of the first column of the selected row
                string value = selectedRow.Cells[0].Value.ToString();

                // create a new instance of the form to be opened
                frmUserDetail myNewForm = new frmUserDetail();

                if (frmLogin.loggedUser.Auth_Group_ID != PERMISSION_AUTH_GROUP.ADMIN)
                {
                    myNewForm.DisableUpdatebtn();
                }
                // Set any necessary properties on the new form here...
                // For example, you can pass the value of the first column to the new form
                myNewForm.SetUsername(value);

                // Show the new form
                myNewForm.Show();

                LoadData();
            }
            catch {
                MessageBox.Show("Người dùng này chưa có dữ liệu!");
            }
            
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            cb_Team.Text = "";
            cb_Position.Text = "";
            cb_Department.SelectedIndex = 0;
            LoadData();
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
