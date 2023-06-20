using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Documents;
using System.Windows.Forms;
using Timesheets_System.Common.Const;
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Views
{
    public partial class frmTeam : Form
    {
        TeamController _teamController = new TeamController();
        DepartmentController _departmentController = new DepartmentController();

        public frmTeam()
        {
            InitializeComponent();
            TitleBarManager titleBarManager = new TitleBarManager(TopBar, pn_Minimize, pn_Maximize, pn_Close);
            Load();
            AddBinding();
        }

        // Cho phép nhập input
        private void EnableTextbox()
        {
            txbTeamId.Enabled = true;
            txbTeamName.Enabled = true;
            cbDepartmentID.Enabled = true;
        }

        // Clear data input
        private void ClearTextbox()
        {
            txbTeamId.Clear();
            txbTeamName.Clear();
        }

        // Load form và set nút bấm về trạng thái bth
        private void Load()
        {
            var list = _teamController.GetTeamDTO();
            var department = _departmentController.GetDepartmentDTO();

            dtvgTeam.AutoGenerateColumns = false;
            dtvgTeam.DataSource = list;
            cbDepartmentID.DataSource = department;
            cbDepartmentID.DisplayMember = "Department_id";
            cbDepartmentID.ValueMember = "Department_id";

            txbTeamId.Enabled = false;
            txbTeamName.Enabled = false;
            cbDepartmentID.Enabled = false;
            btAdd.Text = "Thêm";
            btDelete.Text = "Xóa";
            btEdit.Visible = true;
            dtvgTeam.Enabled = true;

        }

        // Bind data vào input
        private void AddBinding()
        {
            txbTeamId.DataBindings.Add(new Binding("Text", dtvgTeam.DataSource, "Team_id"));
            txbTeamName.DataBindings.Add(new Binding("Text", dtvgTeam.DataSource, "Team_name"));
            cbDepartmentID.DataBindings.Add(new Binding("Text", dtvgTeam.DataSource, "Department_id"));

        }

        private void ReBind()
        {
            txbTeamId.DataBindings.Clear();
            txbTeamName.DataBindings.Clear();
            cbDepartmentID.DataBindings.Clear();

            txbTeamId.DataBindings.Add(new Binding("Text", dtvgTeam.DataSource, "Team_id"));
            txbTeamName.DataBindings.Add(new Binding("Text", dtvgTeam.DataSource, "Team_name"));
            cbDepartmentID.DataBindings.Add(new Binding("Text", dtvgTeam.DataSource, "Department_id"));

        }

        // Check xem người dùng đã nhập đủ data
        private bool EnterFullInformation()
        {
            if (String.IsNullOrEmpty(txbTeamId.Text) || String.IsNullOrEmpty(cbDepartmentID.Text)
                || String.IsNullOrEmpty(txbTeamName.Text))
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            return true;
        }

        private void btAdd_Click_1(object sender, EventArgs e)
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
                    TeamDTO team = new TeamDTO();
                    team.Team_id = txbTeamId.Text;
                    team.Team_name = txbTeamName.Text;
                    team.Department_id = cbDepartmentID.Text;
                    _teamController.UpdateTeamDTO(team);
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
                    if (_teamController.checkExistTeamID(txbTeamId.Text).Count > 0)
                    {
                        MessageBox.Show("Team ID đã được sử dụng, xin hãy thử lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                    else
                    {
                        TeamDTO team = new TeamDTO();
                        team.Team_id = txbTeamId.Text;
                        team.Team_name = txbTeamName.Text;
                        team.Department_id = cbDepartmentID.Text;
                        _teamController.AddTeamDTO(team);
                        Load();
                        ReBind();
                    }
                }
            }
        }

        private void btEdit_Click_1(object sender, EventArgs e)
        {
            EnableTextbox();
            txbTeamId.Enabled = false;
            btAdd.Text = "Cập nhật";
            btDelete.Text = "Hủy";
            btEdit.Visible = false;

            int selectedIndex = dtvgTeam.CurrentRow.Index;

            foreach (DataGridViewRow row in dtvgTeam.Rows)
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
            dtvgTeam.Enabled = false;

        }

        private void btDelete_Click_1(object sender, EventArgs e)
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
                var list = _teamController.checkUsedTeamID(txbTeamId.Text);
                if (list.Count != 0)
                {
                    MessageBox.Show("Đang có nhân viên thuộc team này, vui lòng thử lại sau.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                _teamController.DeleteTeamByID(txbTeamId.Text);
                Load();
                ReBind();
            }
        }
    }
}
