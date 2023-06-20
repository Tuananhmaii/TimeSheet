namespace Timesheets_System.Views.Screen
{
    partial class frmScreen
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle11 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle12 = new System.Windows.Forms.DataGridViewCellStyle();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnSave = new System.Windows.Forms.Button();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel4 = new System.Windows.Forms.Panel();
            this.panel3 = new System.Windows.Forms.Panel();
            this.cbRole = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.panel5 = new System.Windows.Forms.Panel();
            this.panel6 = new System.Windows.Forms.Panel();
            this.dtgvScreen = new System.Windows.Forms.DataGridView();
            this.Screen_ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Screen_name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Permission = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.Admin = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.User = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Auth_Group_ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel6.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvScreen)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btnSave);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 406);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(800, 44);
            this.panel1.TabIndex = 0;
            // 
            // btnSave
            // 
            this.btnSave.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnSave.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(166)))), ((int)(((byte)(235)))));
            this.btnSave.FlatAppearance.BorderSize = 0;
            this.btnSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSave.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSave.ForeColor = System.Drawing.Color.Transparent;
            this.btnSave.Location = new System.Drawing.Point(665, 10);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(104, 22);
            this.btnSave.TabIndex = 22;
            this.btnSave.Text = "LƯU";
            this.btnSave.UseVisualStyleBackColor = false;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.panel6);
            this.panel2.Controls.Add(this.panel5);
            this.panel2.Controls.Add(this.panel4);
            this.panel2.Controls.Add(this.panel3);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(800, 406);
            this.panel2.TabIndex = 24;
            // 
            // panel4
            // 
            this.panel4.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel4.Location = new System.Drawing.Point(0, 41);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(31, 365);
            this.panel4.TabIndex = 9;
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.cbRole);
            this.panel3.Controls.Add(this.label1);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel3.Location = new System.Drawing.Point(0, 0);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(800, 41);
            this.panel3.TabIndex = 8;
            // 
            // cbRole
            // 
            this.cbRole.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbRole.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbRole.FormattingEnabled = true;
            this.cbRole.Location = new System.Drawing.Point(171, 8);
            this.cbRole.Margin = new System.Windows.Forms.Padding(2);
            this.cbRole.Name = "cbRole";
            this.cbRole.Size = new System.Drawing.Size(134, 27);
            this.cbRole.TabIndex = 6;
            this.cbRole.SelectedIndexChanged += new System.EventHandler(this.cbRole_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(27, 11);
            this.label1.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(130, 20);
            this.label1.TabIndex = 7;
            this.label1.Text = "Nhóm người dùng";
            // 
            // panel5
            // 
            this.panel5.Dock = System.Windows.Forms.DockStyle.Right;
            this.panel5.Location = new System.Drawing.Point(769, 41);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(31, 365);
            this.panel5.TabIndex = 11;
            // 
            // panel6
            // 
            this.panel6.Controls.Add(this.dtgvScreen);
            this.panel6.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel6.Location = new System.Drawing.Point(31, 41);
            this.panel6.Name = "panel6";
            this.panel6.Size = new System.Drawing.Size(738, 365);
            this.panel6.TabIndex = 12;
            // 
            // dtgvScreen
            // 
            this.dtgvScreen.AllowDrop = true;
            this.dtgvScreen.BackgroundColor = System.Drawing.SystemColors.ControlLightLight;
            dataGridViewCellStyle10.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle10.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle10.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle10.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle10.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle10.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle10.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dtgvScreen.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle10;
            this.dtgvScreen.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvScreen.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Screen_ID,
            this.Screen_name,
            this.Permission,
            this.Admin,
            this.User,
            this.Auth_Group_ID});
            this.dtgvScreen.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtgvScreen.Location = new System.Drawing.Point(0, 0);
            this.dtgvScreen.Name = "dtgvScreen";
            this.dtgvScreen.RowHeadersVisible = false;
            this.dtgvScreen.RowHeadersWidth = 51;
            this.dtgvScreen.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgvScreen.Size = new System.Drawing.Size(738, 365);
            this.dtgvScreen.TabIndex = 11;
            // 
            // Screen_ID
            // 
            this.Screen_ID.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.Screen_ID.DataPropertyName = "Screen_ID";
            this.Screen_ID.HeaderText = "Screen_ID";
            this.Screen_ID.MinimumWidth = 6;
            this.Screen_ID.Name = "Screen_ID";
            this.Screen_ID.Visible = false;
            this.Screen_ID.Width = 200;
            // 
            // Screen_name
            // 
            this.Screen_name.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Screen_name.DataPropertyName = "Screen_name";
            dataGridViewCellStyle11.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Screen_name.DefaultCellStyle = dataGridViewCellStyle11;
            this.Screen_name.HeaderText = "Màn hình";
            this.Screen_name.MinimumWidth = 6;
            this.Screen_name.Name = "Screen_name";
            this.Screen_name.ReadOnly = true;
            // 
            // Permission
            // 
            this.Permission.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.Permission.DataPropertyName = "allowed_to_open";
            dataGridViewCellStyle12.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle12.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle12.NullValue = false;
            this.Permission.DefaultCellStyle = dataGridViewCellStyle12;
            this.Permission.FalseValue = "0";
            this.Permission.HeaderText = "Permission";
            this.Permission.MinimumWidth = 6;
            this.Permission.Name = "Permission";
            this.Permission.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Permission.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            this.Permission.TrueValue = "1";
            this.Permission.Width = 125;
            // 
            // Admin
            // 
            this.Admin.DataPropertyName = "Admin";
            this.Admin.HeaderText = "Admin";
            this.Admin.MinimumWidth = 6;
            this.Admin.Name = "Admin";
            this.Admin.Visible = false;
            this.Admin.Width = 125;
            // 
            // User
            // 
            this.User.DataPropertyName = "User";
            this.User.HeaderText = "User";
            this.User.MinimumWidth = 6;
            this.User.Name = "User";
            this.User.ReadOnly = true;
            this.User.Visible = false;
            this.User.Width = 125;
            // 
            // Auth_Group_ID
            // 
            this.Auth_Group_ID.DataPropertyName = "Auth_Group_ID";
            this.Auth_Group_ID.HeaderText = "Auth_Group_ID";
            this.Auth_Group_ID.MinimumWidth = 6;
            this.Auth_Group_ID.Name = "Auth_Group_ID";
            this.Auth_Group_ID.ReadOnly = true;
            this.Auth_Group_ID.Visible = false;
            this.Auth_Group_ID.Width = 125;
            // 
            // frmScreen
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Name = "frmScreen";
            this.Text = "frmScreen";
            this.panel1.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel6.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dtgvScreen)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbRole;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.DataGridView dtgvScreen;
        private System.Windows.Forms.DataGridViewTextBoxColumn Screen_ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn Screen_name;
        private System.Windows.Forms.DataGridViewCheckBoxColumn Permission;
        private System.Windows.Forms.DataGridViewTextBoxColumn Admin;
        private System.Windows.Forms.DataGridViewTextBoxColumn User;
        private System.Windows.Forms.DataGridViewTextBoxColumn Auth_Group_ID;
        private System.Windows.Forms.Panel panel5;
    }
}