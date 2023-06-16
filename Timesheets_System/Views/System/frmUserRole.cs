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
using Timesheets_System.Views.Permission;

namespace Timesheets_System.Views.Screen
{
    public partial class frmUserRole : Form
    {
        UserController _userController = new UserController();
        List<UserDTO> _users = new List<UserDTO>();
        class UserDTOWithAdmin : UserDTO
        {
            public int _isAdmin { get; set; }
            public int _isUser { get; set; }
        }
        public frmUserRole()
        {
            InitializeComponent();
            LoadData();

        }

        private void LoadData()
        {
            dtgvScreen.AutoGenerateColumns = false;
            _users = _userController.GetAllUsers();
            List<UserDTOWithAdmin> usersWithAdmin = new List<UserDTOWithAdmin>();
            foreach (UserDTO user in _users)
            {
                int isAdmin = 0;
                int isUser = 0;
                if (user.Auth_Group_ID == "Admin") { isAdmin = 1; isUser = 0; }
                else if (user.Auth_Group_ID == "User") { isAdmin = 0; isUser = 1; }
                UserDTOWithAdmin userWithAdmin = new UserDTOWithAdmin
                {
                    Username = user.Username,
                    Fullname = user.Fullname,

                    _isAdmin = isAdmin,
                    _isUser = isUser
                };

                usersWithAdmin.Add(userWithAdmin);
            }

            dtgvScreen.DataSource = _users;
        }

        private void dtgvScreen_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            // Get the selected row
            string selectedUsername = dtgvScreen.Rows[e.RowIndex].Cells["Username"].Value.ToString();
            string selectedFullname = dtgvScreen.Rows[e.RowIndex].Cells["Fullname"].Value.ToString();
            string selectedAuth_Group_ID = dtgvScreen.Rows[e.RowIndex].Cells["Auth_Group_ID"].Value.ToString();


            frmSubmitUserRole frmSubmitUserRole = new frmSubmitUserRole(selectedUsername, selectedFullname, selectedAuth_Group_ID);
            frmSubmitUserRole.ShowDialog();
            LoadData();
        }
    }
}
