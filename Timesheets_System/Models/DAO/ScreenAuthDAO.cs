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
    public class ScreenAuthDAO
    {
        private readonly IDbConnection _dbConnection;

        public ScreenAuthDAO()
        {
            _dbConnection = new NpgsqlConnection(CONSTANTS.CONNECTIONSTRING);
        }

        public List<ScreenAuthDTO> GetScreenRoles()
        {
            //string query = "select screen_auth_tb.screen_id, sum(CASE auth_group_id WHEN 'Admin' THEN 1 ELSE 0 END) AS Admin, sum(CASE auth_group_id WHEN 'User' THEN 1 ELSE 0 END) AS User from screen_auth_tb group by screen_auth_tb.screen_id";
            string query = "SELECT\r\n    screen_tb.screen_name,\r\n    SUM(CASE auth_group_id WHEN 'Admin' THEN 1 ELSE 0 END) AS Admin,\r\n    SUM(CASE auth_group_id WHEN 'User' THEN 1 ELSE 0 END) AS User\r\nFROM\r\n    screen_auth_tb\r\nRIGHT JOIN\r\n    screen_tb ON screen_auth_tb.screen_id = screen_tb.screen_id\r\nGROUP BY\r\n    screen_tb.screen_name";
            return _dbConnection.Query<ScreenAuthDTO>(query).ToList();
        }

        public List<ScreenAuthDTO> GetScreen()
        {
            string query = "SELECT * FROM public.screen_tb ORDER BY screen_id ASC ";
            return _dbConnection.Query<ScreenAuthDTO>(query).ToList();
        }



        public ScreenAuthDTO GetScreenAuthByAuthGrID(ScreenAuthDTO _screenAuthDTO)
        {
            string query = @"SELECT auth_group_id, screen_id, allowed_to_open " +
                                    "FROM screen_auth_tb " + 
                                    "WHERE auth_group_id = @Auth_Group_ID AND screen_id = @Screen_ID AND allowed_to_open = @Allowed_To_Open";

            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("Auth_Group_ID", _screenAuthDTO.Auth_Group_ID);
            parameters.Add("Screen_ID", _screenAuthDTO.Screen_ID);
            parameters.Add("Allowed_To_Open", _screenAuthDTO.Allowed_To_Open);

            return _dbConnection.QueryFirstOrDefault<ScreenAuthDTO>(query, parameters); 
        }


        public List<ScreenAuthDTO> GetScreenAuthList(ScreenAuthDTO _screenAuthDTO)
        {
            string query = @"SELECT auth_group_id, screen_id, allowed_to_open " +
                                    "FROM screen_auth_tb " +
                                    "WHERE auth_group_id = @Auth_Group_ID AND allowed_to_open = @Allowed_To_Open";

            var parameters = new DynamicParameters();
            parameters.Add("Auth_Group_ID", _screenAuthDTO.Auth_Group_ID);
            parameters.Add("Allowed_To_Open", _screenAuthDTO.Allowed_To_Open);

            return _dbConnection.Query<ScreenAuthDTO>(query, parameters).ToList();
        }


        public List<int> GetYears()
        {
            string query = @"SELECT DISTINCT year " +
                                    "FROM Timesheets_tb";

            return _dbConnection.Query<int>(query).ToList();
        }
    }
}
