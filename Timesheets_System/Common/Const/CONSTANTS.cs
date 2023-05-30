using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Timesheets_System.Models
{
    public static class CONSTANTS
    {
        public static string CONNECTIONSTRING = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
    }

}
