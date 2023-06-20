namespace Timesheets_System
{
    partial class frmPersonalTimesheet
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmPersonalTimesheet));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            this.panel2 = new System.Windows.Forms.Panel();
            this.TopBar = new System.Windows.Forms.Panel();
            this.panel4 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.pn_Minimize = new System.Windows.Forms.Panel();
            this.btnMinimize = new System.Windows.Forms.Button();
            this.pn_Maximize = new System.Windows.Forms.Panel();
            this.btnMaximize = new System.Windows.Forms.Button();
            this.pn_Close = new System.Windows.Forms.Panel();
            this.btnClose = new System.Windows.Forms.Button();
            this.lPosition = new System.Windows.Forms.Label();
            this.lTeam = new System.Windows.Forms.Label();
            this.lDepartment = new System.Windows.Forms.Label();
            this.lName = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.panel3 = new System.Windows.Forms.Panel();
            this.btn_Submit = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.cbMonth = new System.Windows.Forms.ComboBox();
            this.cbYear = new System.Windows.Forms.ComboBox();
            this.label8 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel5 = new System.Windows.Forms.Panel();
            this.panel6 = new System.Windows.Forms.Panel();
            this.panel7 = new System.Windows.Forms.Panel();
            this.dtvgPersonalTimeSheet = new System.Windows.Forms.DataGridView();
            this.Column_TeamID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column_TeamName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column_DepartmentID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.panel2.SuspendLayout();
            this.TopBar.SuspendLayout();
            this.panel4.SuspendLayout();
            this.pn_Minimize.SuspendLayout();
            this.pn_Maximize.SuspendLayout();
            this.pn_Close.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel7.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtvgPersonalTimeSheet)).BeginInit();
            this.SuspendLayout();
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.TopBar);
            this.panel2.Controls.Add(this.lPosition);
            this.panel2.Controls.Add(this.lTeam);
            this.panel2.Controls.Add(this.lDepartment);
            this.panel2.Controls.Add(this.lName);
            this.panel2.Controls.Add(this.label7);
            this.panel2.Controls.Add(this.label6);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.label3);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(872, 118);
            this.panel2.TabIndex = 42;
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
            this.TopBar.Size = new System.Drawing.Size(872, 36);
            this.TopBar.TabIndex = 61;
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
            this.label1.Size = new System.Drawing.Size(134, 20);
            this.label1.TabIndex = 0;
            this.label1.Text = "Bảng công cá nhân";
            // 
            // pn_Minimize
            // 
            this.pn_Minimize.Controls.Add(this.btnMinimize);
            this.pn_Minimize.Dock = System.Windows.Forms.DockStyle.Right;
            this.pn_Minimize.Location = new System.Drawing.Point(745, 0);
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
            this.pn_Maximize.Location = new System.Drawing.Point(789, 0);
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
            this.pn_Close.Location = new System.Drawing.Point(831, 0);
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
            // lPosition
            // 
            this.lPosition.AutoSize = true;
            this.lPosition.BackColor = System.Drawing.Color.Transparent;
            this.lPosition.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lPosition.Location = new System.Drawing.Point(111, 85);
            this.lPosition.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lPosition.Name = "lPosition";
            this.lPosition.Size = new System.Drawing.Size(48, 20);
            this.lPosition.TabIndex = 38;
            this.lPosition.Text = "label4";
            // 
            // lTeam
            // 
            this.lTeam.AutoSize = true;
            this.lTeam.BackColor = System.Drawing.Color.Transparent;
            this.lTeam.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lTeam.Location = new System.Drawing.Point(409, 85);
            this.lTeam.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lTeam.Name = "lTeam";
            this.lTeam.Size = new System.Drawing.Size(48, 20);
            this.lTeam.TabIndex = 37;
            this.lTeam.Text = "label4";
            // 
            // lDepartment
            // 
            this.lDepartment.AutoSize = true;
            this.lDepartment.BackColor = System.Drawing.Color.Transparent;
            this.lDepartment.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lDepartment.Location = new System.Drawing.Point(409, 54);
            this.lDepartment.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lDepartment.Name = "lDepartment";
            this.lDepartment.Size = new System.Drawing.Size(48, 20);
            this.lDepartment.TabIndex = 36;
            this.lDepartment.Text = "label4";
            // 
            // lName
            // 
            this.lName.AutoSize = true;
            this.lName.BackColor = System.Drawing.Color.Transparent;
            this.lName.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lName.Location = new System.Drawing.Point(111, 54);
            this.lName.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.lName.Name = "lName";
            this.lName.Size = new System.Drawing.Size(48, 20);
            this.lName.TabIndex = 35;
            this.lName.Text = "label4";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Segoe UI Semibold", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(44, 85);
            this.label7.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(42, 20);
            this.label7.TabIndex = 34;
            this.label7.Text = "Vị trí";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Segoe UI Semibold", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(342, 85);
            this.label6.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(45, 20);
            this.label6.TabIndex = 33;
            this.label6.Text = "Team";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI Semibold", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(342, 54);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(54, 20);
            this.label2.TabIndex = 32;
            this.label2.Text = "Phòng";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Segoe UI Semibold", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(44, 54);
            this.label3.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(33, 20);
            this.label3.TabIndex = 31;
            this.label3.Text = "Tên";
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.btn_Submit);
            this.panel3.Controls.Add(this.label4);
            this.panel3.Controls.Add(this.cbMonth);
            this.panel3.Controls.Add(this.cbYear);
            this.panel3.Controls.Add(this.label8);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel3.Location = new System.Drawing.Point(0, 118);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(872, 77);
            this.panel3.TabIndex = 43;
            // 
            // btn_Submit
            // 
            this.btn_Submit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btn_Submit.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(166)))), ((int)(((byte)(235)))));
            this.btn_Submit.FlatAppearance.BorderSize = 0;
            this.btn_Submit.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btn_Submit.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Submit.ForeColor = System.Drawing.Color.Transparent;
            this.btn_Submit.Location = new System.Drawing.Point(544, 18);
            this.btn_Submit.Name = "btn_Submit";
            this.btn_Submit.Size = new System.Drawing.Size(89, 32);
            this.btn_Submit.TabIndex = 50;
            this.btn_Submit.Text = "Xem";
            this.btn_Submit.UseVisualStyleBackColor = false;
            this.btn_Submit.Click += new System.EventHandler(this.btn_Submit_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(44, 25);
            this.label4.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(41, 20);
            this.label4.TabIndex = 46;
            this.label4.Text = "Năm";
            // 
            // cbMonth
            // 
            this.cbMonth.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbMonth.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbMonth.FormattingEnabled = true;
            this.cbMonth.Location = new System.Drawing.Point(413, 22);
            this.cbMonth.Margin = new System.Windows.Forms.Padding(2);
            this.cbMonth.Name = "cbMonth";
            this.cbMonth.Size = new System.Drawing.Size(113, 27);
            this.cbMonth.TabIndex = 49;
            // 
            // cbYear
            // 
            this.cbYear.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbYear.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbYear.FormattingEnabled = true;
            this.cbYear.Location = new System.Drawing.Point(115, 22);
            this.cbYear.Margin = new System.Windows.Forms.Padding(2);
            this.cbYear.Name = "cbYear";
            this.cbYear.Size = new System.Drawing.Size(94, 27);
            this.cbYear.TabIndex = 47;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(342, 25);
            this.label8.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(50, 20);
            this.label8.TabIndex = 48;
            this.label8.Text = "Tháng";
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(53)))), ((int)(((byte)(101)))), ((int)(((byte)(140)))));
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 669);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(872, 10);
            this.panel1.TabIndex = 64;
            // 
            // panel5
            // 
            this.panel5.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel5.Location = new System.Drawing.Point(0, 195);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(30, 474);
            this.panel5.TabIndex = 66;
            // 
            // panel6
            // 
            this.panel6.Dock = System.Windows.Forms.DockStyle.Right;
            this.panel6.Location = new System.Drawing.Point(845, 195);
            this.panel6.Name = "panel6";
            this.panel6.Size = new System.Drawing.Size(27, 474);
            this.panel6.TabIndex = 67;
            // 
            // panel7
            // 
            this.panel7.Controls.Add(this.dtvgPersonalTimeSheet);
            this.panel7.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel7.Location = new System.Drawing.Point(30, 195);
            this.panel7.Name = "panel7";
            this.panel7.Size = new System.Drawing.Size(815, 474);
            this.panel7.TabIndex = 68;
            // 
            // dtvgPersonalTimeSheet
            // 
            this.dtvgPersonalTimeSheet.AllowUserToAddRows = false;
            this.dtvgPersonalTimeSheet.AllowUserToDeleteRows = false;
            this.dtvgPersonalTimeSheet.AllowUserToResizeColumns = false;
            this.dtvgPersonalTimeSheet.AllowUserToResizeRows = false;
            this.dtvgPersonalTimeSheet.BackgroundColor = System.Drawing.SystemColors.ControlLightLight;
            this.dtvgPersonalTimeSheet.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.RaisedHorizontal;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.ActiveCaption;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI Semibold", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.InactiveCaptionText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.ActiveCaption;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dtvgPersonalTimeSheet.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dtvgPersonalTimeSheet.ColumnHeadersHeight = 29;
            this.dtvgPersonalTimeSheet.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            this.dtvgPersonalTimeSheet.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column_TeamID,
            this.Column_TeamName,
            this.Column_DepartmentID,
            this.Column1,
            this.Column2});
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle7.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle7.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle7.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle7.SelectionBackColor = System.Drawing.Color.SteelBlue;
            dataGridViewCellStyle7.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle7.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dtvgPersonalTimeSheet.DefaultCellStyle = dataGridViewCellStyle7;
            this.dtvgPersonalTimeSheet.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtvgPersonalTimeSheet.EnableHeadersVisualStyles = false;
            this.dtvgPersonalTimeSheet.GridColor = System.Drawing.SystemColors.Highlight;
            this.dtvgPersonalTimeSheet.Location = new System.Drawing.Point(0, 0);
            this.dtvgPersonalTimeSheet.Margin = new System.Windows.Forms.Padding(2);
            this.dtvgPersonalTimeSheet.Name = "dtvgPersonalTimeSheet";
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle8.BackColor = System.Drawing.SystemColors.ActiveCaption;
            dataGridViewCellStyle8.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle8.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle8.SelectionBackColor = System.Drawing.SystemColors.ActiveCaption;
            dataGridViewCellStyle8.SelectionForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle8.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dtvgPersonalTimeSheet.RowHeadersDefaultCellStyle = dataGridViewCellStyle8;
            this.dtvgPersonalTimeSheet.RowHeadersVisible = false;
            this.dtvgPersonalTimeSheet.RowHeadersWidth = 51;
            this.dtvgPersonalTimeSheet.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            this.dtvgPersonalTimeSheet.RowTemplate.Height = 24;
            this.dtvgPersonalTimeSheet.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtvgPersonalTimeSheet.Size = new System.Drawing.Size(815, 474);
            this.dtvgPersonalTimeSheet.TabIndex = 66;
            // 
            // Column_TeamID
            // 
            this.Column_TeamID.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.Column_TeamID.DataPropertyName = "Fullname";
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Column_TeamID.DefaultCellStyle = dataGridViewCellStyle2;
            this.Column_TeamID.FillWeight = 188.1243F;
            this.Column_TeamID.HeaderText = "Họ và tên";
            this.Column_TeamID.MinimumWidth = 6;
            this.Column_TeamID.Name = "Column_TeamID";
            this.Column_TeamID.ReadOnly = true;
            this.Column_TeamID.Width = 200;
            // 
            // Column_TeamName
            // 
            this.Column_TeamName.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.Column_TeamName.DataPropertyName = "Date";
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.Format = "d";
            dataGridViewCellStyle3.NullValue = null;
            this.Column_TeamName.DefaultCellStyle = dataGridViewCellStyle3;
            this.Column_TeamName.FillWeight = 48.99667F;
            this.Column_TeamName.HeaderText = "Ngày";
            this.Column_TeamName.MinimumWidth = 6;
            this.Column_TeamName.Name = "Column_TeamName";
            this.Column_TeamName.ReadOnly = true;
            this.Column_TeamName.Width = 160;
            // 
            // Column_DepartmentID
            // 
            this.Column_DepartmentID.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.Column_DepartmentID.DataPropertyName = "Checkin";
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle4.Format = "T";
            dataGridViewCellStyle4.NullValue = null;
            this.Column_DepartmentID.DefaultCellStyle = dataGridViewCellStyle4;
            this.Column_DepartmentID.FillWeight = 62.87906F;
            this.Column_DepartmentID.HeaderText = "Giờ vào";
            this.Column_DepartmentID.MinimumWidth = 6;
            this.Column_DepartmentID.Name = "Column_DepartmentID";
            this.Column_DepartmentID.ReadOnly = true;
            this.Column_DepartmentID.Width = 160;
            // 
            // Column1
            // 
            this.Column1.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.None;
            this.Column1.DataPropertyName = "Checkout";
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle5.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle5.Format = "T";
            dataGridViewCellStyle5.NullValue = null;
            this.Column1.DefaultCellStyle = dataGridViewCellStyle5;
            this.Column1.HeaderText = "Giờ ra";
            this.Column1.MinimumWidth = 6;
            this.Column1.Name = "Column1";
            this.Column1.ReadOnly = true;
            this.Column1.Width = 160;
            // 
            // Column2
            // 
            this.Column2.DataPropertyName = "Working_Hours";
            dataGridViewCellStyle6.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle6.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Column2.DefaultCellStyle = dataGridViewCellStyle6;
            this.Column2.HeaderText = "Số giờ làm";
            this.Column2.MinimumWidth = 6;
            this.Column2.Name = "Column2";
            this.Column2.ReadOnly = true;
            this.Column2.Width = 150;
            // 
            // frmPersonalTimesheet
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(872, 679);
            this.Controls.Add(this.panel7);
            this.Controls.Add(this.panel6);
            this.Controls.Add(this.panel5);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.panel2);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "frmPersonalTimesheet";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmPersonalTimesheet";
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.TopBar.ResumeLayout(false);
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.pn_Minimize.ResumeLayout(false);
            this.pn_Maximize.ResumeLayout(false);
            this.pn_Close.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel7.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dtvgPersonalTimeSheet)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label lPosition;
        private System.Windows.Forms.Label lTeam;
        private System.Windows.Forms.Label lDepartment;
        private System.Windows.Forms.Label lName;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Button btn_Submit;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cbMonth;
        private System.Windows.Forms.ComboBox cbYear;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Panel TopBar;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel pn_Minimize;
        private System.Windows.Forms.Button btnMinimize;
        private System.Windows.Forms.Panel pn_Maximize;
        private System.Windows.Forms.Button btnMaximize;
        private System.Windows.Forms.Panel pn_Close;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.Panel panel7;
        private System.Windows.Forms.DataGridView dtvgPersonalTimeSheet;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column_TeamID;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column_TeamName;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column_DepartmentID;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column2;
    }
}