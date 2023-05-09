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
    public class DepartmentDAO
    {
        private readonly IDbConnection _dbConnection;

        public DepartmentDAO()
        {
            _dbConnection = new NpgsqlConnection(CONSTANTS.CONNECTIONSTRING);
        }

        //Get Department
        public List<DepartmentDTO> GetDepartmentDTO()
        {
            String query = "SELECT * FROM public.department_tb ORDER BY department_id";
            return _dbConnection.Query<DepartmentDTO>(query).ToList();
        }

        public List<DepartmentDTO> GetDepartmentDTO(string id)
        {
            String query = "SELECT * FROM public.department_tb where LOWER(department_id)=LOWER(@ID)";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("ID", id);
            return _dbConnection.Query<DepartmentDTO>(query, parameters).ToList();
        }

        //Add Department
        public void AddDepartmentDTO(DepartmentDTO department)
        {
            String query = "INSERT INTO department_tb VALUES (@ID,@Name,@Description)";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("ID", department.Department_id);
            parameters.Add("Name", department.Department_name);
            parameters.Add("Description", department.Descriptions);
            _dbConnection.Query<DepartmentDTO>(query, parameters).ToList();
        }

        public void DeleteDepartmentByID(string ID)
        {
            String query = "DELETE FROM department_tb WHERE department_id = @id";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("id", ID);
            _dbConnection.Query(query, parameters);
        }

        public void UpdateDepartmentDTO(DepartmentDTO department)
        {
            String query = "UPDATE department_tb SET department_name = @Name, \"descriptions\" = @Description " +
                "WHERE department_id = @ID";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("ID", department.Department_id);
            parameters.Add("Name", department.Department_name);
            parameters.Add("Description", department.Descriptions);
            _dbConnection.Query(query, parameters);
        }
    }
}
