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
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnCancle = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.dtgvScreen = new System.Windows.Forms.DataGridView();
            this.Screen_name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Screen_ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Admin = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.User = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvScreen)).BeginInit();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btnCancle);
            this.panel1.Controls.Add(this.btnSave);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 388);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(800, 62);
            this.panel1.TabIndex = 0;
            // 
            // btnCancle
            // 
            this.btnCancle.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCancle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(166)))), ((int)(((byte)(235)))));
            this.btnCancle.FlatAppearance.BorderSize = 0;
            this.btnCancle.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCancle.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCancle.ForeColor = System.Drawing.Color.Transparent;
            this.btnCancle.Location = new System.Drawing.Point(574, 19);
            this.btnCancle.Name = "btnCancle";
            this.btnCancle.Size = new System.Drawing.Size(104, 31);
            this.btnCancle.TabIndex = 23;
            this.btnCancle.Text = "HỦY";
            this.btnCancle.UseVisualStyleBackColor = false;
            // 
            // btnSave
            // 
            this.btnSave.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnSave.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(166)))), ((int)(((byte)(235)))));
            this.btnSave.FlatAppearance.BorderSize = 0;
            this.btnSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSave.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSave.ForeColor = System.Drawing.Color.Transparent;
            this.btnSave.Location = new System.Drawing.Point(684, 19);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(104, 31);
            this.btnSave.TabIndex = 22;
            this.btnSave.Text = "LƯU";
            this.btnSave.UseVisualStyleBackColor = false;
            // 
            // dtgvScreen
            // 
            this.dtgvScreen.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvScreen.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Screen_name,
            this.Screen_ID,
            this.Admin,
            this.User});
            this.dtgvScreen.Location = new System.Drawing.Point(0, 0);
            this.dtgvScreen.Name = "dtgvScreen";
            this.dtgvScreen.Size = new System.Drawing.Size(800, 388);
            this.dtgvScreen.TabIndex = 0;
            // 
            // Screen_name
            // 
            this.Screen_name.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.AllCells;
            this.Screen_name.DataPropertyName = "Screen_name";
            this.Screen_name.HeaderText = "Màn hình";
            this.Screen_name.Name = "Screen_name";
            this.Screen_name.Width = 76;
            // 
            // Screen_ID
            // 
            this.Screen_ID.DataPropertyName = "Screen_ID";
            this.Screen_ID.HeaderText = "Screen_ID";
            this.Screen_ID.Name = "Screen_ID";
            this.Screen_ID.Visible = false;
            // 
            // Admin
            // 
            this.Admin.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.Admin.DataPropertyName = "admin";
            this.Admin.HeaderText = "Admin";
            this.Admin.Name = "Admin";
            this.Admin.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Admin.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            // 
            // User
            // 
            this.User.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.User.DataPropertyName = "user";
            this.User.HeaderText = "User";
            this.User.Name = "User";
            this.User.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.User.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.dtgvScreen);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(800, 388);
            this.panel2.TabIndex = 24;
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
            this.Load += new System.EventHandler(this.frmScreen_Load);
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dtgvScreen)).EndInit();
            this.panel2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.DataGridView dtgvScreen;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Button btnCancle;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Screen_name;
        private System.Windows.Forms.DataGridViewTextBoxColumn Screen_ID;
        private System.Windows.Forms.DataGridViewCheckBoxColumn Admin;
        private System.Windows.Forms.DataGridViewCheckBoxColumn User;
    }
}