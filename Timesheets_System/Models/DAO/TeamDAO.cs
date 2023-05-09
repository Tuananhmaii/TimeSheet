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
    public class TeamDAO
    {
        private readonly IDbConnection _dbConnection;

        public TeamDAO()
        {
            _dbConnection = new NpgsqlConnection(CONSTANTS.CONNECTIONSTRING);
        }

        //Get Team
        public List<TeamDTO> GetTeamDTO(string current_department_id)
        {
            String query = "SELECT * FROM public.team_tb WHERE LOWER(team_id)=LOWER(@team_id)";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("team_id", current_department_id);
            return _dbConnection.Query<TeamDTO>(query, parameters).ToList();
        }

        public List<TeamDTO> GetTeamDTO()
        {
            String query = "SELECT * FROM team_tb INNER JOIN department_tb ON team_tb.department_id = department_tb.department_id ORDER BY team_tb.department_id";
            return _dbConnection.Query<TeamDTO>(query).ToList();
        }

        public void AddTeamDTO(TeamDTO team)
        {
            String query = "INSERT INTO team_tb VALUES (@TeamID,@TeamName,@DepartmentID)";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("TeamID", team.Team_id);
            parameters.Add("TeamName", team.Team_name);
            parameters.Add("DepartmentID", team.Department_id);
            _dbConnection.Query(query, parameters);
        }

        public void DeleteTeamByID(string ID)
        {
            String query = "DELETE FROM team_tb WHERE team_id = @id";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("id", ID);
            _dbConnection.Query(query, parameters);
        }

        public void UpdateTeamDTO(TeamDTO team)
        {
            String query = "UPDATE team_tb SET team_name = @TeamName, department_id = @DepartmentId where team_id=@teamId";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("teamId", team.Team_id);
            parameters.Add("TeamName", team.Team_name);
            parameters.Add("DepartmentId", team.Department_id);
            _dbConnection.Query(query, parameters);
        }
    }
}
