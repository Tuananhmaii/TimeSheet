namespace Timesheets_System.Views.User
{
    partial class frmUserList
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmUserList));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            this.imageList1 = new System.Windows.Forms.ImageList(this.components);
            this.TopBar = new System.Windows.Forms.Panel();
            this.panel4 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.pn_Minimize = new System.Windows.Forms.Panel();
            this.btnMinimize = new System.Windows.Forms.Button();
            this.pn_Maximize = new System.Windows.Forms.Panel();
            this.btnMaximize = new System.Windows.Forms.Button();
            this.pn_Close = new System.Windows.Forms.Panel();
            this.btnClose = new System.Windows.Forms.Button();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btnRefresh = new System.Windows.Forms.Button();
            this.cb_Position = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cb_Team = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cb_Department = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.dtgvDepartmentDetail = new System.Windows.Forms.DataGridView();
            this.panel1 = new System.Windows.Forms.Panel();
            this.Fullname = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Department_name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Team_name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Position_name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Email = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Birth_Date = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Phone = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Address = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Gender = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.Username = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Password = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Ethnic = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Religion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Citizen_ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Contract_No = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Auth_Group_ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Tax_Code = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Department_id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Team_id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Position_id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Social_Insurance_No = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Photo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Date_Hired = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TopBar.SuspendLayout();
            this.panel4.SuspendLayout();
            this.pn_Minimize.SuspendLayout();
            this.pn_Maximize.SuspendLayout();
            this.pn_Close.SuspendLayout();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvDepartmentDetail)).BeginInit();
            this.SuspendLayout();
            // 
            // imageList1
            // 
            this.imageList1.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit;
            this.imageList1.ImageSize = new System.Drawing.Size(16, 16);
            this.imageList1.TransparentColor = System.Drawing.Color.Transparent;
            // 
            // TopBar
            // 
            this.TopBar.BackColor = System.Drawing.SystemColors.GradientActiveCaption;
            this.TopBar.Controls.Add(this.panel4);
            this.TopBar.Controls.Add(this.pn_Minimize);
            this.TopBar.Controls.Add(this.pn_Maximize);
            this.TopBar.Controls.Add(this.pn_Close);
            this.TopBar.Dock = System.Windows.Forms.DockStyle.Top;
            this.TopBar.Font = new System.Drawing.Font("Segoe UI Semilight", 11.25F);
            this.TopBar.Location = new System.Drawing.Point(0, 0);
            this.TopBar.Name = "TopBar";
            this.TopBar.Size = new System.Drawing.Size(1119, 36);
            this.TopBar.TabIndex = 2;
            // 
            // panel4
            // 
            this.panel4.Controls.Add(this.label1);
            this.panel4.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel4.Location = new System.Drawing.Point(0, 0);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(222, 36);
            this.panel4.TabIndex = 10;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(149, 20);
            this.label1.TabIndex = 0;
            this.label1.Text = "Danh Sách Nhân Viên";
            // 
            // pn_Minimize
            // 
            this.pn_Minimize.Controls.Add(this.btnMinimize);
            this.pn_Minimize.Dock = System.Windows.Forms.DockStyle.Right;
            this.pn_Minimize.Location = new System.Drawing.Point(992, 0);
            this.pn_Minimize.Name = "pn_Minimize";
            this.pn_Minimize.Size = new System.Drawing.Size(44, 36);
            this.pn_Minimize.TabIndex = 9;
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
            this.btnMinimize.Location = new System.Drawing.Point(13, 12);
            this.btnMinimize.Name = "btnMinimize";
            this.btnMinimize.Size = new System.Drawing.Size(15, 15);
            this.btnMinimize.TabIndex = 4;
            this.btnMinimize.UseVisualStyleBackColor = false;
            // 
            // pn_Maximize
            // 
            this.pn_Maximize.Controls.Add(this.btnMaximize);
            this.pn_Maximize.Dock = System.Windows.Forms.DockStyle.Right;
            this.pn_Maximize.Location = new System.Drawing.Point(1036, 0);
            this.pn_Maximize.Name = "pn_Maximize";
            this.pn_Maximize.Size = new System.Drawing.Size(42, 36);
            this.pn_Maximize.TabIndex = 8;
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
            this.btnMaximize.Location = new System.Drawing.Point(12, 12);
            this.btnMaximize.Name = "btnMaximize";
            this.btnMaximize.Size = new System.Drawing.Size(15, 15);
            this.btnMaximize.TabIndex = 3;
            this.btnMaximize.UseVisualStyleBackColor = false;
            // 
            // pn_Close
            // 
            this.pn_Close.Controls.Add(this.btnClose);
            this.pn_Close.Dock = System.Windows.Forms.DockStyle.Right;
            this.pn_Close.Location = new System.Drawing.Point(1078, 0);
            this.pn_Close.Name = "pn_Close";
            this.pn_Close.Size = new System.Drawing.Size(41, 36);
            this.pn_Close.TabIndex = 7;
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
            this.btnClose.Location = new System.Drawing.Point(14, 12);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(15, 15);
            this.btnClose.TabIndex = 2;
            this.btnClose.UseVisualStyleBackColor = false;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.btnRefresh);
            this.panel2.Controls.Add(this.cb_Position);
            this.panel2.Controls.Add(this.label4);
            this.panel2.Controls.Add(this.cb_Team);
            this.panel2.Controls.Add(this.label3);
            this.panel2.Controls.Add(this.cb_Department);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.btnDelete);
            this.panel2.Controls.Add(this.btnAdd);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel2.Location = new System.Drawing.Point(0, 36);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(1119, 64);
            this.panel2.TabIndex = 4;
            // 
            // btnRefresh
            // 
            this.btnRefresh.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnRefresh.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(166)))), ((int)(((byte)(235)))));
            this.btnRefresh.FlatAppearance.BorderSize = 0;
            this.btnRefresh.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRefresh.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRefresh.ForeColor = System.Drawing.Color.Transparent;
            this.btnRefresh.Location = new System.Drawing.Point(792, 26);
            this.btnRefresh.Name = "btnRefresh";
            this.btnRefresh.Size = new System.Drawing.Size(104, 31);
            this.btnRefresh.TabIndex = 33;
            this.btnRefresh.Text = "Làm mới";
            this.btnRefresh.UseVisualStyleBackColor = false;
            this.btnRefresh.Visible = false;
            this.btnRefresh.Click += new System.EventHandler(this.btnRefresh_Click);
            // 
            // cb_Position
            // 
            this.cb_Position.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cb_Position.Font = new System.Drawing.Font("Segoe UI Semilight", 11.25F);
            this.cb_Position.FormattingEnabled = true;
            this.cb_Position.Location = new System.Drawing.Point(537, 28);
            this.cb_Position.Name = "cb_Position";
            this.cb_Position.Size = new System.Drawing.Size(145, 28);
            this.cb_Position.TabIndex = 32;
            this.cb_Position.SelectionChangeCommitted += new System.EventHandler(this.cb_Position_SelectionChangeCommitted);
            this.cb_Position.MouseClick += new System.Windows.Forms.MouseEventHandler(this.cb_Position_MouseClick);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI Semilight", 11.25F);
            this.label4.Location = new System.Drawing.Point(468, 31);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(63, 20);
            this.label4.TabIndex = 31;
            this.label4.Text = "Chức Vụ";
            // 
            // cb_Team
            // 
            this.cb_Team.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cb_Team.Font = new System.Drawing.Font("Segoe UI Semilight", 11.25F);
            this.cb_Team.FormattingEnabled = true;
            this.cb_Team.Location = new System.Drawing.Point(297, 28);
            this.cb_Team.Name = "cb_Team";
            this.cb_Team.Size = new System.Drawing.Size(145, 28);
            this.cb_Team.TabIndex = 30;
            this.cb_Team.SelectionChangeCommitted += new System.EventHandler(this.cb_Team_SelectionChangeCommitted);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Segoe UI Semilight", 11.25F);
            this.label3.Location = new System.Drawing.Point(247, 31);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(44, 20);
            this.label3.TabIndex = 29;
            this.label3.Text = "Team";
            // 
            // cb_Department
            // 
            this.cb_Department.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cb_Department.Font = new System.Drawing.Font("Segoe UI Semilight", 11.25F);
            this.cb_Department.FormattingEnabled = true;
            this.cb_Department.Location = new System.Drawing.Point(81, 28);
            this.cb_Department.Name = "cb_Department";
            this.cb_Department.Size = new System.Drawing.Size(145, 28);
            this.cb_Department.TabIndex = 28;
            this.cb_Department.SelectionChangeCommitted += new System.EventHandler(this.cb_Department_SelectionChangeCommitted);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI Semilight", 11.25F);
            this.label2.Location = new System.Drawing.Point(12, 31);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(63, 20);
            this.label2.TabIndex = 27;
            this.label2.Text = "Bộ phận";
            // 
            // btnDelete
            // 
            this.btnDelete.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnDelete.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(166)))), ((int)(((byte)(235)))));
            this.btnDelete.FlatAppearance.BorderSize = 0;
            this.btnDelete.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDelete.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDelete.ForeColor = System.Drawing.Color.Transparent;
            this.btnDelete.Location = new System.Drawing.Point(1001, 26);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(95, 32);
            this.btnDelete.TabIndex = 23;
            this.btnDelete.Text = "Xóa";
            this.btnDelete.UseVisualStyleBackColor = false;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnAdd
            // 
            this.btnAdd.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAdd.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(166)))), ((int)(((byte)(235)))));
            this.btnAdd.FlatAppearance.BorderSize = 0;
            this.btnAdd.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAdd.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAdd.ForeColor = System.Drawing.Color.Transparent;
            this.btnAdd.Location = new System.Drawing.Point(902, 26);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(93, 32);
            this.btnAdd.TabIndex = 21;
            this.btnAdd.Text = "Thêm";
            this.btnAdd.UseVisualStyleBackColor = false;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // dtgvDepartmentDetail
            // 
            this.dtgvDepartmentDetail.AllowUserToAddRows = false;
            this.dtgvDepartmentDetail.AllowUserToDeleteRows = false;
            this.dtgvDepartmentDetail.AllowUserToResizeColumns = false;
            this.dtgvDepartmentDetail.AllowUserToResizeRows = false;
            this.dtgvDepartmentDetail.BackgroundColor = System.Drawing.SystemColors.ControlLightLight;
            this.dtgvDepartmentDetail.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.RaisedHorizontal;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.ActiveCaption;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI Semibold", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.InactiveCaptionText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.ActiveCaption;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dtgvDepartmentDetail.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dtgvDepartmentDetail.ColumnHeadersHeight = 29;
            this.dtgvDepartmentDetail.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            this.dtgvDepartmentDetail.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Fullname,
            this.Department_name,
            this.Team_name,
            this.Position_name,
            this.Email,
            this.Birth_Date,
            this.Phone,
            this.Address,
            this.Gender,
            this.Username,
            this.Password,
            this.Ethnic,
            this.Religion,
            this.Citizen_ID,
            this.Contract_No,
            this.Auth_Group_ID,
            this.Tax_Code,
            this.Department_id,
            this.Team_id,
            this.Position_id,
            this.Social_Insurance_No,
            this.Photo,
            this.Date_Hired});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Segoe UI Semilight", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.SteelBlue;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dtgvDepartmentDetail.DefaultCellStyle = dataGridViewCellStyle2;
            this.dtgvDepartmentDetail.EnableHeadersVisualStyles = false;
            this.dtgvDepartmentDetail.GridColor = System.Drawing.SystemColors.Highlight;
            this.dtgvDepartmentDetail.Location = new System.Drawing.Point(16, 127);
            this.dtgvDepartmentDetail.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.dtgvDepartmentDetail.MultiSelect = false;
            this.dtgvDepartmentDetail.Name = "dtgvDepartmentDetail";
            this.dtgvDepartmentDetail.ReadOnly = true;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.ActiveCaption;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Segoe UI Semibold", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dtgvDepartmentDetail.RowHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.dtgvDepartmentDetail.RowHeadersVisible = false;
            this.dtgvDepartmentDetail.RowHeadersWidth = 51;
            this.dtgvDepartmentDetail.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            this.dtgvDepartmentDetail.RowTemplate.Height = 24;
            this.dtgvDepartmentDetail.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgvDepartmentDetail.Size = new System.Drawing.Size(1080, 466);
            this.dtgvDepartmentDetail.TabIndex = 5;
            this.dtgvDepartmentDetail.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgvDepartmentDetail_CellDoubleClick);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(53)))), ((int)(((byte)(101)))), ((int)(((byte)(140)))));
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 614);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1119, 10);
            this.panel1.TabIndex = 65;
            // 
            // Fullname
            // 
            this.Fullname.DataPropertyName = "Fullname";
            this.Fullname.HeaderText = "Họ và tên";
            this.Fullname.MinimumWidth = 6;
            this.Fullname.Name = "Fullname";
            this.Fullname.ReadOnly = true;
            this.Fullname.Width = 135;
            // 
            // Department_name
            // 
            this.Department_name.DataPropertyName = "Department_name";
            this.Department_name.HeaderText = "Phòng";
            this.Department_name.MinimumWidth = 6;
            this.Department_name.Name = "Department_name";
            this.Department_name.ReadOnly = true;
            this.Department_name.Width = 136;
            // 
            // Team_name
            // 
            this.Team_name.DataPropertyName = "Team_name";
            this.Team_name.HeaderText = "Team";
            this.Team_name.MinimumWidth = 6;
            this.Team_name.Name = "Team_name";
            this.Team_name.ReadOnly = true;
            this.Team_name.Width = 110;
            // 
            // Position_name
            // 
            this.Position_name.DataPropertyName = "Position_name";
            this.Position_name.HeaderText = "Chức vụ";
            this.Position_name.MinimumWidth = 6;
            this.Position_name.Name = "Position_name";
            this.Position_name.ReadOnly = true;
            this.Position_name.Width = 110;
            // 
            // Email
            // 
            this.Email.DataPropertyName = "Email";
            this.Email.HeaderText = "Email";
            this.Email.MinimumWidth = 6;
            this.Email.Name = "Email";
            this.Email.ReadOnly = true;
            this.Email.Width = 170;
            // 
            // Birth_Date
            // 
            this.Birth_Date.DataPropertyName = "Birth_Date";
            this.Birth_Date.HeaderText = "Ngày sinh";
            this.Birth_Date.MinimumWidth = 6;
            this.Birth_Date.Name = "Birth_Date";
            this.Birth_Date.ReadOnly = true;
            // 
            // Phone
            // 
            this.Phone.DataPropertyName = "Phone";
            this.Phone.HeaderText = "Số điện thoại";
            this.Phone.MinimumWidth = 6;
            this.Phone.Name = "Phone";
            this.Phone.ReadOnly = true;
            this.Phone.Width = 135;
            // 
            // Address
            // 
            this.Address.DataPropertyName = "Address";
            this.Address.HeaderText = "Địa chỉ";
            this.Address.MinimumWidth = 6;
            this.Address.Name = "Address";
            this.Address.ReadOnly = true;
            this.Address.Width = 180;
            // 
            // Gender
            // 
            this.Gender.DataPropertyName = "Gender";
            this.Gender.HeaderText = "Giới tính";
            this.Gender.MinimumWidth = 6;
            this.Gender.Name = "Gender";
            this.Gender.ReadOnly = true;
            this.Gender.Visible = false;
            // 
            // Username
            // 
            this.Username.DataPropertyName = "Username";
            this.Username.HeaderText = "Taikhoan";
            this.Username.MinimumWidth = 6;
            this.Username.Name = "Username";
            this.Username.ReadOnly = true;
            this.Username.Visible = false;
            // 
            // Password
            // 
            this.Password.DataPropertyName = "Password";
            this.Password.HeaderText = "Mat khau";
            this.Password.MinimumWidth = 6;
            this.Password.Name = "Password";
            this.Password.ReadOnly = true;
            this.Password.Visible = false;
            // 
            // Ethnic
            // 
            this.Ethnic.DataPropertyName = "Ethnic";
            this.Ethnic.HeaderText = "Ethnic";
            this.Ethnic.MinimumWidth = 6;
            this.Ethnic.Name = "Ethnic";
            this.Ethnic.ReadOnly = true;
            this.Ethnic.Visible = false;
            // 
            // Religion
            // 
            this.Religion.DataPropertyName = "Religion";
            this.Religion.HeaderText = "Religion";
            this.Religion.MinimumWidth = 6;
            this.Religion.Name = "Religion";
            this.Religion.ReadOnly = true;
            this.Religion.Visible = false;
            // 
            // Citizen_ID
            // 
            this.Citizen_ID.DataPropertyName = "Citizen_ID";
            this.Citizen_ID.HeaderText = "Citizen_ID";
            this.Citizen_ID.MinimumWidth = 6;
            this.Citizen_ID.Name = "Citizen_ID";
            this.Citizen_ID.ReadOnly = true;
            this.Citizen_ID.Visible = false;
            // 
            // Contract_No
            // 
            this.Contract_No.DataPropertyName = "Contract_No";
            this.Contract_No.HeaderText = "Contract_No";
            this.Contract_No.MinimumWidth = 6;
            this.Contract_No.Name = "Contract_No";
            this.Contract_No.ReadOnly = true;
            this.Contract_No.Visible = false;
            // 
            // Auth_Group_ID
            // 
            this.Auth_Group_ID.DataPropertyName = "Auth_Group_ID";
            this.Auth_Group_ID.HeaderText = "Auth_Group_ID";
            this.Auth_Group_ID.MinimumWidth = 6;
            this.Auth_Group_ID.Name = "Auth_Group_ID";
            this.Auth_Group_ID.ReadOnly = true;
            this.Auth_Group_ID.Visible = false;
            // 
            // Tax_Code
            // 
            this.Tax_Code.DataPropertyName = "Tax_Code";
            this.Tax_Code.HeaderText = "Tax_Code";
            this.Tax_Code.MinimumWidth = 6;
            this.Tax_Code.Name = "Tax_Code";
            this.Tax_Code.ReadOnly = true;
            this.Tax_Code.Visible = false;
            // 
            // Department_id
            // 
            this.Department_id.DataPropertyName = "Department_id";
            this.Department_id.HeaderText = "Department_id";
            this.Department_id.MinimumWidth = 6;
            this.Department_id.Name = "Department_id";
            this.Department_id.ReadOnly = true;
            this.Department_id.Visible = false;
            // 
            // Team_id
            // 
            this.Team_id.DataPropertyName = "Team_id";
            this.Team_id.HeaderText = "Team_id";
            this.Team_id.MinimumWidth = 6;
            this.Team_id.Name = "Team_id";
            this.Team_id.ReadOnly = true;
            this.Team_id.Visible = false;
            // 
            // Position_id
            // 
            this.Position_id.DataPropertyName = "Position_id";
            this.Position_id.HeaderText = "Position_id";
            this.Position_id.MinimumWidth = 6;
            this.Position_id.Name = "Position_id";
            this.Position_id.ReadOnly = true;
            this.Position_id.Visible = false;
            // 
            // Social_Insurance_No
            // 
            this.Social_Insurance_No.DataPropertyName = "Social_Insurance_No";
            this.Social_Insurance_No.HeaderText = "Social_Insurance_No";
            this.Social_Insurance_No.MinimumWidth = 6;
            this.Social_Insurance_No.Name = "Social_Insurance_No";
            this.Social_Insurance_No.ReadOnly = true;
            this.Social_Insurance_No.Visible = false;
            // 
            // Photo
            // 
            this.Photo.DataPropertyName = "Photo";
            this.Photo.HeaderText = "Photo";
            this.Photo.MinimumWidth = 6;
            this.Photo.Name = "Photo";
            this.Photo.ReadOnly = true;
            this.Photo.Visible = false;
            // 
            // Date_Hired
            // 
            this.Date_Hired.DataPropertyName = "Date_Hired";
            this.Date_Hired.HeaderText = "Date_Hired";
            this.Date_Hired.MinimumWidth = 6;
            this.Date_Hired.Name = "Date_Hired";
            this.Date_Hired.ReadOnly = true;
            this.Date_Hired.Visible = false;
            // 
            // frmUserList
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1119, 624);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.dtgvDepartmentDetail);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.TopBar);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "frmUserList";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmUserList";
            this.TopBar.ResumeLayout(false);
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.pn_Minimize.ResumeLayout(false);
            this.pn_Maximize.ResumeLayout(false);
            this.pn_Close.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvDepartmentDetail)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.ImageList imageList1;
        private System.Windows.Forms.Panel TopBar;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel pn_Minimize;
        private System.Windows.Forms.Button btnMinimize;
        private System.Windows.Forms.Panel pn_Maximize;
        private System.Windows.Forms.Button btnMaximize;
        private System.Windows.Forms.Panel pn_Close;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.ComboBox cb_Position;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cb_Team;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cb_Department;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridView dtgvDepartmentDetail;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Fullname;
        private System.Windows.Forms.DataGridViewTextBoxColumn Department_name;
        private System.Windows.Forms.DataGridViewTextBoxColumn Team_name;
        private System.Windows.Forms.DataGridViewTextBoxColumn Position_name;
        private System.Windows.Forms.DataGridViewTextBoxColumn Email;
        private System.Windows.Forms.DataGridViewTextBoxColumn Birth_Date;
        private System.Windows.Forms.DataGridViewTextBoxColumn Phone;
        private System.Windows.Forms.DataGridViewTextBoxColumn Address;
        private System.Windows.Forms.DataGridViewCheckBoxColumn Gender;
        private System.Windows.Forms.DataGridViewTextBoxColumn Username;
        private System.Windows.Forms.DataGridViewTextBoxColumn Password;
        private System.Windows.Forms.DataGridViewTextBoxColumn Ethnic;
        private System.Windows.Forms.DataGridViewTextBoxColumn Religion;
        private System.Windows.Forms.DataGridViewTextBoxColumn Citizen_ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn Contract_No;
        private System.Windows.Forms.DataGridViewTextBoxColumn Auth_Group_ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn Tax_Code;
        private System.Windows.Forms.DataGridViewTextBoxColumn Department_id;
        private System.Windows.Forms.DataGridViewTextBoxColumn Team_id;
        private System.Windows.Forms.DataGridViewTextBoxColumn Position_id;
        private System.Windows.Forms.DataGridViewTextBoxColumn Social_Insurance_No;
        private System.Windows.Forms.DataGridViewTextBoxColumn Photo;
        private System.Windows.Forms.DataGridViewTextBoxColumn Date_Hired;
    }
}