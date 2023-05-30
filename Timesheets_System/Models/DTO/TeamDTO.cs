using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Timesheets_System.Models.DTO
{
    public class TeamDTO
    {
        public string Team_id { get; set; }
        public string Team_name { get; set; } = string.Empty;
        public string Department_id { get; set; }
        public string Department_name { get; set; }

        public override string ToString()
        {
            return Team_name;
        }
    }
}