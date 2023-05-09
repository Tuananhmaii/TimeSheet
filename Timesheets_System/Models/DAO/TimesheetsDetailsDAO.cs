using Dapper;
using Microsoft.Office.Interop.Excel;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Models.DAO
{
    public class TimesheetsDetailsDAO
    {
        private readonly IDbConnection _dbConnection;

        public TimesheetsDetailsDAO()
        {
            _dbConnection = new NpgsqlConnection(CONSTANTS.CONNECTIONSTRING);
        }

        public TimesheetsDetailsDTO GetDetailsByFullnameAndDate(TimesheetsRawDataDTO _timesheetsRawDataDTO)
        {
            string query = @"SELECT fullname, date, working_hours " +
                                    "FROM timesheets_details_tb " +
                                    "WHERE fullname = @fullname AND date = @date";

            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("fullname", _timesheetsRawDataDTO.Fullname);
            parameters.Add("date", _timesheetsRawDataDTO.In_Out_Time.Date);

            return _dbConnection.QueryFirstOrDefault<TimesheetsDetailsDTO>(query, parameters);
        }

        public List<TimesheetsDetailsDTO> GetUserTimeSheetDetailByMonth(TimesheetsDetailsDTO _timesheetsDetailsDTO)
        {
            string query = "SELECT * FROM timesheets_details_tb WHERE fullname = @fullname and extract(year FROM date) = @year AND extract(month from date) = @month";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("fullname", _timesheetsDetailsDTO.Fullname);
            parameters.Add("year", _timesheetsDetailsDTO.Date.Year);
            parameters.Add("month", _timesheetsDetailsDTO.Date.Month);

            return _dbConnection.Query<TimesheetsDetailsDTO>(query, parameters).ToList();
        }
    }
}
