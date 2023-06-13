using Dapper;
using Microsoft.Office.Interop.Excel;
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

        public List<ScreenAuthDTO> GetScreenRoles(string auth_group_id)
        {
            //string query = "select screen_auth_tb.screen_id, sum(CASE auth_group_id WHEN 'Admin' THEN 1 ELSE 0 END) AS Admin, sum(CASE auth_group_id WHEN 'User' THEN 1 ELSE 0 END) AS User from screen_auth_tb group by screen_auth_tb.screen_id";
            string query = "SELECT screen_auth_tb.screen_id, screen_tb.screen_name, allowed_to_open FROM screen_auth_tb " +
                "JOIN screen_tb ON screen_auth_tb.screen_id = screen_tb.screen_id " +
                "WHERE auth_group_id = @auth_group_id " +
                "ORDER BY screen_auth_tb.screen_id ASC";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("auth_group_id", auth_group_id);
            return _dbConnection.Query<ScreenAuthDTO>(query, parameters).ToList();
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

        public void UpdateAllowScreenAuth(string screen_id, string auth_group_id, string allowed_to_open)
        {
            String query = "UPDATE screen_auth_tb SET allowed_to_open = @allowed_to_open " +
                "WHERE screen_id = @screen_id and auth_group_id = @auth_group_id";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("allowed_to_open", allowed_to_open);
            parameters.Add("screen_id", screen_id);
            parameters.Add("auth_group_id", auth_group_id);
            _dbConnection.Query(query, parameters);
        }
    }
}
