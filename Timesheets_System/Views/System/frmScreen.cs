using System.Windows.Forms;
using System;
using Timesheets_System.Controllers;

namespace Timesheets_System.Views.Screen
{
    public partial class frmScreen : Form
    {
        ScreenAuthController _screenAuthController = new ScreenAuthController();
        AuthGroupController _authGroupAuthController = new AuthGroupController();
        private string selectedRoleId; // Store the selected role ID

        public frmScreen()
        {
            InitializeComponent();
            LoadComboBox();
            Load();
        }

        private void LoadComboBox()
        {
            cbRole.DataSource = _authGroupAuthController.GetAuthGroupDTO();
            cbRole.DisplayMember = "auth_group_name";
            cbRole.ValueMember = "auth_group_id";
        }

        private void LoadScreenRoles()
        {
            dtgvScreen.DataSource = _screenAuthController.GetScreenRoles(selectedRoleId);
        }

        private void Load()
        {
            selectedRoleId = cbRole.SelectedValue.ToString(); 
            LoadScreenRoles(); // Populate the DataGridView
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < dtgvScreen.Rows.Count; i++)
            {
                string permission = dtgvScreen.Rows[i].Cells["Permission"].Value.ToString();

                _screenAuthController.UpdateAllowScreenAuth(dtgvScreen.Rows[i].Cells[2].Value.ToString(),
                    cbRole.SelectedValue.ToString(), permission);
            }
            MessageBox.Show("Cập nhật thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            LoadScreenRoles(); // Refresh the DataGridView
            cbRole.SelectedValue = selectedRoleId; // Set the selected role ID back to the ComboBox
        }

        private void cbRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedRoleId = cbRole.SelectedValue.ToString(); // Update the selected role ID
            LoadScreenRoles(); // Populate the DataGridView based on the new role selection
        }
    }
}