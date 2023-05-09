using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Timesheets_System.Models.DAO;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Controllers
{

    public class TimesheetsController
    {

        TimesheetsDAO _timesheetsDAO = new TimesheetsDAO();

        //public List<int> GetYears()
        //{
        //    return _timesheetsDAO.GetYears();
        //}

        //public List<TimesheetsDTO> GetTimesheetsList(int year, int month)
        //{
        //    return _timesheetsDAO.GetTimesheetsList(year, month);
        //}

        public List<TimesheetsDTO> GetTimeSheetsByMonth(TimesheetsDTO _timesheetsDTO)
        {
            return _timesheetsDAO.GetTimeSheetsByMonth(_timesheetsDTO);
        }

        //Report
        public List<TimesheetsDTO> GetTimeSheetsReport()
        {
            return _timesheetsDAO.GetTimeSheetsReport();
        }

        public bool TimesheetsExist(TimesheetsDTO _timesheetDTO)
        {
            return _timesheetsDAO.TimesheetsExist(_timesheetDTO);
        }

        public void InsertNewTimesheets(TimesheetsDTO _timesheetsDTO)
        {
            _timesheetsDAO.InsertNewTimesheets(_timesheetsDTO);
        }

        public void UpdateTimesheetsByDay(TimesheetsDetailsDTO _timesheetsDetailsDTO)
        {
            _timesheetsDAO.UpdateTimesheetsByDay(_timesheetsDetailsDTO);
        }
    }
}
