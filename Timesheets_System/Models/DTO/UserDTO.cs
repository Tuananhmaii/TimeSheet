using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace Timesheets_System.Models.DTO
{
    public class UserDTO
    {

        //private string _username;
        //private string _password;
        //private string _fullname;
        //private bool _gender;
        //private DateTime _birthDate;
        //private string _email;
        //private string _phone;
        //private string _address;
        //private string _ethnic;
        //private string _religion;
        //private string _citizenID;
        //private string _taxCode;
        //private string _socialInsuranceNo;
        //private string _photo;
        //private DateTime _dateHired;
        //private string _contractNo;
        //private string _authGroupID;

        //public string Username { get => _username; set => _username = value; }
        //public string Password { get => _password; set => _password = value; }
        //public string Fullname { get => _fullname; set => _fullname = value; }
        //public bool Gender { get => _gender; set => _gender = value; }
        //public DateTime Birth_Date { get => _birthDate; set => _birthDate = value; }
        //public string Email { get => _email; set => _email = value; }
        //public string Phone { get => _phone; set => _phone = value; }
        //public string Address { get => _address; set => _address = value; }
        //public string Ethnic { get => _ethnic; set => _ethnic = value; }
        //public string Religion { get => _religion; set => _religion = value; }
        //public string Citizen_ID { get => _citizenID; set => _citizenID = value; }
        //public string Tax_Code { get => _taxCode; set => _taxCode = value; }
        //public string Social_Insurance_No { get => _socialInsuranceNo; set => _socialInsuranceNo = value; }
        //public string Photo { get => _photo; set => _photo = value; }
        //public DateTime Date_Hired { get => _dateHired; set => _dateHired = value; }
        //public string Contract_No { get => _contractNo; set => _contractNo = value; }
        //public string Auth_Group_ID { get => _authGroupID; set => _authGroupID = value; }

        public string Username { get; set; }
        public string Password { get; set; }
        public string Fullname { get; set; }
        public bool Gender { get; set; }
        public DateTime Birth_Date { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Ethnic { get; set; }
        public string Religion { get; set; }
        public string Citizen_ID { get; set; }
        public string Tax_Code { get; set; }
        public string Social_Insurance_No { get; set; }
        public byte[] Photo { get; set; }
        public DateTime Date_Hired { get; set; }
        public string Contract_No { get; set; }
        public string Auth_Group_ID { get; set; }
        public string Department_id { get; set; }
        public string Department_name { get; set; }
        public string Team_id { get; set; }
        public string Team_name { get; set; }
        public string Position_id { get; set; }
        public string Position_name { get; set; }
    }
}
