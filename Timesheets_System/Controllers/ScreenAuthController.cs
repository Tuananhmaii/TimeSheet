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

        public ScreenAuthDTO GetScreenAuthByAuthGrID(ScreenAuthDTO _screenAuthDTO)
        {
            return _screenAuthDAO.GetScreenAuthByAuthGrID(_screenAuthDTO);
        }


        public List<ScreenAuthDTO> GetScreenAuthList(ScreenAuthDTO _screenAuthDTO) 
        {
            return _screenAuthDAO.GetScreenAuthList(_screenAuthDTO);
        }


     
    }
}
