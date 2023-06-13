using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Interop;
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Views.Screen
{
    public partial class frmScreen : Form
    {
        ScreenAuthController _screenAuthController = new ScreenAuthController();
        AuthGroupController _authGroupAuthController = new AuthGroupController();
        public frmScreen()
        {
            InitializeComponent();
            Load();
            ShowData();
        }

        private void Load()
        {
            dtgvScreen.DataSource = _screenAuthController.GetScreenRoles("Admin");
            cbRole.DataSource = _authGroupAuthController.GetAuthGroupDTO();
            cbRole.DisplayMember = "auth_group_name";
            cbRole.ValueMember = "auth_group_id";
            
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < dtgvScreen.Rows.Count; i++)
            {
                if (dtgvScreen.Rows[i].Cells["Permission"].Value.ToString() == "1")
                {
                    _screenAuthController.UpdateAllowScreenAuth(dtgvScreen.Rows[i].Cells[2].Value.ToString(),
                        cbRole.SelectedValue.ToString(), "1");
                }

                if (dtgvScreen.Rows[i].Cells["Permission"].Value.ToString() == "0")
                {
                    _screenAuthController.UpdateAllowScreenAuth(dtgvScreen.Rows[i].Cells[2].Value.ToString(),
                            cbRole.SelectedValue.ToString(), "0");
                }
            }
            MessageBox.Show("Cập nhật thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            Load();
        }

        private void ShowData()
        {
            dtgvScreen.DataSource = _screenAuthController.GetScreenRoles(cbRole.SelectedValue.ToString());
        }

        private void cbRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowData();
        }
    }
}
