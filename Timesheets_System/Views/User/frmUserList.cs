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
using System.Windows.Controls.Primitives;
using System.Windows.Forms;
using Timesheets_System.Common.Const;
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Views.User
{
    public partial class frmUserList : Form
    {
        DepartmentController _departmentController = new DepartmentController();
        public frmUserList()
        {
            InitializeComponent();
            this.Text = string.Empty;
            this.ControlBox = false;
            this.MaximizedBounds = Screen.FromHandle(this.Handle).WorkingArea;
        }

        private void frmUserList_Load(object sender, EventArgs e)
        {
            tabPage1.Text = "Tất cả nhân viên";
            Show_All_Employees();
            Get_Tab();
            this.WindowState = FormWindowState.Maximized;
        }

        //Hàm tạo page
        private void createTab(DepartmentDTO department, string name)
        {
            // create a new tab page for the department
            TabPage tabPage = new TabPage(name);

            // add any controls to the tab page as needed
            frmDepartmentDetail frmDepartment = new frmDepartmentDetail(department.Department_id);
            frmDepartment.TopLevel = false;
            frmDepartment.AutoScroll = true;
            frmDepartment.FormBorderStyle = FormBorderStyle.None;
            frmDepartment.Dock = DockStyle.Fill;
            frmDepartment.Show();

            tabPage.Controls.Add(frmDepartment);

            // add the tab page to the tab control
            tabUserList.TabPages.Add(tabPage);
        }

        //Tạo các tab mới cho từng phòng
        private void Get_Tab()
        {
            List<DepartmentDTO> _departmentDTO = _departmentController.GetDepartmentDTO();
            int count = _departmentDTO.Count;
            Console.WriteLine(count);
            foreach (DepartmentDTO department in _departmentDTO)
            {
                if (department.Department_name != "Chưa có phòng")
                {
                    createTab(department, department.Department_name);
                }
                else
                {
                    createTab(department, "Tất cả nhân viên đã có phòng");
                }
            }
        }

        //Tab để hiển thị tất cả nhân viên
        private void Show_All_Employees()
        {
            frmDepartmentDetail frmDepartmentAll = new frmDepartmentDetail(tabPage1.Text);
            frmDepartmentAll.TopLevel = false;
            frmDepartmentAll.AutoScroll = true;
            frmDepartmentAll.FormBorderStyle = FormBorderStyle.None;
            frmDepartmentAll.Dock = DockStyle.Fill;
            frmDepartmentAll.Show();
            tabPage1.Controls.Add(frmDepartmentAll);
        }

        #region "Custom title"
        //Move form
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private static extern void ReleaseCapture();

        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private static extern void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void panel6_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void panel6_MouseEnter(object sender, EventArgs e)
        {
            panel6.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void panel6_MouseLeave(object sender, EventArgs e)
        {
            panel6.BackColor = COLORS.TITLE_BACKCOLOR;
        }

        private void panel7_Click(object sender, EventArgs e)
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

        private void panel7_MouseEnter(object sender, EventArgs e)
        {
            panel7.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void panel7_MouseLeave(object sender, EventArgs e)
        {
            panel7.BackColor = COLORS.TITLE_BACKCOLOR;
        }

        private void panel8_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void panel8_MouseEnter(object sender, EventArgs e)
        {
            panel8.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void panel8_MouseLeave(object sender, EventArgs e)
        {
            panel8.BackColor = COLORS.TITLE_BACKCOLOR;
        }
        #endregion

        
    }
}
