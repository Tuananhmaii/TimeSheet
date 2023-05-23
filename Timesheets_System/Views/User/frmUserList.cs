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

namespace Timesheets_System.Views.User
{
    public partial class frmUserList : Form
    {
        UserController _userController = new UserController();
        DepartmentController _departmentController = new DepartmentController();
        TeamController _teamController = new TeamController();
        PositionController _positionController = new PositionController();
        List<UserDTO> userDTOs = new List<UserDTO> { new UserDTO() };
        List<UserDTO> UserListByTeam = new List<UserDTO>();
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
            cb_Department.Items.Clear();
            cb_Position.Items.Clear();
            cb_Team.Items.Clear();
        }

        //Tự động thay đổi cbteam sau khi thay đổi cbdepartment
        private void cb_Department_SelectionChangeCommitted(object sender, EventArgs e)
        {
            //Load team cbx
            string current_department_id = cb_Department.SelectedValue.ToString();
            List<TeamDTO> _teamDTO = _teamController.GetTeamDTO(current_department_id);
            cb_Team.DataSource = _teamDTO;
            cb_Team.DisplayMember = "Team_name";
            cb_Team.ValueMember = "Team_id";
            cb_Team.Text = "";
            cb_Position.Text = "";
            LoadData(current_department_id, 0);
        }

        private void cb_Team_SelectionChangeCommitted(object sender, EventArgs e)
        {
            try
            {
                string current_team_id = cb_Team.SelectedValue.ToString();
                cb_Position.Text = "";
                LoadData(current_team_id, 1);
            }
            catch { }
            
        }

        private void cb_Position_SelectionChangeCommitted(object sender, EventArgs e)
        {
            string current_position_id = cb_Position.SelectedValue.ToString();
            LoadData(current_position_id, 2);
        }

        private void cb_Department_MouseClick(object sender, MouseEventArgs e)
        {
            //Load department cbx
            List<DepartmentDTO> _departmentDTO = _departmentController.GetDepartmentDTO();
            cb_Department.DataSource = _departmentDTO;
            cb_Department.DisplayMember = "Department_name";
            cb_Department.ValueMember = "Department_id";
        }

        private void cb_Position_MouseClick(object sender, MouseEventArgs e)
        {
            //Load position cbx
            List<PositionDTO> _positionDTO = _positionController.GetPositionDTO();
            cb_Position.DataSource = _positionDTO;
            cb_Position.DisplayMember = "Position_name";
            cb_Position.ValueMember = "Position_id";
        }

        private void LoadData(string caption, int from)
        {
            if (from == 0)
            {
                userDTOs = _userController.GetUsersByDepartment(caption);
                dtgvDepartmentDetail.DataSource = userDTOs;
            }
            if (from == 1)
            {
                UserListByTeam = userDTOs.Where(userDTOs => userDTOs.Team_id == caption).ToList();
                dtgvDepartmentDetail.DataSource = UserListByTeam;
            }
            if (from == 2)
            {
                var UsersByPosition = userDTOs.Where(UserListByTeam => UserListByTeam.Position_id == caption && UserListByTeam.Team_id == cb_Team.SelectedValue.ToString()).ToList();
                dtgvDepartmentDetail.DataSource = UsersByPosition;
            }            
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
                }
            }
            catch 
            {
                MessageBox.Show("Bạn cần chọn nhận viên để xóa!");
            }
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

        private void dtgvDepartmentDetail_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
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
        }
    }
}
