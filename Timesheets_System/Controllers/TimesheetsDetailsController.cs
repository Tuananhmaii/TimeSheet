using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Timesheets_System.Models.DAO;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Controllers
{
    public class TimesheetsDetailsController
    {
        TimesheetsDetailsDAO _timesheetsDetailsDAO = new TimesheetsDetailsDAO();

        public TimesheetsDetailsDTO GetDetailsByFullnameAndDate(TimesheetsRawDataDTO _timesheetsRawDataDTO)
        {
            return _timesheetsDetailsDAO.GetDetailsByFullnameAndDate(_timesheetsRawDataDTO);
        }

        public List<TimesheetsDetailsDTO> GetUserTimeSheetDetailByMonth(TimesheetsDetailsDTO _timesheetsDetailDTO)
        {
            return _timesheetsDetailsDAO.GetUserTimeSheetDetailByMonth(_timesheetsDetailDTO);
        }
    }
}
