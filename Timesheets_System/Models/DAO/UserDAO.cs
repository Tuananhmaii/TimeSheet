using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;
using Dapper;
using Timesheets_System.Models.DTO;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using System.Data.Common;
using Microsoft.Office.Interop.Excel;

namespace Timesheets_System.Models.DAO
{
    public class UserDAO
    {
        private readonly IDbConnection _dbConnection;

        public UserDAO()
        {
            _dbConnection = new NpgsqlConnection(CONSTANTS.CONNECTIONSTRING);
        }

        //Get tất cả username
        public List<UserDTO> GetAllUsernames()
        {
            String query = "Select username from user_tb;";
            return _dbConnection.Query<UserDTO>(query).ToList();
        }

        //Get tất cả người dùng trong Hệ thống
        public List<UserDTO> GetAllUsers()
        {
            String query = "SELECT * FROM user_tb LEFT JOIN team_tb ON user_tb.team_id = team_tb.team_id LEFT JOIN department_tb ON team_tb.department_id = department_tb.department_id LEFT JOIN position_tb ON user_tb.position_id = position_tb.position_id";
            return _dbConnection.Query<UserDTO>(query).ToList();
        }

        public List<UserDTO> GetAllUsersHaveDepartmentYet()
        {
            String query = "SELECT * FROM user_tb INNER JOIN team_tb ON user_tb.team_id = team_tb.team_id INNER JOIN department_tb ON team_tb.department_id = department_tb.department_id INNER JOIN position_tb ON user_tb.position_id = position_tb.position_id ";
            return _dbConnection.Query<UserDTO>(query).ToList();
        }

        //Get tất cả người dùng chưa có phòng
        public List<UserDTO> GetUsersHaveNoDepartment()
        {
            String query = "SELECT * FROM public.user_tb WHERE team_id IS NULL;";
            return _dbConnection.Query<UserDTO>(query).ToList();
        }

        //Get người dùng bằng tên đăng nhập
        public UserDTO GetUserByID(string username)
        {
            String query = "SELECT * FROM user_tb WHERE LOWER(username) = LOWER(@username)";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("username", username);

            return _dbConnection.QueryFirstOrDefault<UserDTO>(query, parameters);
        }

        //Get bảng có khóa ngoại với user
        public UserDTO GetForeignValue(string current_user)
        {
            String query = "SELECT user_tb.username, user_tb.fullname, team_tb.department_id, department_tb.department_name, user_tb.position_id, position_tb.position_name, user_tb.team_id, team_tb.team_name FROM user_tb INNER JOIN team_tb ON user_tb.team_id = team_tb.team_id INNER JOIN department_tb ON team_tb.department_id = department_tb.department_id INNER JOIN position_tb ON user_tb.position_id = position_tb.position_id WHERE user_tb.username = @current_user";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("current_user", current_user);

            return _dbConnection.QueryFirstOrDefault<UserDTO>(query, parameters);
        }

        //Get người dùng bằng tên thật
        public UserDTO GetUserByFullname(string fullname)
        {
            String query = "SELECT * FROM user_tb WHERE LOWER(fullname) = LOWER(@fullname)";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("fullname", fullname);

            return _dbConnection.QueryFirstOrDefault<UserDTO>(query, parameters);
        }

        //Update Auth_Group_Id
        public UserDTO UpdateAuth_Group_ID(string username, string auth_group_id)
        {
            String query = "UPDATE user_tb SET auth_group_id = @auth_group_id WHERE username = @username";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("auth_group_id", auth_group_id);
            parameters.Add("username", username);

            return _dbConnection.QueryFirstOrDefault<UserDTO>(query, parameters);
        }

        //Update ảnh đại diện bằng tên đăng nhập
        public UserDTO UpdatePhotoByID(string current_user, byte[] imageBytes)
        {
            String query = "UPDATE user_tb SET photo = @photo WHERE LOWER(username) = LOWER(@current_user)";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("photo", imageBytes);
            parameters.Add("current_user", current_user);

            return _dbConnection.QueryFirstOrDefault<UserDTO>(query, parameters);
        }

        public UserDTO LoadUserImage(string current_user)
        {
            String query = "SELECT photo FROM user_tb WHERE LOWER(username) = LOWER(@current_user)";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("current_user", current_user);

            return _dbConnection.QueryFirstOrDefault<UserDTO>(query, parameters);
        }

        public UserDTO CreateNewUser(UserDTO userDTO)
        {
            String query = "INSERT INTO user_tb  (username, password, fullname, gender, birth_date, email, phone, address, ethnic, religion, citizen_id, " + 
                                    "tax_code, social_insurance_no, date_hired, contract_no, auth_group_id , team_id, position_id, photo) " + 
                                    "VALUES(@username, @password, @fullname, @gender, @birth_date, @email, @phone, @address, @ethnic, @religion, " + 
                                    "@citizen_id, @tax_code, @social_insurance_no, @date_hired, @contract_no, 'User', @team_id, @position_id, @photo) ";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("username", userDTO.Username);
            parameters.Add("password", userDTO.Password);
            parameters.Add("fullname", userDTO.Fullname);
            parameters.Add("gender", userDTO.Gender);
            parameters.Add("birth_date", userDTO.Birth_Date);
            parameters.Add("email", userDTO.Email);
            parameters.Add("phone", userDTO.Phone);
            parameters.Add("address", userDTO.Address);
            parameters.Add("ethnic", userDTO.Ethnic);
            parameters.Add("religion", userDTO.Religion);
            parameters.Add("citizen_id", userDTO.Citizen_ID);
            parameters.Add("tax_code", userDTO.Tax_Code);
            parameters.Add("social_insurance_no", userDTO.Social_Insurance_No);
            parameters.Add("date_hired", userDTO.Date_Hired);
            parameters.Add("contract_no", userDTO.Contract_No);
            parameters.Add("team_id", userDTO.Team_id);
            parameters.Add("position_id", userDTO.Position_id);
            parameters.Add("photo", userDTO.Photo);

            return _dbConnection.QueryFirstOrDefault<UserDTO>(query, parameters);
        }

        public UserDTO UpdateUser(UserDTO userDTO, string current_user)
        {
            String query = "UPDATE user_tb SET fullname=@fullname, gender=@gender, birth_date=@birth_date, email=@email, phone=@phone, address=@address, ethnic=@ethnic, religion=@religion, citizen_id=@citizen_id, tax_code=@tax_code, social_insurance_no=@social_insurance_no, date_hired=@date_hired, contract_no=@contract_no, team_id=@team_id, position_id=@position_id WHERE LOWER(username) = LOWER(@current_user)";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("current_user", current_user);
            parameters.Add("fullname", userDTO.Fullname);
            parameters.Add("gender", userDTO.Gender);
            parameters.Add("birth_date", userDTO.Birth_Date);
            parameters.Add("email", userDTO.Email);
            parameters.Add("phone", userDTO.Phone);
            parameters.Add("address", userDTO.Address);
            parameters.Add("ethnic", userDTO.Ethnic);
            parameters.Add("religion", userDTO.Religion);
            parameters.Add("citizen_id", userDTO.Citizen_ID);
            parameters.Add("tax_code", userDTO.Tax_Code);
            parameters.Add("social_insurance_no", userDTO.Social_Insurance_No);
            parameters.Add("date_hired", userDTO.Date_Hired);
            parameters.Add("contract_no", userDTO.Contract_No);
            parameters.Add("team_id", userDTO.Team_id);
            parameters.Add("position_id", userDTO.Position_id);

            return _dbConnection.QueryFirstOrDefault<UserDTO>(query, parameters);
        }

        public void DeleteUserByID(string username)
        {
            String query = "DELETE FROM user_tb WHERE LOWER(username) = LOWER(@username)";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("username", username);

            _dbConnection.QueryFirstOrDefault<UserDTO>(query, parameters);
        }

        //Get người dùng theo phòng trong Hệ thống
        public List<UserDTO> GetUsersByDepartment(string department_id)
        {
            String query = "SELECT * FROM user_tb INNER JOIN team_tb ON user_tb.team_id = team_tb.team_id INNER JOIN department_tb ON team_tb.department_id = department_tb.department_id INNER JOIN position_tb ON user_tb.position_id = position_tb.position_id WHERE department_tb.department_id = @department_id";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("department_id", department_id);

            return _dbConnection.Query<UserDTO>(query, parameters).ToList();
        }

        // Đổi mật khẩu
        public UserDTO ChangePassword(string username, string newPassword)
        {
            String query = "UPDATE user_tb SET password = @newPassword WHERE LOWER(username) = LOWER(@username)";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("username", username);
            parameters.Add("newPassword", newPassword);
            return _dbConnection.QueryFirstOrDefault<UserDTO>(query, parameters);
        }

        // Lấy user với department, team và position
        public UserDTO GetUserWithFullInfo(string fullname)
        {
            String query = "SELECT * FROM user_tb " +
                "FULL JOIN team_tb ON user_tb.team_id = team_tb.team_id " +
                "FULL JOIN department_tb ON team_tb.department_id = department_tb.department_id " +
                "FULL JOIN position_tb ON user_tb.position_id = position_tb.position_id " +
                "where fullname = @fullname";
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("fullname", fullname);
            return _dbConnection.QueryFirstOrDefault<UserDTO>(query, parameters);
        }
    }
}
