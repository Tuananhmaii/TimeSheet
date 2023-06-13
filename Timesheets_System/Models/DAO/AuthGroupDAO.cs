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
    public class AuthGroupDAO
    {
        private readonly IDbConnection _dbConnection;

        public AuthGroupDAO()
        {
            _dbConnection = new NpgsqlConnection(CONSTANTS.CONNECTIONSTRING);
        }
        public List<AuthGroupDTO> GetAuthGroupDTO()
        {
            String query = "SELECT * FROM public.auth_group_tb ORDER BY auth_group_id ASC ";
            return _dbConnection.Query<AuthGroupDTO>(query).ToList();
        }
    }
}
