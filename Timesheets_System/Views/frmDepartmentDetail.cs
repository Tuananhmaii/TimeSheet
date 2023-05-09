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
using Timesheets_System.Common.Const;
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Views.User
{
    public partial class frmDepartmentDetail : Form
    {
        
        private Panel _parentPanel;
        private string _caption;
        public bool confirm = false;
        UserController _userController = new UserController();
        public frmDepartmentDetail(Panel parentPanel, string caption)
        {
            InitializeComponent();
            _parentPanel = parentPanel;
            _caption = caption;
        }

        private void frmDepartment_Load(object sender, EventArgs e)
        {
            
            label1.Text = _caption;
            panel5.Dock = DockStyle.Fill;
            //dtgvDepartmentDetail.Dock = DockStyle.Fill;
            dtgvDepartmentDetail.Dock = DockStyle.Fill;
            if (_caption != "All")
            {
                List<UserDTO> userDTOs = _userController.GetUsersByDepartment(_caption);

                dtgvDepartmentDetail.DataSource = userDTOs;

            }
            else
            {
                var userDTOs = _userController.GetAllUsers();

                dtgvDepartmentDetail.DataSource = userDTOs;
            }
        }

        private void dtgvDepartmentDetail_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            // Get the selected row
            DataGridViewRow selectedRow = dtgvDepartmentDetail.SelectedRows[0];

            // Get the value of the first column of the selected row
            string value = selectedRow.Cells[0].Value.ToString();

            // create a new instance of the form to be opened
            fUserDetail myNewForm = new fUserDetail();

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

        private bool checkDelete;

        private void btDelete_Click(object sender, EventArgs e)
        {
            if (frmLogin.loggedUser.Auth_Group_ID == PERMISSION_AUTH_GROUP.ADMIN)
            {
                    if (btDelete.Text == "XÓA")
                {
                    label2.Text = "Chọn nhân viên bạn muốn xóa!";
                    checkDelete = true;
                    btDelete.Text = "HỦY";
                }
                else if (btDelete.Text == "HỦY")
                {
                    btDelete.Text = "XÓA";
                    checkDelete = false;
                    label2.Text = "";
                }
            }
            else
            {
                MessageBox.Show("Bạn chưa có quyền thực hiện thao tác này!");
            }
        }


        private void dtgvDepartmentDetail_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (checkDelete)
            {
                // Get the selected row
                DataGridViewRow selectedRow = dtgvDepartmentDetail.SelectedRows[0];

                // Get the username of the first column of the selected row
                string username = selectedRow.Cells[0].Value.ToString();
                if (MessageBox.Show("Bạn chắc chắn muốn xóa nhân viên này?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    frmAcceptDeleteUser frmAcceptDeleteUser = new frmAcceptDeleteUser();
                    frmAcceptDeleteUser.getValue(username);
                    frmAcceptDeleteUser.ShowDialog();
                    confirm = frmAcceptDeleteUser.setValue();
                    if (confirm)
                    {
                        _userController.DeleteUserByID(username);
                        MessageBox.Show("Xóa nhân viên thành công!");
                        label2.Text = "";
                    }
                }
            }
        }

        private void btAdd_Click(object sender, EventArgs e)
        {
            if (frmLogin.loggedUser.Auth_Group_ID == PERMISSION_AUTH_GROUP.ADMIN)
            {
                fUserDetail newUser = new fUserDetail();
                newUser.SetUsername("");
                newUser.createSaveButton();
                newUser.ShowDialog();
            } else
            {
                MessageBox.Show("Bạn chưa có quyền thực hiện thao tác này!");
            }
                

        }
    }
}
