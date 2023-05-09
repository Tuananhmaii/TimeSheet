namespace Timesheets_System.Views
{
    partial class frmGeneralReport
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
            this.panel3 = new System.Windows.Forms.Panel();
            this.txbMonth = new System.Windows.Forms.TextBox();
            this.txbYear = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txbTeam = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txbDepartment = new System.Windows.Forms.TextBox();
            this.btExportData = new System.Windows.Forms.Button();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.label4 = new System.Windows.Forms.Label();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.txbMonth);
            this.panel3.Controls.Add(this.txbYear);
            this.panel3.Controls.Add(this.label6);
            this.panel3.Controls.Add(this.txbTeam);
            this.panel3.Controls.Add(this.label5);
            this.panel3.Controls.Add(this.label2);
            this.panel3.Controls.Add(this.label1);
            this.panel3.Controls.Add(this.label3);
            this.panel3.Controls.Add(this.txbDepartment);
            this.panel3.Location = new System.Drawing.Point(12, 83);
            this.panel3.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(776, 282);
            this.panel3.TabIndex = 8;
            // 
            // txbMonth
            // 
            this.txbMonth.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txbMonth.Location = new System.Drawing.Point(519, 161);
            this.txbMonth.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txbMonth.Name = "txbMonth";
            this.txbMonth.Size = new System.Drawing.Size(191, 31);
            this.txbMonth.TabIndex = 21;
            // 
            // txbYear
            // 
            this.txbYear.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txbYear.Location = new System.Drawing.Point(128, 161);
            this.txbYear.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txbYear.Name = "txbYear";
            this.txbYear.Size = new System.Drawing.Size(191, 31);
            this.txbYear.TabIndex = 20;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Segoe UI Semibold", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(414, 167);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(63, 25);
            this.label6.TabIndex = 19;
            this.label6.Text = "Tháng";
            // 
            // txbTeam
            // 
            this.txbTeam.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txbTeam.Location = new System.Drawing.Point(519, 102);
            this.txbTeam.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txbTeam.Name = "txbTeam";
            this.txbTeam.Size = new System.Drawing.Size(191, 31);
            this.txbTeam.TabIndex = 17;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Segoe UI Semibold", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(44, 23);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(149, 25);
            this.label5.TabIndex = 16;
            this.label5.Text = "Thông tin chung";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI Semibold", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(17, 167);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(51, 25);
            this.label2.TabIndex = 15;
            this.label2.Text = "Năm";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI Semibold", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(414, 105);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 25);
            this.label1.TabIndex = 14;
            this.label1.Text = "Team";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Segoe UI Semibold", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(17, 105);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(80, 25);
            this.label3.TabIndex = 13;
            this.label3.Text = "Bộ phận";
            // 
            // txbDepartment
            // 
            this.txbDepartment.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txbDepartment.Location = new System.Drawing.Point(128, 102);
            this.txbDepartment.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txbDepartment.Name = "txbDepartment";
            this.txbDepartment.Size = new System.Drawing.Size(191, 31);
            this.txbDepartment.TabIndex = 4;
            // 
            // btExportData
            // 
            this.btExportData.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.btExportData.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.btExportData.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btExportData.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btExportData.Location = new System.Drawing.Point(258, 369);
            this.btExportData.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btExportData.Name = "btExportData";
            this.btExportData.Size = new System.Drawing.Size(268, 43);
            this.btExportData.TabIndex = 13;
            this.btExportData.Text = "Xuất thông tin";
            this.btExportData.UseVisualStyleBackColor = false;
            this.btExportData.Click += new System.EventHandler(this.btExportData_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI Semibold", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(344, 34);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(100, 25);
            this.label4.TabIndex = 16;
            this.label4.Text = "Bảng công";
            // 
            // frmGeneralReport
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btExportData);
            this.Controls.Add(this.panel3);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "frmGeneralReport";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Đổi mật khẩu";
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.TextBox txbDepartment;
        private System.Windows.Forms.Button btExportData;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txbTeam;
        private System.Windows.Forms.TextBox txbMonth;
        private System.Windows.Forms.TextBox txbYear;
    }
}