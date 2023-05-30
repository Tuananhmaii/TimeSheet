using Dapper;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Models.DAO
{
    public class TimesheetsRawDataDAO
    {
        private readonly IDbConnection _dbConnection;

        public TimesheetsRawDataDAO()
        {
            _dbConnection = new NpgsqlConnection(CONSTANTS.CONNECTIONSTRING);
        }


        public void InsertTimesheetsRawData(List<TimesheetsRawDataDTO> rawData)
        {
            string query = "INSERT INTO Timesheets_raw_data_tb(fullname, in_out_time) VALUES (@Fullname, @In_Out_Time)";
            _dbConnection.Execute(query, rawData);
        }


        public void ConvertRawDataToDetailsData()
        {
            string query = @"INSERT INTO timesheets_details_tb(fullname, date, checkin, checkout, working_hours) " +
                                    "SELECT fullname, CAST(in_out_time AS DATE) AS date, MIN(in_out_time) AS checkin, MAX(in_out_time)AS checkout, " +
                                    "CASE WHEN CAST(EXTRACT(EPOCH FROM (MAX(in_out_time) - MIN(in_out_time))) / 3600 AS NUMERIC(10,1)) > 8 THEN 8 " +
                                    "ELSE CAST(EXTRACT(EPOCH FROM (MAX(in_out_time) - MIN(in_out_time))) / 3600 AS NUMERIC(10,1)) " +
                                    "END AS duration " +
                                    "FROM  timesheets_raw_data_tb " +
                                    "GROUP BY fullname," +
                                    " CAST(in_out_time AS DATE)";
            _dbConnection.Execute(query);
        }

        public List<TimesheetsRawDataDTO> GetRawDataList() 
        {
            string query = @"SELECT fullname, DATE_TRUNC('day', in_out_time) AS in_out_time " +
                                    "FROM timesheets_raw_data_tb " +
                                    "GROUP BY fullname, DATE_TRUNC('day', in_out_time) "+
                                    "ORDER BY fullname, DATE_TRUNC('day', in_out_time)";

            return _dbConnection.Query<TimesheetsRawDataDTO>(query).ToList();   
        }

        public void TruncateRawData()
        {
            string query = @"TRUNCATE TABLE timesheets_raw_data_tb";
            _dbConnection.Execute(query);
        }

    }
}
