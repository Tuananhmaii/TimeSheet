using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Timesheets_System.Views.User
{
    public partial class frmAcceptDeleteUser : Form
    {
        public string username;
        public bool confirm;
        public frmAcceptDeleteUser()
        {
            InitializeComponent();
        }
        public void getValue(string username)
        {
            this.username = username;
        }
        public bool setValue()
        {
            return confirm;
        }

        private void btn_Submit_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == username)
            {
                confirm = true;
                this.Close();
            }
            else label2.Text = "Error!";
        }

        private void btn_Cancel_Click(object sender, EventArgs e)
        {
            confirm = false;
            this.Close();
        }

        private void frmAcceptDeleteUser_Load(object sender, EventArgs e)
        {
            label1.Text = "Hãy nhập '" + username + "' vào ô bên dưới để xóa!";
        }
    }
}
