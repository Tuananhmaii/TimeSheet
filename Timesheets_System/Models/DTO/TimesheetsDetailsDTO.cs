using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Timesheets_System.Models.DTO
{
    public class TimesheetsDetailsDTO
    {
        public string Username { get; set; }
        public string Fullname { get; set; }
        public DateTime Date { get; set; }
        public DateTime Checkin { get; set; }
        public DateTime Checkout { get; set; }
        public float Working_Hours { get; set; }
    }
}
