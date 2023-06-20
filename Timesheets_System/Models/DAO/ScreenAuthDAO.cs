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
            //string query = "SELECT screen_auth_tb.screen_id, screen_tb.screen_name, allowed_to_open FROM screen_auth_tb " +
            //    "JOIN screen_tb ON screen_auth_tb.screen_id = screen_tb.screen_id " +
            //    "WHERE auth_group_id = @auth_group_id " +
            //    "ORDER BY screen_auth_tb.screen_id ASC";
            string query = "SELECT sc.screen_id, sc.screen_name, sa.auth_group_id, COALESCE(sa.allowed_to_open, '0') AS allowed_to_open " +
                "FROM screen_tb sc LEFT JOIN screen_auth_tb sa ON sc.screen_id = sa.screen_id " +
                "AND sa.auth_group_id = @auth_group_id";
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
            //String query = "UPDATE screen_auth_tb SET allowed_to_open = @allowed_to_open " +
            //    "WHERE screen_id = @screen_id and auth_group_id = @auth_group_id";
            string query = "INSERT INTO screen_auth_tb VALUES (@auth_group_id, @screen_id, @allowed_to_open) " +
                "ON CONFLICT (auth_group_id, screen_id) DO UPDATE SET allowed_to_open = @allowed_to_open";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("allowed_to_open", allowed_to_open);
            parameters.Add("screen_id", screen_id);
            parameters.Add("auth_group_id", auth_group_id);
            _dbConnection.Query(query, parameters);
        }

        public void InsertAllFormsIntoDb(string screen_id, string screen_name)
        {
            string query = "INSERT INTO screen_tb SELECT @screen_id, @screen_name " +
                "WHERE NOT EXISTS (SELECT 1 FROM screen_tb WHERE screen_id = @screen_id);";

            var parameters = new DynamicParameters();
            parameters.Add("screen_id", screen_id);
            parameters.Add("screen_name", screen_name);

            _dbConnection.Query<ScreenAuthDTO>(query, parameters).ToList();
        }

        public void GrantAccessAllFormsToAdmin(string screen_id)
        {
            string query = "INSERT INTO screen_auth_tb SELECT 'Admin', @screen_id, '1' " +
                "WHERE NOT EXISTS (SELECT 1 FROM screen_auth_tb " +
                "WHERE auth_group_id = 'Admin' AND screen_id = @screen_id " +
                "AND allowed_to_open = '1');";

            var parameters = new DynamicParameters();
            parameters.Add("screen_id", screen_id);
            _dbConnection.Query<ScreenAuthDTO>(query, parameters).ToList();
        }
    }
}
