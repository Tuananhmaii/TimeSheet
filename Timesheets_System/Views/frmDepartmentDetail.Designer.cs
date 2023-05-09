namespace Timesheets_System.Views.User
{
    partial class frmDepartmentDetail
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
            this.panel3 = new System.Windows.Forms.Panel();
            this.panel5 = new System.Windows.Forms.Panel();
            this.dtgvDepartmentDetail = new System.Windows.Forms.DataGridView();
            this.panel4 = new System.Windows.Forms.Panel();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btAdd = new System.Windows.Forms.Button();
            this.btDelete = new System.Windows.Forms.Button();
            this.Photo = new System.Windows.Forms.DataGridViewImageColumn();
            this.Username = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Password = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Fullname = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Email = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Birth_Date = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Phone = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Ethnic = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Religion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Citizen_ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Tax_Code = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Social_Insurance_No = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Address = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Date_Hired = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Contract_No = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Department_name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Team_name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Position_name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.panel3.SuspendLayout();
            this.panel5.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvDepartmentDetail)).BeginInit();
            this.panel4.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel3
            // 
            this.panel3.BackColor = System.Drawing.SystemColors.Menu;
            this.panel3.Controls.Add(this.panel5);
            this.panel3.Controls.Add(this.panel4);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel3.Location = new System.Drawing.Point(0, 0);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(1256, 643);
            this.panel3.TabIndex = 3;
            // 
            // panel5
            // 
            this.panel5.Controls.Add(this.dtgvDepartmentDetail);
            this.panel5.Location = new System.Drawing.Point(31, 157);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(552, 382);
            this.panel5.TabIndex = 6;
            // 
            // dtgvDepartmentDetail
            // 
            this.dtgvDepartmentDetail.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgvDepartmentDetail.BackgroundColor = System.Drawing.SystemColors.ControlLightLight;
            this.dtgvDepartmentDetail.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.RaisedHorizontal;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.ControlLight;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.InactiveCaptionText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dtgvDepartmentDetail.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dtgvDepartmentDetail.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvDepartmentDetail.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Photo,
            this.Username,
            this.Password,
            this.Fullname,
            this.Email,
            this.Birth_Date,
            this.Phone,
            this.Ethnic,
            this.Religion,
            this.Citizen_ID,
            this.Tax_Code,
            this.Social_Insurance_No,
            this.Address,
            this.Date_Hired,
            this.Contract_No,
            this.Department_name,
            this.Team_name,
            this.Position_name});
            this.dtgvDepartmentDetail.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtgvDepartmentDetail.GridColor = System.Drawing.SystemColors.Highlight;
            this.dtgvDepartmentDetail.Location = new System.Drawing.Point(0, 0);
            this.dtgvDepartmentDetail.Margin = new System.Windows.Forms.Padding(2);
            this.dtgvDepartmentDetail.Name = "dtgvDepartmentDetail";
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.ActiveCaption;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dtgvDepartmentDetail.RowHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dtgvDepartmentDetail.RowHeadersVisible = false;
            this.dtgvDepartmentDetail.RowHeadersWidth = 51;
            this.dtgvDepartmentDetail.RowTemplate.Height = 24;
            this.dtgvDepartmentDetail.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgvDepartmentDetail.Size = new System.Drawing.Size(552, 382);
            this.dtgvDepartmentDetail.TabIndex = 3;
            this.dtgvDepartmentDetail.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgvDepartmentDetail_CellClick);
            this.dtgvDepartmentDetail.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgvDepartmentDetail_CellDoubleClick);
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.label2);
            this.panel4.Controls.Add(this.label1);
            this.panel4.Controls.Add(this.btAdd);
            this.panel4.Controls.Add(this.btDelete);
            this.panel4.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel4.Location = new System.Drawing.Point(0, 0);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(1256, 78);
            this.panel4.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Red;
            this.label2.Location = new System.Drawing.Point(325, 31);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(0, 16);
            this.label2.TabIndex = 24;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(27, 31);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(101, 19);
            this.label1.TabIndex = 23;
            this.label1.Text = "Phòng ban:";
            // 
            // btAdd
            // 
            this.btAdd.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btAdd.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(166)))), ((int)(((byte)(235)))));
            this.btAdd.FlatAppearance.BorderSize = 0;
            this.btAdd.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btAdd.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btAdd.ForeColor = System.Drawing.Color.Transparent;
            this.btAdd.Location = new System.Drawing.Point(1021, 23);
            this.btAdd.Name = "btAdd";
            this.btAdd.Size = new System.Drawing.Size(104, 39);
            this.btAdd.TabIndex = 20;
            this.btAdd.Text = "THÊM";
            this.btAdd.UseVisualStyleBackColor = false;
            this.btAdd.Click += new System.EventHandler(this.btAdd_Click);
            // 
            // btDelete
            // 
            this.btDelete.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btDelete.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(166)))), ((int)(((byte)(235)))));
            this.btDelete.FlatAppearance.BorderSize = 0;
            this.btDelete.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btDelete.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btDelete.ForeColor = System.Drawing.Color.Transparent;
            this.btDelete.Location = new System.Drawing.Point(1141, 23);
            this.btDelete.Name = "btDelete";
            this.btDelete.Size = new System.Drawing.Size(104, 39);
            this.btDelete.TabIndex = 22;
            this.btDelete.Text = "XÓA";
            this.btDelete.UseVisualStyleBackColor = false;
            this.btDelete.Click += new System.EventHandler(this.btDelete_Click);
            // 
            // Photo
            // 
            this.Photo.DataPropertyName = "Photo";
            this.Photo.HeaderText = "Ảnh đại diện";
            this.Photo.Name = "Photo";
            this.Photo.ReadOnly = true;
            this.Photo.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.Photo.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
            // 
            // Username
            // 
            this.Username.DataPropertyName = "Username";
            this.Username.HeaderText = "Tài khoản";
            this.Username.Name = "Username";
            this.Username.ReadOnly = true;
            this.Username.Visible = false;
            // 
            // Password
            // 
            this.Password.DataPropertyName = "Password";
            this.Password.HeaderText = "Mật khẩu";
            this.Password.Name = "Password";
            this.Password.ReadOnly = true;
            this.Password.Visible = false;
            // 
            // Fullname
            // 
            this.Fullname.DataPropertyName = "Fullname";
            this.Fullname.HeaderText = "Họ và tên";
            this.Fullname.Name = "Fullname";
            this.Fullname.ReadOnly = true;
            // 
            // Email
            // 
            this.Email.DataPropertyName = "Email";
            this.Email.HeaderText = "Email";
            this.Email.Name = "Email";
            this.Email.ReadOnly = true;
            // 
            // Birth_Date
            // 
            this.Birth_Date.DataPropertyName = "Birth_Date";
            this.Birth_Date.HeaderText = "Ngày sinh";
            this.Birth_Date.Name = "Birth_Date";
            this.Birth_Date.ReadOnly = true;
            // 
            // Phone
            // 
            this.Phone.DataPropertyName = "Phone";
            this.Phone.HeaderText = "Sđt";
            this.Phone.Name = "Phone";
            this.Phone.ReadOnly = true;
            // 
            // Ethnic
            // 
            this.Ethnic.DataPropertyName = "Ethnic";
            this.Ethnic.HeaderText = "Dân tộc";
            this.Ethnic.Name = "Ethnic";
            this.Ethnic.ReadOnly = true;
            // 
            // Religion
            // 
            this.Religion.DataPropertyName = "Religion";
            this.Religion.HeaderText = "Tôn giáo";
            this.Religion.Name = "Religion";
            this.Religion.ReadOnly = true;
            // 
            // Citizen_ID
            // 
            this.Citizen_ID.DataPropertyName = "Citizen_ID";
            this.Citizen_ID.HeaderText = "CCCD/CMND";
            this.Citizen_ID.Name = "Citizen_ID";
            this.Citizen_ID.ReadOnly = true;
            // 
            // Tax_Code
            // 
            this.Tax_Code.DataPropertyName = "Tax_Code";
            this.Tax_Code.HeaderText = "Mã số thuế";
            this.Tax_Code.Name = "Tax_Code";
            this.Tax_Code.ReadOnly = true;
            // 
            // Social_Insurance_No
            // 
            this.Social_Insurance_No.DataPropertyName = "Social_Insurance_No";
            this.Social_Insurance_No.HeaderText = "Mã số BHXH";
            this.Social_Insurance_No.Name = "Social_Insurance_No";
            this.Social_Insurance_No.ReadOnly = true;
            // 
            // Address
            // 
            this.Address.DataPropertyName = "Address";
            this.Address.HeaderText = "Địa chỉ";
            this.Address.Name = "Address";
            this.Address.ReadOnly = true;
            // 
            // Date_Hired
            // 
            this.Date_Hired.DataPropertyName = "Date_Hired";
            this.Date_Hired.HeaderText = "Ngày vào";
            this.Date_Hired.Name = "Date_Hired";
            this.Date_Hired.ReadOnly = true;
            // 
            // Contract_No
            // 
            this.Contract_No.DataPropertyName = "Contract_No";
            this.Contract_No.HeaderText = "Hợp đồng số";
            this.Contract_No.Name = "Contract_No";
            this.Contract_No.ReadOnly = true;
            // 
            // Department_name
            // 
            this.Department_name.DataPropertyName = "Department_name";
            this.Department_name.HeaderText = "Phòng";
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
            // frmDepartmentDetail
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1256, 643);
            this.Controls.Add(this.panel3);
            this.Name = "frmDepartmentDetail";
            this.Text = "frmDepartment";
            this.Load += new System.EventHandler(this.frmDepartment_Load);
            this.panel3.ResumeLayout(false);
            this.panel5.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dtgvDepartmentDetail)).EndInit();
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Button btAdd;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btDelete;
        private System.Windows.Forms.DataGridView dtgvDepartmentDetail;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridViewImageColumn Photo;
        private System.Windows.Forms.DataGridViewTextBoxColumn Username;
        private System.Windows.Forms.DataGridViewTextBoxColumn Password;
        private System.Windows.Forms.DataGridViewTextBoxColumn Fullname;
        private System.Windows.Forms.DataGridViewTextBoxColumn Email;
        private System.Windows.Forms.DataGridViewTextBoxColumn Birth_Date;
        private System.Windows.Forms.DataGridViewTextBoxColumn Phone;
        private System.Windows.Forms.DataGridViewTextBoxColumn Ethnic;
        private System.Windows.Forms.DataGridViewTextBoxColumn Religion;
        private System.Windows.Forms.DataGridViewTextBoxColumn Citizen_ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn Tax_Code;
        private System.Windows.Forms.DataGridViewTextBoxColumn Social_Insurance_No;
        private System.Windows.Forms.DataGridViewTextBoxColumn Address;
        private System.Windows.Forms.DataGridViewTextBoxColumn Date_Hired;
        private System.Windows.Forms.DataGridViewTextBoxColumn Contract_No;
        private System.Windows.Forms.DataGridViewTextBoxColumn Department_name;
        private System.Windows.Forms.DataGridViewTextBoxColumn Team_name;
        private System.Windows.Forms.DataGridViewTextBoxColumn Position_name;
    }
}