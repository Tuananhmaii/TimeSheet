using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Timesheets_System.Models.DTO
{
    public class ScreenAuthDTO
    {

        //private string _AuthGroupID;
        //private string _ScreenID;
        //private string _AllowedToOpen;

        //public string Auth_Group_ID { get => _AuthGroupID; set => _AuthGroupID = value; }
        //public string Screen_ID { get => _ScreenID; set => _ScreenID = value; }
        //public string Allowed_To_Open { get => _AllowedToOpen; set => _AllowedToOpen = value; }

        public string Auth_Group_ID { get ; set ; }
        public string Screen_ID { get ; set; }
        public string Allowed_To_Open { get ; set; }

    }
}
