using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Timesheets_System.Models.DAO;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Controllers
{
    public class PositionController
    {
        PositionDAO positionDAO = new PositionDAO();

        public List<PositionDTO> GetPositionDTO()
        {
            return positionDAO.GetPositionDTO();
        }
        
    }
}
