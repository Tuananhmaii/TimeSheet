namespace Timesheets_System.Views
{
    partial class frmMenu
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMenu));
            this.ms_Menu = new System.Windows.Forms.MenuStrip();
            this.tsmi_Personal = new System.Windows.Forms.ToolStripMenuItem();
            this.frmUserDetail = new System.Windows.Forms.ToolStripMenuItem();
            this.frmPersonalTimesheet = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmi_Personnel = new System.Windows.Forms.ToolStripMenuItem();
            this.frmUserList = new System.Windows.Forms.ToolStripMenuItem();
            this.frmDepartment = new System.Windows.Forms.ToolStripMenuItem();
            this.frmTeam = new System.Windows.Forms.ToolStripMenuItem();
            this.frmTimesheets = new System.Windows.Forms.ToolStripMenuItem();
            this.frmRequest = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmi_Report = new System.Windows.Forms.ToolStripMenuItem();
            this.frmGeneralTimeSheetReport = new System.Windows.Forms.ToolStripMenuItem();
            this.frmIndividualTimeSheetReport = new System.Windows.Forms.ToolStripMenuItem();
            this.tsmi_System = new System.Windows.Forms.ToolStripMenuItem();
            this.frmPermissionGrant = new System.Windows.Forms.ToolStripMenuItem();
            this.frmFunction = new System.Windows.Forms.ToolStripMenuItem();
            this.frmChangePassword = new System.Windows.Forms.ToolStripMenuItem();
            this.frmLogout = new System.Windows.Forms.ToolStripMenuItem();
            this.Panel2 = new System.Windows.Forms.Panel();
            this.lbl_Username = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel8 = new System.Windows.Forms.Panel();
            this.btnMinimize = new System.Windows.Forms.Button();
            this.panel7 = new System.Windows.Forms.Panel();
            this.btnMaximize = new System.Windows.Forms.Button();
            this.panel6 = new System.Windows.Forms.Panel();
            this.btnClose = new System.Windows.Forms.Button();
            this.ms_Menu.SuspendLayout();
            this.Panel2.SuspendLayout();
            this.panel1.SuspendLayout();
            this.panel8.SuspendLayout();
            this.panel7.SuspendLayout();
            this.panel6.SuspendLayout();
            this.SuspendLayout();
            // 
            // ms_Menu
            // 
            this.ms_Menu.AutoSize = false;
            this.ms_Menu.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.ms_Menu.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ms_Menu.Font = new System.Drawing.Font("Segoe UI Semilight", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ms_Menu.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.ms_Menu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tsmi_Personal,
            this.tsmi_Personnel,
            this.tsmi_Report,
            this.tsmi_System});
            this.ms_Menu.Location = new System.Drawing.Point(0, 0);
            this.ms_Menu.Name = "ms_Menu";
            this.ms_Menu.Padding = new System.Windows.Forms.Padding(5, 2, 0, 2);
            this.ms_Menu.Size = new System.Drawing.Size(1170, 44);
            this.ms_Menu.TabIndex = 32;
            this.ms_Menu.Text = "menuStrip1";
            this.ms_Menu.MouseDown += new System.Windows.Forms.MouseEventHandler(this.ms_Menu_MouseDown);
            // 
            // tsmi_Personal
            // 
            this.tsmi_Personal.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.frmUserDetail,
            this.frmPersonalTimesheet});
            this.tsmi_Personal.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.tsmi_Personal.Name = "tsmi_Personal";
            this.tsmi_Personal.Size = new System.Drawing.Size(93, 40);
            this.tsmi_Personal.Text = "Cá nhân";
            // 
            // frmUserDetail
            // 
            this.frmUserDetail.Name = "frmUserDetail";
            this.frmUserDetail.Size = new System.Drawing.Size(255, 30);
            this.frmUserDetail.Text = "Thông tin cá nhân";
            this.frmUserDetail.Click += new System.EventHandler(this.frmPersonalInfo_Click);
            // 
            // frmPersonalTimesheet
            // 
            this.frmPersonalTimesheet.Name = "frmPersonalTimesheet";
            this.frmPersonalTimesheet.Size = new System.Drawing.Size(255, 30);
            this.frmPersonalTimesheet.Text = "Bảng công cá nhân";
            this.frmPersonalTimesheet.Click += new System.EventHandler(this.frmPersonalTimesheet_Click);
            // 
            // tsmi_Personnel
            // 
            this.tsmi_Personnel.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.frmUserList,
            this.frmDepartment,
            this.frmTeam,
            this.frmTimesheets,
            this.frmRequest});
            this.tsmi_Personnel.Name = "tsmi_Personnel";
            this.tsmi_Personnel.Size = new System.Drawing.Size(94, 40);
            this.tsmi_Personnel.Text = "Nhân sự";
            // 
            // frmUserList
            // 
            this.frmUserList.Name = "frmUserList";
            this.frmUserList.Size = new System.Drawing.Size(266, 30);
            this.frmUserList.Text = "Danh sách nhân viên";
            this.frmUserList.Click += new System.EventHandler(this.frmEmployeeList_Click);
            // 
            // frmDepartment
            // 
            this.frmDepartment.Name = "frmDepartment";
            this.frmDepartment.Size = new System.Drawing.Size(266, 30);
            this.frmDepartment.Text = "Danh sách bộ phận";
            this.frmDepartment.Click += new System.EventHandler(this.frmDepartment_Click);
            // 
            // frmTeam
            // 
            this.frmTeam.Name = "frmTeam";
            this.frmTeam.Size = new System.Drawing.Size(266, 30);
            this.frmTeam.Text = "Danh sách team";
            this.frmTeam.Click += new System.EventHandler(this.frmTeam_Click);
            // 
            // frmTimesheets
            // 
            this.frmTimesheets.Name = "frmTimesheets";
            this.frmTimesheets.Size = new System.Drawing.Size(266, 30);
            this.frmTimesheets.Text = "Bảng công";
            this.frmTimesheets.Click += new System.EventHandler(this.frmTimesheets_Click);
            // 
            // frmRequest
            // 
            this.frmRequest.Name = "frmRequest";
            this.frmRequest.Size = new System.Drawing.Size(266, 30);
            this.frmRequest.Text = "Yêu cầu";
            // 
            // tsmi_Report
            // 
            this.tsmi_Report.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.frmGeneralTimeSheetReport,
            this.frmIndividualTimeSheetReport});
            this.tsmi_Report.Name = "tsmi_Report";
            this.tsmi_Report.Size = new System.Drawing.Size(93, 40);
            this.tsmi_Report.Text = "Báo cáo";
            // 
            // frmGeneralTimeSheetReport
            // 
            this.frmGeneralTimeSheetReport.Name = "frmGeneralTimeSheetReport";
            this.frmGeneralTimeSheetReport.Size = new System.Drawing.Size(234, 30);
            this.frmGeneralTimeSheetReport.Text = "Báo cáo chung";
            this.frmGeneralTimeSheetReport.Click += new System.EventHandler(this.frmGeneralTimeSheetReport_Click);
            // 
            // frmIndividualTimeSheetReport
            // 
            this.frmIndividualTimeSheetReport.Name = "frmIndividualTimeSheetReport";
            this.frmIndividualTimeSheetReport.Size = new System.Drawing.Size(234, 30);
            this.frmIndividualTimeSheetReport.Text = "Báo cáo cá nhân";
            this.frmIndividualTimeSheetReport.Click += new System.EventHandler(this.frmIndividualTimeSheetReport_Click);
            // 
            // tsmi_System
            // 
            this.tsmi_System.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.frmPermissionGrant,
            this.frmFunction,
            this.frmChangePassword,
            this.frmLogout});
            this.tsmi_System.Name = "tsmi_System";
            this.tsmi_System.Size = new System.Drawing.Size(102, 40);
            this.tsmi_System.Text = "Hệ thống";
            // 
            // frmPermissionGrant
            // 
            this.frmPermissionGrant.Name = "frmPermissionGrant";
            this.frmPermissionGrant.Size = new System.Drawing.Size(224, 30);
            this.frmPermissionGrant.Text = "Phân quyền";
            this.frmPermissionGrant.Click += new System.EventHandler(this.frmPermissionGrant_Click);
            // 
            // frmFunction
            // 
            this.frmFunction.Name = "frmFunction";
            this.frmFunction.Size = new System.Drawing.Size(224, 30);
            this.frmFunction.Text = "Chức năng";
            // 
            // frmChangePassword
            // 
            this.frmChangePassword.Name = "frmChangePassword";
            this.frmChangePassword.Size = new System.Drawing.Size(224, 30);
            this.frmChangePassword.Text = "Đổi mật khẩu";
            this.frmChangePassword.Click += new System.EventHandler(this.frmChangPassword_Click);
            // 
            // frmLogout
            // 
            this.frmLogout.Name = "frmLogout";
            this.frmLogout.Size = new System.Drawing.Size(224, 30);
            this.frmLogout.Text = "Đăng xuất";
            this.frmLogout.Click += new System.EventHandler(this.tsmi_Logout_Click);
            // 
            // Panel2
            // 
            this.Panel2.BackgroundImage = global::Timesheets_System.Properties.Resources.GolineBackground;
            this.Panel2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.Panel2.Controls.Add(this.lbl_Username);
            this.Panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Panel2.Location = new System.Drawing.Point(0, 0);
            this.Panel2.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Panel2.Name = "Panel2";
            this.Panel2.Size = new System.Drawing.Size(1281, 624);
            this.Panel2.TabIndex = 34;
            // 
            // lbl_Username
            // 
            this.lbl_Username.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbl_Username.AutoSize = true;
            this.lbl_Username.BackColor = System.Drawing.Color.Transparent;
            this.lbl_Username.Font = new System.Drawing.Font("Segoe UI Semilight", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_Username.ForeColor = System.Drawing.Color.Ivory;
            this.lbl_Username.Location = new System.Drawing.Point(15, 583);
            this.lbl_Username.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbl_Username.Name = "lbl_Username";
            this.lbl_Username.Size = new System.Drawing.Size(84, 23);
            this.lbl_Username.TabIndex = 0;
            this.lbl_Username.Text = "LOGGED: ";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.panel8);
            this.panel1.Controls.Add(this.ms_Menu);
            this.panel1.Controls.Add(this.panel7);
            this.panel1.Controls.Add(this.panel6);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1281, 44);
            this.panel1.TabIndex = 35;
            // 
            // panel8
            // 
            this.panel8.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.panel8.Controls.Add(this.btnMinimize);
            this.panel8.Dock = System.Windows.Forms.DockStyle.Right;
            this.panel8.Location = new System.Drawing.Point(1111, 0);
            this.panel8.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panel8.Name = "panel8";
            this.panel8.Size = new System.Drawing.Size(59, 44);
            this.panel8.TabIndex = 38;
            this.panel8.Click += new System.EventHandler(this.btnMinimize_Click);
            this.panel8.MouseEnter += new System.EventHandler(this.panel8_MouseEnter);
            this.panel8.MouseLeave += new System.EventHandler(this.panel8_MouseLeave);
            // 
            // btnMinimize
            // 
            this.btnMinimize.BackColor = System.Drawing.Color.Transparent;
            this.btnMinimize.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnMinimize.BackgroundImage")));
            this.btnMinimize.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnMinimize.Enabled = false;
            this.btnMinimize.FlatAppearance.BorderSize = 0;
            this.btnMinimize.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnMinimize.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnMinimize.ForeColor = System.Drawing.Color.Transparent;
            this.btnMinimize.Location = new System.Drawing.Point(17, 15);
            this.btnMinimize.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnMinimize.Name = "btnMinimize";
            this.btnMinimize.Size = new System.Drawing.Size(20, 18);
            this.btnMinimize.TabIndex = 4;
            this.btnMinimize.UseVisualStyleBackColor = false;
            // 
            // panel7
            // 
            this.panel7.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.panel7.Controls.Add(this.btnMaximize);
            this.panel7.Dock = System.Windows.Forms.DockStyle.Right;
            this.panel7.Location = new System.Drawing.Point(1170, 0);
            this.panel7.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panel7.Name = "panel7";
            this.panel7.Size = new System.Drawing.Size(56, 44);
            this.panel7.TabIndex = 37;
            this.panel7.Click += new System.EventHandler(this.btnMaximize_Click);
            this.panel7.MouseEnter += new System.EventHandler(this.panel7_MouseEnter);
            this.panel7.MouseLeave += new System.EventHandler(this.panel7_MouseLeave);
            // 
            // btnMaximize
            // 
            this.btnMaximize.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnMaximize.BackColor = System.Drawing.Color.Transparent;
            this.btnMaximize.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnMaximize.BackgroundImage")));
            this.btnMaximize.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnMaximize.Enabled = false;
            this.btnMaximize.FlatAppearance.BorderSize = 0;
            this.btnMaximize.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnMaximize.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnMaximize.ForeColor = System.Drawing.Color.Transparent;
            this.btnMaximize.Location = new System.Drawing.Point(16, 15);
            this.btnMaximize.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnMaximize.Name = "btnMaximize";
            this.btnMaximize.Size = new System.Drawing.Size(20, 18);
            this.btnMaximize.TabIndex = 3;
            this.btnMaximize.UseVisualStyleBackColor = false;
            // 
            // panel6
            // 
            this.panel6.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.panel6.Controls.Add(this.btnClose);
            this.panel6.Dock = System.Windows.Forms.DockStyle.Right;
            this.panel6.Location = new System.Drawing.Point(1226, 0);
            this.panel6.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panel6.Name = "panel6";
            this.panel6.Size = new System.Drawing.Size(55, 44);
            this.panel6.TabIndex = 36;
            this.panel6.Click += new System.EventHandler(this.btnClose_Click);
            this.panel6.MouseEnter += new System.EventHandler(this.panel6_MouseEnter);
            this.panel6.MouseLeave += new System.EventHandler(this.panel6_MouseLeave);
            // 
            // btnClose
            // 
            this.btnClose.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnClose.BackColor = System.Drawing.Color.Transparent;
            this.btnClose.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnClose.BackgroundImage")));
            this.btnClose.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.btnClose.Enabled = false;
            this.btnClose.FlatAppearance.BorderSize = 0;
            this.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClose.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnClose.ForeColor = System.Drawing.Color.Transparent;
            this.btnClose.Location = new System.Drawing.Point(19, 15);
            this.btnClose.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(20, 18);
            this.btnClose.TabIndex = 2;
            this.btnClose.UseVisualStyleBackColor = false;
            // 
            // frmMenu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1281, 624);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.Panel2);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "frmMenu";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmMenu";
            this.Load += new System.EventHandler(this.frmMenu_Load);
            this.ms_Menu.ResumeLayout(false);
            this.ms_Menu.PerformLayout();
            this.Panel2.ResumeLayout(false);
            this.Panel2.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel8.ResumeLayout(false);
            this.panel7.ResumeLayout(false);
            this.panel6.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        internal System.Windows.Forms.Panel Panel2;
        internal System.Windows.Forms.Label lbl_Username;
        private System.Windows.Forms.MenuStrip ms_Menu;
        private System.Windows.Forms.ToolStripMenuItem tsmi_Personal;
        private System.Windows.Forms.ToolStripMenuItem frmUserDetail;
        private System.Windows.Forms.ToolStripMenuItem frmPersonalTimesheet;
        private System.Windows.Forms.ToolStripMenuItem tsmi_Personnel;
        private System.Windows.Forms.ToolStripMenuItem frmUserList;
        private System.Windows.Forms.ToolStripMenuItem frmTimesheets;
        internal System.Windows.Forms.ToolStripMenuItem frmRequest;
        private System.Windows.Forms.ToolStripMenuItem tsmi_Report;
        private System.Windows.Forms.ToolStripMenuItem tsmi_System;
        private System.Windows.Forms.ToolStripMenuItem frmPermissionGrant;
        internal System.Windows.Forms.ToolStripMenuItem frmChangePassword;
        private System.Windows.Forms.ToolStripMenuItem frmLogout;
        private System.Windows.Forms.ToolStripMenuItem frmDepartment;
        private System.Windows.Forms.ToolStripMenuItem frmTeam;
        private System.Windows.Forms.ToolStripMenuItem frmFunction;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel8;
        private System.Windows.Forms.Button btnMinimize;
        private System.Windows.Forms.Panel panel7;
        private System.Windows.Forms.Button btnMaximize;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.ToolStripMenuItem frmGeneralTimeSheetReport;
        private System.Windows.Forms.ToolStripMenuItem frmIndividualTimeSheetReport;
    }
}