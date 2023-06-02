using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Views.Screen
{
    public partial class frmScreen : Form
    {
        ScreenAuthController _screenAuthController = new ScreenAuthController();
        public frmScreen()
        {
            InitializeComponent();
        }

        private void frmScreen_Load(object sender, EventArgs e)
        {
            List<ScreenAuthDTO> screenNames = new List<ScreenAuthDTO>();
            screenNames = _screenAuthController.GetScreen();
            List<ScreenAuthDTO> screenValues = new List<ScreenAuthDTO>();
            screenValues = _screenAuthController.GetScreenRoles();
            //var mergedList = screenNames.Concat(screenValues)
            //          .GroupBy(item => item.Screen_ID)
            //          .Select(group => new ScreenAuthDTO
            //          {
            //              Screen_ID = group.Key,
            //              Screen_name = string.Join(",", group.Select(item => item.Screen_name)),
            //              Admin = group.Sum(item => item.Admin),
            //              User = group.Sum(item => item.User)
            //          })
            //          .ToList();
            
            dtgvScreen.DataSource = screenValues;
            dtgvScreen.Columns["Auth_Group_ID"].Visible = false;
            dtgvScreen.Columns["Allowed_To_Open"].Visible = false;

        }
    }
}
