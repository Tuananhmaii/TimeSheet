﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Timesheets_System.Models.DAO;
using Timesheets_System.Models.DTO;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;


namespace Timesheets_System.Controllers
{

    public class UserController
    {
        UserDAO _userDAO = new UserDAO();

        public List<UserDTO> GetAllUsernames()
        {
            return _userDAO.GetAllUsernames();
        }

        public UserDTO GetUserByID(string username)
        {
            return _userDAO.GetUserByID(username);
        }

        public List<UserDTO> GetAllUsersHaveDepartmentYet()
        {
            return _userDAO.GetAllUsersHaveDepartmentYet();
        }

        public List<UserDTO> GetUsersHaveNoDepartment()
        {
            return _userDAO.GetUsersHaveNoDepartment();
        }

        public UserDTO GetForeignValue(string current_user)
        {
            return _userDAO.GetForeignValue(current_user);
        }

        public UserDTO GetUserByFullname(string fullname)
        {
            return _userDAO.GetUserByFullname(fullname);
        }

        public UserDTO UpdateAuth_Group_ID(string username, string auth_group_id)
        {
            return _userDAO.UpdateAuth_Group_ID(username, auth_group_id);
        }

        public UserDTO UpDatePhotoByID(string username, byte[] imageBytes)
        {
            return _userDAO.UpdatePhotoByID(username, imageBytes);
        }

        public UserDTO LoadUserImage(string current_user)
        {
            return _userDAO.LoadUserImage(current_user);
        }

        public UserDTO CreateNewUser(UserDTO userDTO)
        {
            return _userDAO.CreateNewUser(userDTO);
        }

        public UserDTO UpdateUserProfile(UserDTO userDTO, string current_user)
        {
            return _userDAO.UpdateUser(userDTO, current_user);
        }

        public List<UserDTO> GetAllUsers() 
        {
            return _userDAO.GetAllUsers();
        }

        public void DeleteUserByID(string username)
        {
            _userDAO.DeleteUserByID(username);
        }

        public List<UserDTO> GetUsersByDepartment(string department_id)
        {
            return _userDAO.GetUsersByDepartment(department_id);
        }

        public UserDTO ChangePassword(string username, string newPassword)
        {
            return _userDAO.ChangePassword(username, newPassword);
        }

        public UserDTO GetUserWithFullInfo(string fullname)
        {
            return _userDAO.GetUserWithFullInfo(fullname);
        }
    }
}
