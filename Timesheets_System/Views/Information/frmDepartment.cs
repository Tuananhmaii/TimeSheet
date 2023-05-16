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
using System.Windows.Forms;
using Timesheets_System.Common.Const;
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Views
{
    public partial class frmDepartment : Form
    {
        DepartmentController _departmentController = new DepartmentController();

        public frmDepartment()
        {
            InitializeComponent();
            Load();
            AddBinding();
        }

        // Cho phép nhập input
        private void EnableTextbox()
        {
            txbDepartmentID.Enabled = true;
            txbDepartmentName.Enabled = true;
            txbDescription.Enabled = true;
        }

        // Clear data input
        private void ClearTextbox()
        {
            txbDepartmentID.Clear();
            txbDepartmentName.Clear();
            txbDescription.Clear();
        }

        // Load form và set nút bấm về trạng thái bth
        private void Load()
        {
            var list = _departmentController.GetDepartmentDTO();
            dtvgDepartment.DataSource = list;

            txbDepartmentID.Enabled = false;
            txbDepartmentName.Enabled = false;
            txbDescription.Enabled = false;
            btAdd.Text = "Thêm";
            btDelete.Text = "Xóa";
            btEdit.Visible = true;
            dtvgDepartment.Enabled = true;
        }

        // Bind data vào input
        private void AddBinding()
        {
            txbDepartmentID.DataBindings.Add(new Binding("Text", dtvgDepartment.DataSource, "Department_id"));
            txbDepartmentName.DataBindings.Add(new Binding("Text", dtvgDepartment.DataSource, "Department_name"));
            txbDescription.DataBindings.Add(new Binding("Text", dtvgDepartment.DataSource, "Descriptions"));

        }

        private void ReBind()
        {
            txbDepartmentID.DataBindings.Clear();
            txbDepartmentName.DataBindings.Clear();
            txbDescription.DataBindings.Clear();

            txbDepartmentID.DataBindings.Add(new Binding("Text", dtvgDepartment.DataSource, "Department_id"));
            txbDepartmentName.DataBindings.Add(new Binding("Text", dtvgDepartment.DataSource, "Department_name"));
            txbDescription.DataBindings.Add(new Binding("Text", dtvgDepartment.DataSource, "Descriptions"));

        }

        // Check xem người dùng đã nhập đủ data
        private bool EnterFullInformation()
        {
            if (String.IsNullOrEmpty(txbDepartmentID.Text) || String.IsNullOrEmpty(txbDepartmentName.Text) ||
                String.IsNullOrEmpty(txbDescription.Text))
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            return true;
        }
        private void btAdd_Click(object sender, EventArgs e)
        {
            {
                if (btAdd.Text == "Thêm")
                {
                    EnableTextbox();
                    btAdd.Text = "Xác nhận";
                    btDelete.Text = "Hủy";
                    btEdit.Visible = false;
                    ClearTextbox();
                    return;
                }

                if (btAdd.Text == "Cập nhật")
                {
                    if (EnterFullInformation())
                    {
                        if (MessageBox.Show("Bạn có muốn thực hiện hành động này không", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) != DialogResult.OK)
                        {
                            return;
                        }
                        DepartmentDTO department = new DepartmentDTO();
                        department.Department_id = txbDepartmentID.Text;
                        department.Department_name = txbDepartmentName.Text;
                        department.Descriptions = txbDescription.Text;
                        _departmentController.UpdateDepartmentDTO(department);
                        Load();
                        ReBind();
                    }
                }
                else
                {
                    if (EnterFullInformation())
                    {
                        if (MessageBox.Show("Bạn có muốn thực hiện hành động này không", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) != DialogResult.OK)
                        {
                            return;
                        }
                        if (_departmentController.GetDepartmentDTO(txbDepartmentID.Text).Count > 0)
                        {
                            MessageBox.Show("Department ID đã được sử dụng, xin hãy thử lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            return;
                        }
                        else
                        {
                            DepartmentDTO department = new DepartmentDTO();
                            department.Department_id = txbDepartmentID.Text;
                            department.Department_name = txbDepartmentName.Text;
                            department.Descriptions = txbDescription.Text;
                            _departmentController.AddDepartmentDTO(department);
                            Load();
                            ReBind();
                        }
                    }
                }
            }
        }

        private void btEdit_Click(object sender, EventArgs e)
        {
            EnableTextbox();
            txbDepartmentID.Enabled = false;
            btAdd.Text = "Cập nhật";
            btDelete.Text = "Hủy";
            btEdit.Visible = false;

            int selectedIndex = dtvgDepartment.CurrentRow.Index;

            foreach (DataGridViewRow row in dtvgDepartment.Rows)
            {
                if (row.Index == selectedIndex)
                {
                    row.ReadOnly = false;
                }
                else
                {
                    row.Selected = false;
                    row.DefaultCellStyle.BackColor = Color.Gray;
                }
            }
            dtvgDepartment.Enabled = false;
        }

        private void btDelete_Click(object sender, EventArgs e)
        {
            if (btDelete.Text == "Hủy")
            {
                Load();
                ReBind();
                btEdit.Visible = true;
            }
            else
            {
                if (MessageBox.Show("Bạn có muốn thực hiện hành động này không", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) != DialogResult.OK)
                {
                    return;
                }
                _departmentController.DeleteDepartmentByID(txbDepartmentID.Text);
                Load();
                ReBind();
            }
        }

        #region "Custom title"
        private void panel2_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private static extern void ReleaseCapture();

        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private static extern void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);

        private void pn_Minimize_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void pn_Maximize_Click(object sender, EventArgs e)
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

        private void pn_Close_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void pn_Minimize_MouseEnter_1(object sender, EventArgs e)
        {
            pn_Minimize.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void pn_Minimize_MouseLeave_1(object sender, EventArgs e)
        {
            pn_Minimize.BackColor = COLORS.TITLE_BACKCOLOR;
        }

        private void pn_Maximize_MouseEnter_1(object sender, EventArgs e)
        {
            pn_Maximize.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void pn_Maximize_MouseLeave_1(object sender, EventArgs e)
        {
            pn_Maximize.BackColor = COLORS.TITLE_BACKCOLOR;
        }

        private void pn_Close_MouseEnter_1(object sender, EventArgs e)
        {
            pn_Close.BackColor = COLORS.TITLE_ENTERCOLOR;
            btnClose.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void pn_Close_MouseLeave_1(object sender, EventArgs e)
        {
            pn_Close.BackColor = COLORS.TITLE_BACKCOLOR;
            btnClose.BackColor = COLORS.TITLE_BACKCOLOR;
        }
        #endregion
        bool allowEdit = false;
        private void dtvgDepartment_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            e.Cancel = !allowEdit;
        }

    }
}
