﻿namespace Timesheets_System.Views.Screen
{
    partial class frmUserRole
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dtgvScreen = new System.Windows.Forms.DataGridView();
            this.Username = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Fullname = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this._isAdmin = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this._isUser = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.Department_name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Team_name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Position_name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Auth_Group_ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvScreen)).BeginInit();
            this.SuspendLayout();
            // 
            // dtgvScreen
            // 
            this.dtgvScreen.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgvScreen.BackgroundColor = System.Drawing.SystemColors.ControlLightLight;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dtgvScreen.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dtgvScreen.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvScreen.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Username,
            this.Fullname,
            this._isAdmin,
            this._isUser,
            this.Department_name,
            this.Team_name,
            this.Position_name,
            this.Auth_Group_ID});
            this.dtgvScreen.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtgvScreen.Location = new System.Drawing.Point(0, 0);
            this.dtgvScreen.Name = "dtgvScreen";
            this.dtgvScreen.RowHeadersVisible = false;
            this.dtgvScreen.RowHeadersWidth = 51;
            this.dtgvScreen.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgvScreen.Size = new System.Drawing.Size(946, 462);
            this.dtgvScreen.TabIndex = 2;
            this.dtgvScreen.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgvScreen_CellDoubleClick);
            // 
            // Username
            // 
            this.Username.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Username.DataPropertyName = "Username";
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Username.DefaultCellStyle = dataGridViewCellStyle2;
            this.Username.HeaderText = "Tên tài khoản";
            this.Username.MinimumWidth = 6;
            this.Username.Name = "Username";
            this.Username.ReadOnly = true;
            // 
            // Fullname
            // 
            this.Fullname.DataPropertyName = "Fullname";
            this.Fullname.FillWeight = 130F;
            this.Fullname.HeaderText = "Họ tên";
            this.Fullname.Name = "Fullname";
            this.Fullname.ReadOnly = true;
            // 
            // _isAdmin
            // 
            this._isAdmin.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this._isAdmin.DataPropertyName = "_isAdmin";
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.NullValue = false;
            this._isAdmin.DefaultCellStyle = dataGridViewCellStyle3;
            this._isAdmin.FalseValue = "0";
            this._isAdmin.HeaderText = "Admin";
            this._isAdmin.MinimumWidth = 6;
            this._isAdmin.Name = "_isAdmin";
            this._isAdmin.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this._isAdmin.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this._isAdmin.TrueValue = "1";
            this._isAdmin.Visible = false;
            this._isAdmin.Width = 125;
            // 
            // _isUser
            // 
            this._isUser.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this._isUser.DataPropertyName = "_isUser";
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle4.NullValue = false;
            this._isUser.DefaultCellStyle = dataGridViewCellStyle4;
            this._isUser.FalseValue = "0";
            this._isUser.HeaderText = "User";
            this._isUser.MinimumWidth = 6;
            this._isUser.Name = "_isUser";
            this._isUser.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this._isUser.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this._isUser.TrueValue = "1";
            this._isUser.Visible = false;
            this._isUser.Width = 125;
            // 
            // Department_name
            // 
            this.Department_name.DataPropertyName = "Department_name";
            this.Department_name.HeaderText = "Bộ phận";
            this.Department_name.Name = "Department_name";
            this.Department_name.ReadOnly = true;
            // 
            // Team_name
            // 
            this.Team_name.DataPropertyName = "Team_name";
            this.Team_name.HeaderText = "Team";
            this.Team_name.Name = "Team_name";
            this.Team_name.ReadOnly = true;
            // 
            // Position_name
            // 
            this.Position_name.DataPropertyName = "Position_name";
            this.Position_name.HeaderText = "Chức vụ";
            this.Position_name.Name = "Position_name";
            this.Position_name.ReadOnly = true;
            // 
            // Auth_Group_ID
            // 
            this.Auth_Group_ID.DataPropertyName = "Auth_Group_ID";
            this.Auth_Group_ID.FillWeight = 120F;
            this.Auth_Group_ID.HeaderText = "Nhóm người dùng";
            this.Auth_Group_ID.Name = "Auth_Group_ID";
            this.Auth_Group_ID.ReadOnly = true;
            // 
            // frmUserRole
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(946, 462);
            this.Controls.Add(this.dtgvScreen);
            this.Name = "frmUserRole";
            this.Text = "frmUserRole";
            ((System.ComponentModel.ISupportInitialize)(this.dtgvScreen)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.DataGridView dtgvScreen;
        private System.Windows.Forms.DataGridViewTextBoxColumn Username;
        private System.Windows.Forms.DataGridViewTextBoxColumn Fullname;
        private System.Windows.Forms.DataGridViewCheckBoxColumn _isAdmin;
        private System.Windows.Forms.DataGridViewCheckBoxColumn _isUser;
        private System.Windows.Forms.DataGridViewTextBoxColumn Department_name;
        private System.Windows.Forms.DataGridViewTextBoxColumn Team_name;
        private System.Windows.Forms.DataGridViewTextBoxColumn Position_name;
        private System.Windows.Forms.DataGridViewTextBoxColumn Auth_Group_ID;
    }
}