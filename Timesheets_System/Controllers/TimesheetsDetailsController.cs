using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Timesheets_System.Models.DAO;
using Timesheets_System.Models.DTO;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace Timesheets_System.Controllers
{
    public class TimesheetsDetailsController
    {
        TimesheetsDetailsDAO _timesheetsDetailsDAO = new TimesheetsDetailsDAO();

        public TimesheetsDetailsDTO GetDetailsByFullnameAndDate(TimesheetsRawDataDTO _timesheetsRawDataDTO)
        {
            return _timesheetsDetailsDAO.GetDetailsByFullnameAndDate(_timesheetsRawDataDTO);
        }

        public List<TimesheetsDetailsDTO> GetUserTimeSheetDetailByMonth(string fullname, int year, int month)
        {
            return _timesheetsDetailsDAO.GetUserTimeSheetDetailByMonth(fullname, year, month);
        }
        public List<TimesheetsDetailsDTO> GetIndividualReport(string username, int year, int month)
        {
            return _timesheetsDetailsDAO.GetIndividualReport(username, year, month);
        }
    }
}
