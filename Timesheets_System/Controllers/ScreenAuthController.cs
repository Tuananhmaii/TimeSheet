using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Timesheets_System.Models.DAO;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Controllers
{
    public class ScreenAuthController
    {
        ScreenAuthDAO _screenAuthDAO = new ScreenAuthDAO();

        public List<ScreenAuthDTO> GetScreen()
        {
            return _screenAuthDAO.GetScreen();
        }

        public List<ScreenAuthDTO> GetScreenRoles()
        {
            return _screenAuthDAO.GetScreenRoles();
        }

        public ScreenAuthDTO GetScreenAuthByAuthGrID(ScreenAuthDTO _screenAuthDTO)
        {
            return _screenAuthDAO.GetScreenAuthByAuthGrID(_screenAuthDTO);
        }


        public List<ScreenAuthDTO> GetScreenAuthList(ScreenAuthDTO _screenAuthDTO) 
        {
            return _screenAuthDAO.GetScreenAuthList(_screenAuthDTO);
        }

        public void UpdateAllowScreenAuth(string screen_id, string auth_group_id, string allowed_to_open)
        {
            _screenAuthDAO.UpdateAllowScreenAuth(screen_id, auth_group_id, allowed_to_open);
        }



    }
}
