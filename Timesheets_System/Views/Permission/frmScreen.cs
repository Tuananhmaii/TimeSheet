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
        public frmScreen()
        {
            InitializeComponent();
            Load();
        }

        private void Load()
        {
            dtgvScreen.DataSource = _screenAuthController.GetScreenRoles();
            dtgvScreen.Columns["Auth_Group_ID"].Visible = false;
            dtgvScreen.Columns["Allowed_To_Open"].Visible = false;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < dtgvScreen.Rows.Count; i++)
            {
                if (dtgvScreen.Rows[i].Cells["Admin"].Value == null && dtgvScreen.Rows[i].Cells["User"].Value == null)
                {
                    return;
                }
                else
                {
                    if (dtgvScreen.Rows[i].Cells["Admin"].Value.ToString() == "0" || dtgvScreen.Rows[i].Cells["Admin"].Value.ToString() == "1")
                    {
                        _screenAuthController.UpdateAllowScreenAuth(dtgvScreen.Rows[i].Cells[2].Value.ToString(), "Admin",
                            dtgvScreen.Rows[i].Cells["Admin"].Value.ToString());
                    }

                    if (dtgvScreen.Rows[i].Cells["User"].Value.ToString() == "0" || dtgvScreen.Rows[i].Cells["User"].Value.ToString() == "1")
                    {
                        _screenAuthController.UpdateAllowScreenAuth(dtgvScreen.Rows[i].Cells[2].Value.ToString(), "User",
                            dtgvScreen.Rows[i].Cells["User"].Value.ToString());
                    }
                }
            }
            MessageBox.Show("Cập nhật thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            Load();
        }
    }
}
