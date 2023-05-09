using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Timesheets_System.Models.DTO
{
    public class TimesheetsRawDataDTO
    {
        public TimesheetsRawDataDTO() { }

        public string Fullname { get; set; }
        public DateTime In_Out_Time { get; set; }

    }
}
