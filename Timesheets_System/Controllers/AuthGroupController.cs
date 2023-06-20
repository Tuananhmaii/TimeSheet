using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Timesheets_System.Models.DAO;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Controllers
{
    public class AuthGroupController
    {
        AuthGroupDAO _authDAO = new AuthGroupDAO();
        public List<AuthGroupDTO> GetAuthGroupDTO()
        {
            return _authDAO.GetAuthGroupDTO();
        }
    }
}
