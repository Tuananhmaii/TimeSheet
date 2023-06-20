using System.Windows.Forms;
using System;
using Timesheets_System.Controllers;
using System.Collections.Generic;
using System.Reflection;

namespace Timesheets_System.Views.Screen
{
    public partial class frmScreen : Form
    {
        ScreenAuthController _screenAuthController = new ScreenAuthController();
        AuthGroupController _authGroupAuthController = new AuthGroupController();
        private string selectedRoleId; 

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

        private void button1_Click(object sender, EventArgs e)
        {
            List<Type> formTypes = new List<Type>();
            Type formType = typeof(Form);

            foreach (Type type in Assembly.GetExecutingAssembly().GetTypes())
            {
                if (formType.IsAssignableFrom(type))
                {
                    formTypes.Add(type);
                }
            }

            // formTypes now contains a list of all the form types in your project
            foreach (Type form in formTypes)
            {
                _screenAuthController.InsertAllFormsIntoDb(form.Name, "");
                _screenAuthController.GrantAccessAllFormsToAdmin(form.Name);
                MessageBox.Show("Cập nhật màn hình thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                LoadScreenRoles();
                cbRole.SelectedValue = selectedRoleId;
            }
        }
    }
}