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
    public class PositionDAO
    {
        private readonly IDbConnection _dbConnection;

        public PositionDAO()
        {
            _dbConnection = new NpgsqlConnection(CONSTANTS.CONNECTIONSTRING);
        }

        //Get Position
        public List<PositionDTO> GetPositionDTO()
        {
            String query = "SELECT Position_id, Position_name FROM public.position_tb";
            return _dbConnection.Query<PositionDTO>(query).ToList();
        }
    }
}
