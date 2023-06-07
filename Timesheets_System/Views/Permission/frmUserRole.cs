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

            dtgvScreen.DataSource = usersWithAdmin;

        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            string AdminRole = "Admin";
            string UserRole = "User";

            for (int i = 0; i < dtgvScreen.Rows.Count; i++)
            {
                if (dtgvScreen.Rows[i].Cells[2].Value.ToString() == "1")
                {
                    _userController.UpdateAuth_Group_ID(dtgvScreen.Rows[i].Cells[0].Value.ToString(), AdminRole);
                }
                else if (dtgvScreen.Rows[i].Cells[3].Value.ToString() == "1")
                {
                    _userController.UpdateAuth_Group_ID(dtgvScreen.Rows[i].Cells[0].Value.ToString(), UserRole);
                }
            }
            MessageBox.Show("Thành công!");

        }

        private void dtgvScreen_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            // Kiểm tra nếu sự kiện được kích hoạt từ cột "admin" (theo index cột)
            if (e.ColumnIndex == 2 && e.RowIndex >= 0)
            {
                if (dtgvScreen.Rows[e.RowIndex].Cells[2].Value.ToString() == "0")
                {
                    // Uncheck cột "user" tại hàng tương ứng
                    dtgvScreen.Rows[e.RowIndex].Cells[3].Value = "0";
                    dtgvScreen.Rows[e.RowIndex].Cells[2].Value = "1";
                }
            }
            else if (e.ColumnIndex == 3 && e.RowIndex >= 0)
            {
                if (dtgvScreen.Rows[e.RowIndex].Cells[3].Value.ToString() == "0")
                {
                    // Uncheck cột "user" tại hàng tương ứng
                    dtgvScreen.Rows[e.RowIndex].Cells[2].Value = "0";
                    dtgvScreen.Rows[e.RowIndex].Cells[3].Value = "1";
                }
            }
        }
    }
}
