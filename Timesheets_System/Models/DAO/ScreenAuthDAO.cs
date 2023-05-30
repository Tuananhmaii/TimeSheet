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
