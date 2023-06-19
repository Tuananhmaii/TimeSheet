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
            TitleBarManager titleBarManager = new TitleBarManager(TopBar, pn_Minimize, pn_Maximize, pn_Close);
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
            if (String.IsNullOrEmpty(txbDepartmentID.Text) || String.IsNullOrEmpty(txbDepartmentName.Text))
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
                var list = _departmentController.checkUsedDepartmentID(txbDepartmentID.Text);
                if (list.Count != 0)
                {
                    MessageBox.Show("Đang có team thuộc bộ phận này, vui lòng thử lại sau.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                else {
                    _departmentController.DeleteDepartmentByID(txbDepartmentID.Text);
                    Load();
                    ReBind();
                }
            }
        }
    }
}
