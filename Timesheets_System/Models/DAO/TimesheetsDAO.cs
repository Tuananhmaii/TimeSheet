using Dapper;
using Microsoft.Office.Interop.Excel;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Models.DAO
{
    public class TimesheetsDAO
    {

        private readonly IDbConnection _dbConnection;

        public TimesheetsDAO()
        {
            _dbConnection = new NpgsqlConnection(CONSTANTS.CONNECTIONSTRING);
        }

        public List<TimesheetsDTO> GetTimeSheetsByMonth(TimesheetsDTO _timesheetsDTO)
        {
            string query = "SELECT * FROM timesheets_tb WHERE year = @year AND month = @month";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("year", _timesheetsDTO.Year);
            parameters.Add("month", _timesheetsDTO.Month);

            return _dbConnection.Query<TimesheetsDTO>(query, parameters).ToList();
        }

        // Query for report
        public List<TimesheetsDTO> GetTimeSheetsReport()
        {
            string query = "SELECT fullname, year, month, total_working_days,\ntotal_working_hours FROM timesheets_tb";
            return _dbConnection.Query<TimesheetsDTO>(query).ToList();
        }

        public bool TimesheetsExist(TimesheetsDTO _timesheetsDTO)
        {
            string query = @"SELECT COUNT(fullname) " +
                                    "FROM timesheets_tb " +
                                    "WHERE fullname = @fullname AND year = @year AND month = @month";

            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("fullname", _timesheetsDTO.Fullname);
            parameters.Add("year", _timesheetsDTO.Year);
            parameters.Add("month", _timesheetsDTO.Month);

            return _dbConnection.ExecuteScalar<bool>(query, parameters);
        }

        public void InsertNewTimesheets(TimesheetsDTO _timesheetsDTO)
        {
            string query = @"INSERT INTO Timesheets_tb (username, fullname, year, month) VALUES (@username, @fullname, @year, @month)";

            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("username", _timesheetsDTO.Username);
            parameters.Add("fullname", _timesheetsDTO.Fullname);
            parameters.Add("year", _timesheetsDTO.Year);
            parameters.Add("month", _timesheetsDTO.Month);

            _dbConnection.Execute(query, parameters);
        }

        public void UpdateTimesheetsByDay(TimesheetsDetailsDTO _timesheetsDetailsDTO)
        {
            string updateForClm = _timesheetsDetailsDTO.Date.Day.ToString();
            string query = $"UPDATE Timesheets_tb SET D{updateForClm} = @working_hours WHERE fullname = @fullname AND year = @year AND month = @month";

            DynamicParameters parameters = new DynamicParameters();
            //parameters.Add("day", _timesheetsDetailsDTO.Date.Day);
            parameters.Add("working_hours", _timesheetsDetailsDTO.Working_Hours);
            parameters.Add("fullname", _timesheetsDetailsDTO.Fullname);
            parameters.Add("year", _timesheetsDetailsDTO.Date.Year);
            parameters.Add("month", _timesheetsDetailsDTO.Date.Month);

            _dbConnection.Execute(query, parameters);
        }

    }
}
