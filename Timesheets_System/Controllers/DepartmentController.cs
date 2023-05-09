using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Timesheets_System.Models.DAO;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Controllers
{
    public class DepartmentController
    {
        DepartmentDAO departmentDAO = new DepartmentDAO();

        public List<DepartmentDTO> GetDepartmentDTO()
        {
            return departmentDAO.GetDepartmentDTO();
        }

        public List<DepartmentDTO> GetDepartmentDTO(string ID)
        {
            return departmentDAO.GetDepartmentDTO(ID);
        }

        public void AddDepartmentDTO(DepartmentDTO department)
        {
            departmentDAO.AddDepartmentDTO(department);
        }

        public void DeleteDepartmentByID(string ID)
        {
            departmentDAO.DeleteDepartmentByID(ID);
        }

        public void UpdateDepartmentDTO(DepartmentDTO department)
        {
            departmentDAO.UpdateDepartmentDTO(department);
        }
    }
}
