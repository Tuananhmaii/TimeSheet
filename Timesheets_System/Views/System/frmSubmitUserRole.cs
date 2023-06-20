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
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace Timesheets_System.Views.Permission
{
    public partial class frmSubmitUserRole : Form
    {
        AuthGroupController _authGroupAuthController = new AuthGroupController();
        UserController _userController = new UserController();
        string selectedUsername;
        public frmSubmitUserRole(string username, string fullname, string role)
        {
            InitializeComponent();
            TitleBarManager titleBarManager = new TitleBarManager(panel2, pn_Minimize, pn_Maximize, pn_Close);
            lblName.Text = fullname;
            cbRole.DataSource = _authGroupAuthController.GetAuthGroupDTO();
            cbRole.DisplayMember = "auth_group_name";
            cbRole.ValueMember = "auth_group_id";
            cbRole.SelectedValue = role;
            selectedUsername = username;

        }
        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                _userController.UpdateAuth_Group_ID(selectedUsername, cbRole.SelectedValue.ToString());
                MessageBox.Show("Thành công!");
                this.Close();
            }
            catch
            {
                MessageBox.Show("Có lỗi xảy ra!");
            }
        }
    }
}
