using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Timesheets_System.Models.DAO;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Controllers
{
    public class TimesheetsRawDataController
    {
        TimesheetsRawDataDAO _timesheetsRawDataDAO = new TimesheetsRawDataDAO();

        public void InsertTimesheetsRawData(List<TimesheetsRawDataDTO> rawData)
        {
            _timesheetsRawDataDAO.InsertTimesheetsRawData(rawData);
        }

        public void ConvertRawDataToDetailsData()
        {
            _timesheetsRawDataDAO.ConvertRawDataToDetailsData();
        }

        public List<TimesheetsRawDataDTO> GetRawDataList()
        {
            return _timesheetsRawDataDAO.GetRawDataList();
        }

        public void TruncateRawData()
        {
            _timesheetsRawDataDAO.TruncateRawData();
        }

    }
}
