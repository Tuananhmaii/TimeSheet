namespace Timesheets_System.Views
{
    partial class frmForgotPassword
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
            this.label3 = new System.Windows.Forms.Label();
            this.btForgotPassword = new System.Windows.Forms.Button();
            this.txbUsername = new System.Windows.Forms.TextBox();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel3
            // 
            this.panel3.Controls.Add(this.label3);
            this.panel3.Controls.Add(this.btForgotPassword);
            this.panel3.Controls.Add(this.txbUsername);
            this.panel3.Location = new System.Drawing.Point(73, 54);
            this.panel3.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(661, 258);
            this.panel3.TabIndex = 10;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Segoe UI Semibold", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(20, 43);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(137, 25);
            this.label3.TabIndex = 15;
            this.label3.Text = "Nhập tài khoản";
            // 
            // btForgotPassword
            // 
            this.btForgotPassword.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.btForgotPassword.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.btForgotPassword.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btForgotPassword.Font = new System.Drawing.Font("Times New Roman", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btForgotPassword.Location = new System.Drawing.Point(184, 193);
            this.btForgotPassword.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btForgotPassword.Name = "btForgotPassword";
            this.btForgotPassword.Size = new System.Drawing.Size(268, 43);
            this.btForgotPassword.TabIndex = 14;
            this.btForgotPassword.Text = "Quên mật khẩu";
            this.btForgotPassword.UseVisualStyleBackColor = false;
            this.btForgotPassword.Click += new System.EventHandler(this.btForgotPassword_Click);
            // 
            // txbUsername
            // 
            this.txbUsername.Font = new System.Drawing.Font("Segoe UI Semilight", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txbUsername.Location = new System.Drawing.Point(259, 39);
            this.txbUsername.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txbUsername.Name = "txbUsername";
            this.txbUsername.Size = new System.Drawing.Size(345, 31);
            this.txbUsername.TabIndex = 3;
            // 
            // frmForgotPassword
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(817, 394);
            this.Controls.Add(this.panel3);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "frmForgotPassword";
            this.Text = "frmForgotPassword";
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Button btForgotPassword;
        private System.Windows.Forms.TextBox txbUsername;
        private System.Windows.Forms.Label label3;
    }
}