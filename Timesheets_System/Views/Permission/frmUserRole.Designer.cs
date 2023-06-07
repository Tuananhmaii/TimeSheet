namespace Timesheets_System.Views.Screen
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnSave = new System.Windows.Forms.Button();
            this.dtgvScreen = new System.Windows.Forms.DataGridView();
            this.Username = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Fullname = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this._isAdmin = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this._isUser = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvScreen)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btnSave);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 395);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(800, 55);
            this.panel1.TabIndex = 1;
            // 
            // btnSave
            // 
            this.btnSave.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnSave.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(166)))), ((int)(((byte)(235)))));
            this.btnSave.FlatAppearance.BorderSize = 0;
            this.btnSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSave.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSave.ForeColor = System.Drawing.Color.Transparent;
            this.btnSave.Location = new System.Drawing.Point(670, 14);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(104, 31);
            this.btnSave.TabIndex = 22;
            this.btnSave.Text = "LƯU";
            this.btnSave.UseVisualStyleBackColor = false;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
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
            this._isUser});
            this.dtgvScreen.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtgvScreen.Location = new System.Drawing.Point(0, 0);
            this.dtgvScreen.Name = "dtgvScreen";
            this.dtgvScreen.RowHeadersVisible = false;
            this.dtgvScreen.RowHeadersWidth = 51;
            this.dtgvScreen.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgvScreen.Size = new System.Drawing.Size(800, 395);
            this.dtgvScreen.TabIndex = 2;
            this.dtgvScreen.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgvScreen_CellContentClick);
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
            this.Fullname.HeaderText = "Họ tên";
            this.Fullname.Name = "Fullname";
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
            this._isUser.Width = 125;
            // 
            // frmUserRole
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.dtgvScreen);
            this.Controls.Add(this.panel1);
            this.Name = "frmUserRole";
            this.Text = "frmUserRole";
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dtgvScreen)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.DataGridView dtgvScreen;
        private System.Windows.Forms.DataGridViewTextBoxColumn Username;
        private System.Windows.Forms.DataGridViewTextBoxColumn Fullname;
        private System.Windows.Forms.DataGridViewCheckBoxColumn _isAdmin;
        private System.Windows.Forms.DataGridViewCheckBoxColumn _isUser;
    }
}