using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Timesheets_System.Models.DTO
{
    public class PositionDTO
    {
        public string Position_id { get; set; }
        public string Position_name { get; set; } = string.Empty;

        public override string ToString()
        {
            return Position_name;
        }
    }
}
