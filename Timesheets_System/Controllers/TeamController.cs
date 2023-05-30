using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Timesheets_System.Models.DAO;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Controllers
{
    public class TeamController
    {
        TeamDAO teamDAO = new TeamDAO();

        public List<TeamDTO> GetTeamDTO(string current_department_id)
        {
            return teamDAO.GetTeamDTO(current_department_id);
        }

        public List<TeamDTO> GetTeamDTO()
        {
            return teamDAO.GetTeamDTO();
        }

        public void AddTeamDTO(TeamDTO team)
        {
            teamDAO.AddTeamDTO(team);
        }

        public void DeleteTeamByID(string ID)
        {
            teamDAO.DeleteTeamByID(ID);
        }

        public void UpdateTeamDTO(TeamDTO team)
        {
            teamDAO.UpdateTeamDTO(team);
        }
    }
}
