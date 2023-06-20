using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Security.Policy;
using System.Windows.Forms;
using System.Windows.Markup;
using Dapper;
using MaterialSkin;
using MaterialSkin.Controls;
using Timesheets_System.Common.Const;
using Timesheets_System.Common.Util;
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Views.User
{
    public partial class frmUserDetail : Form
    {
        UserController _userController = new UserController(); // Biến cục bộ UserController để chạy các function trong DAO
        DepartmentController _departmentController = new DepartmentController();
        TeamController _teamController = new TeamController();
        PositionController _positionController = new PositionController();
        DateTime myDateTime = DateTime.Today;

        private string _current_user_id = frmLogin.loggedUser.Username; // Lấy username của người dùng hiện tại với type string
        private UserDTO _current_user; // Tạo một người dùng hiện tại cục bộ để show thông tin và chỉnh sửa thông tin vì UserDTO ở form login là static không thể sửa
        private byte[] _imageBytes;
        private bool current_User_Gender;
        private bool selectedImage;

        //public static UserDTO loggedUser;

        public frmUserDetail()
        {
            InitializeComponent();
            TitleBarManager titleBarManager = new TitleBarManager(panel2, pn_Minimize, pn_Maximize, pn_Close);
        }

        private void fUserDetail_Load(object sender, EventArgs e)
        {
            frmInit();
            loadImage();
        }

        private void frmInit()
        {
            //Load department cbx
            List<DepartmentDTO> _departmentDTO = _departmentController.GetDepartmentDTO();
            cb_Department.DataSource = _departmentDTO;
            cb_Department.DisplayMember = "Department_name";
            cb_Department.ValueMember = "Department_id";
            //cb_Department.SelectedIndex = 6;

            //Load team cbx
            string current_department_id = cb_Department.SelectedValue.ToString();
            List<TeamDTO> _teamDTO = _teamController.GetTeamDTO(current_department_id);
            cb_Team.DataSource = _teamDTO;
            cb_Team.DisplayMember = "Team_name";
            cb_Team.ValueMember = "Team_id";

            //Load position cbx
            List<PositionDTO> _positionDTO = _positionController.GetPositionDTO();
            cb_Position.DataSource = _positionDTO;
            cb_Position.DisplayMember = "Position_name";
            cb_Position.ValueMember = "Position_id";
            //cb_Position.SelectedIndex = 2;

            //Id sẽ là biến string rỗng khi được gọi từ form DepartmentDetail để thêm user
            //Nên khi nếu bằng "" thì sẽ bỏ qua load form
            if (_current_user_id != "")
            {
                try
                {
                    _current_user = _userController.GetUserByID(_current_user_id);

                    UserDTO current_user_value = _userController.GetForeignValue(_current_user_id);

                    // Display user detail
                    txt_Fullname.Text = _current_user.Fullname;

                    if (_current_user.Gender == false)
                    {
                        radioButtonMale.Checked = true;
                        radioButtonFemale.Checked = false;
                    }
                    else { radioButtonMale.Checked = false; radioButtonFemale.Checked = true; }

                    if (_current_user.Birth_Date == DateTime.MinValue)
                    {
                        dateTimePickerBirthday.CustomFormat = " ";
                        dateTimePickerBirthday.Format = DateTimePickerFormat.Custom;
                    }
                    else
                    {
                        dateTimePickerBirthday.Value = _current_user.Birth_Date;
                    }

                    if (_current_user.Date_Hired == DateTime.MinValue)
                    {
                        dateTimePickerDateHired.CustomFormat = " ";
                        dateTimePickerDateHired.Format = DateTimePickerFormat.Custom;
                    }
                    else
                    {
                        dateTimePickerDateHired.Value = _current_user.Date_Hired;
                    }

                    // Bình thường sẽ không có chuyện data = null khi sửa user. Chỉ để tránh lỗi và giảm bớt việc sửa thủ công trong database nếu dev có thêm user mới mà data của column là null.
                    if (_current_user.Phone != null) { txt_Phone.Text = _current_user.Phone.ToString(); }
                    else { txt_Phone.Text = ""; }
                    if (_current_user.Email != null) { txt_Email.Text = _current_user.Email.ToString(); }
                    else { txt_Email.Text = ""; }
                    if (_current_user.Tax_Code != null) { txt_Taxcode.Text = _current_user.Tax_Code.ToString(); }
                    else { txt_Taxcode.Text = ""; }
                    if (_current_user.Ethnic != null) { txt_Ethnic.Text = _current_user.Ethnic.ToString(); }
                    else { txt_Ethnic.Text = ""; }
                    if (_current_user.Religion != null) { txt_Religion.Text = _current_user.Religion.ToString(); }
                    else { txt_Religion.Text = ""; }
                    if (_current_user.Address != null) { txt_Address.Text = _current_user.Address.ToString(); }
                    else { txt_Address.Text = ""; }
                    if (_current_user.Citizen_ID != null) { txt_CitizenId.Text = _current_user.Citizen_ID.ToString(); }
                    else { txt_CitizenId.Text = ""; }
                    if (_current_user.Social_Insurance_No != null) { txt_SocialInsuranceNo.Text = _current_user.Social_Insurance_No.ToString(); }
                    else { txt_SocialInsuranceNo.Text = ""; }
                    if (_current_user.Contract_No != null) { txt_ContractNo.Text = _current_user.Contract_No.ToString(); }
                    else { txt_ContractNo.Text = ""; }

                    //if (_current_user.Date_Hired != null) { dateTimePickerDateHired.Value = _current_user.Date_Hired; }
                    //else
                    //{
                    //    dateTimePickerDateHired.CustomFormat = " ";
                    //    dateTimePickerDateHired.Format = DateTimePickerFormat.Custom;

                    //}
                    
                    if (current_user_value != null) 
                    {
                        if (current_user_value.Department_name != null) { cb_Department.Text = current_user_value.Department_name.ToString(); }
                        else { cb_Department.Text = "Chưa có phòng"; }
                        if (current_user_value.Team_name != null) { cb_Team.Text = current_user_value.Team_name.ToString(); }
                        if (current_user_value.Position_name != null) { cb_Position.Text = current_user_value.Position_name.ToString(); }
                        else { cb_Position.Text = "None"; }
                    }
                    else
                    {
                        cb_Department.Text = cb_Team.Text = cb_Position.Text = "None";
                    }
                }
                catch { }
            }
        }

        private Boolean CheckUserName()
        {
            List<UserDTO> usernames = _userController.GetAllUsernames();
            foreach (UserDTO username in usernames){
                if (txtUsername.Text == username.Username)
                {
                    MessageBox.Show("Username đã tồn tại!", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return false;
                }
            }
            return true;    
        }

        //Hàm kích hoạt nút chỉnh sửa khi là admin
        public void DisableUpdatebtn()
        {
            this.btnUpdate.Visible = false; this.btnUpdate.Enabled = false;
        }

        //Hàm set biến username khi gọi từ form khác
        public void SetUsername(string username)
        {
            this._current_user_id = username;
            this.label1.Text += " *";
            this.label2.Text += " *";
            this.label3.Text += " *";
            this.label4.Text += " *";
            this.label5.Text += " *";
            this.label6.Text += " *";
            this.label9.Text += " *";
            this.label14.Text += " *";
            this.label15.Text += " *";
        }

        //Khởi tạo button save sau khi muốn thêm nhân viên mới.
        public void createSaveButton()
        {
            this.enableControl();
            btnCancel.Visible = false;
            btnUpdate.Text = "Xác nhận";
            txtUsername.Visible = true;
            label18.Visible = true;
        }

        //Check all textbox
        private Boolean ElementCheck()
        {
            if (txt_Fullname.Text == string.Empty)
            {
                MessageBox.Show("Vui lòng nhập họ tên", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            if (dateTimePickerBirthday.Text == string.Empty)
            {
                MessageBox.Show("Vui lòng nhập ngày sinh", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            if (txt_Phone.Text == string.Empty)
            {
                MessageBox.Show("Vui lòng nhập số điện thoại", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            if (txt_Email.Text == string.Empty)
            {
                MessageBox.Show("Vui lòng nhập email", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            //if (txt_Taxcode.Text == string.Empty)
            //{
            //    MessageBox.Show("Vui lòng nhập mã số thuế", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            //    return false;
            //}

            if (txt_Ethnic.Text == string.Empty)
            {
                MessageBox.Show("Vui lòng nhập dân tộc", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            if (txt_Religion.Text == string.Empty)
            {
                MessageBox.Show("Vui lòng nhập tôn giáo", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            if (txt_CitizenId.Text == string.Empty)
            {
                MessageBox.Show("Vui lòng nhập CCCD/CMND", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            //if (txt_SocialInsuranceNo.Text == string.Empty)
            //{
            //    MessageBox.Show("Vui lòng nhập số BHXH", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            //    return false;
            //}

            if (txt_Address.Text == string.Empty)
            {
                MessageBox.Show("Vui lòng nhập địa chỉ", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            return true;
        }

        //Chuyển image về byte để lưu ảnh
        private byte[] ImageToByteArray(Image image)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                return ms.ToArray();
            }
        }

        //Chuyển kiểu byte sang kiểu image
        private Image ByteArrayToImage(byte[] byteArray)
        {
            using (MemoryStream ms = new MemoryStream(byteArray))
            {
                Image image = Image.FromStream(ms);
                return image;
            }
        }

        private void loadImage()
        {
            if (_current_user != null)
            {
                try
                {
                    byte[] imageBytes = _current_user.Photo;
                    pictureBox1.Image = ByteArrayToImage(imageBytes);
                }
                catch { }
            }
        }

        public void enableControl()
        {
            // Cá nhân
            radioButtonMale.Enabled = true;
            radioButtonFemale.Enabled = true;
            dateTimePickerBirthday.Enabled = true;
            btnChangePicture.Enabled = true;
            txt_Fullname.ReadOnly = false;
            txt_Phone.ReadOnly = false;
            txt_Email.ReadOnly = false;
            txt_Taxcode.ReadOnly = false;
            txt_Ethnic.ReadOnly = false;
            txt_Religion.ReadOnly = false;
            txt_Address.ReadOnly = false;
            txt_CitizenId.ReadOnly = false;
            txt_SocialInsuranceNo.ReadOnly = false;

            //Công việc
            //Nếu là admin thì mới có quyền chỉnh sửa công việc
            if (frmLogin.loggedUser.Auth_Group_ID == PERMISSION_AUTH_GROUP.ADMIN)
            {
                cb_Department.Enabled = true;
                cb_Team.Enabled = true;
                cb_Position.Enabled = true;
                txt_ContractNo.ReadOnly = false;
                dateTimePickerDateHired.Enabled = true;
            }
            btnCancel.Visible = true;
            btnUpdate.Text = "Lưu";
            //btnUpdate.Size = new Size(104, 39);
        }

        private void disableControl()
        {
            radioButtonMale.Enabled = false;
            radioButtonFemale.Enabled = false;
            dateTimePickerBirthday.Enabled = false;
            dateTimePickerDateHired.Enabled = false;
            cb_Department.Enabled = false;
            cb_Team.Enabled = false;
            cb_Position.Enabled = false;
            btnChangePicture.Enabled = false;

            txt_Fullname.ReadOnly = true;
            txt_Phone.ReadOnly = true;
            txt_Email.ReadOnly = true;
            txt_Taxcode.ReadOnly = true;
            txt_Ethnic.ReadOnly = true;
            txt_Religion.ReadOnly = true;
            txt_Address.ReadOnly = true;
            txt_CitizenId.ReadOnly = true;
            txt_SocialInsuranceNo.ReadOnly = true;
            txt_ContractNo.ReadOnly = true;

            btnCancel.Visible = false;
            btnUpdate.Text = "Cập nhật";
           // btnUpdate.Size = new Size(104, 39);
        }

        //Tự động thay đổi cbteam sau khi thay đổi cbdepartment
        private void cb_Department_SelectedIndexChanged(object sender, EventArgs e)
        {
            cb_Team.Text = "";
            //Load team cbx
            string current_department_id = cb_Department.SelectedValue.ToString();
            List<TeamDTO> _teamDTO = _teamController.GetTeamDTO(current_department_id);
            cb_Team.DataSource = _teamDTO;
            cb_Team.DisplayMember = "Team_name";
            cb_Team.ValueMember = "Team_id";
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            disableControl();
            frmInit();
            loadImage();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {   //Sự kiện cho phép người dùng thao tác chỉnh sửa.
                if (btnUpdate.Text == "Cập nhật")
                {
                    enableControl();
                }

                //Sự kiện thêm mới nhân viên
                else if (btnUpdate.Text == "Xác nhận")
                {
                    UserDTO newUser = new UserDTO();
                    string newId = Guid.NewGuid().ToString();
                    newUser.Username = newId;
                    bool new_User_Gender;
                    if (radioButtonMale.Checked == true && radioButtonFemale.Checked == false)
                    {
                        new_User_Gender = false;
                    }
                    else
                    {
                        new_User_Gender = true;
                    }
                    //Nếu chưa có sự thay đổi về ảnh đại diện, sẽ không update ảnh
                    if (selectedImage)
                    {
                        try
                        {
                            _userController.UpDatePhotoByID(newUser.Username, ImageToByteArray(pictureBox1.Image));
                        }
                        catch (Exception) { }
                    }
                    //Check các giá trị nhập vào, nếu chưa nhập thì vẫn lưu vào data với giá trị là ""
                    if (!ElementCheck()) return;

                    if (!CheckUserName()) return;

                    //try to update data
                    if (cb_Team.SelectedValue == null && newUser.Auth_Group_ID == PERMISSION_AUTH_GROUP.ADMIN)
                    {
                        MessageBox.Show("Phòng bạn chọn hiện tại chưa có team, vui lòng đợi hoặc chọn phòng khác!", "Cảnh báo!", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                        enableControl();
                        btnUpdate.Text = "Xác nhận";
                    }

                    else if (cb_Team.SelectedValue == null && newUser.Auth_Group_ID != PERMISSION_AUTH_GROUP.ADMIN)
                    {
                        MessageBox.Show("Phòng bạn chọn hiện tại chưa có team, vui lòng đợi hoặc chọn phòng khác!", "Cảnh báo!", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                        enableControl();
                        btnUpdate.Text = "Xác nhận";
                    }

                    else
                    {
                        try
                        {
                            //Nếu người dùng chọn ảnh thì chuyển ảnh được chọn sang Bytes và truyền vào thuộc tính Photo
                            if (selectedImage)
                            {
                                newUser.Photo = ImageToByteArray(pictureBox1.Image);
                            }
                            newUser.Username = txtUsername.Text;
                            newUser.Password = StringUtil.Encrytion("Goline@123");
                            newUser.Fullname = txt_Fullname.Text;
                            newUser.Gender = new_User_Gender;
                            newUser.Birth_Date = dateTimePickerBirthday.Value;
                            newUser.Email = txt_Email.Text;
                            newUser.Phone = txt_Phone.Text;
                            newUser.Address = txt_Address.Text;
                            newUser.Ethnic = txt_Ethnic.Text;
                            newUser.Religion = txt_Religion.Text;
                            newUser.Citizen_ID = txt_CitizenId.Text;
                            newUser.Tax_Code = txt_Taxcode.Text;
                            newUser.Social_Insurance_No = txt_SocialInsuranceNo.Text;
                            newUser.Date_Hired = dateTimePickerDateHired.Value;
                            newUser.Contract_No = txt_ContractNo.Text;
                            newUser.Team_id = cb_Team.SelectedValue.ToString();
                            newUser.Position_id = cb_Position.SelectedValue.ToString();
                            _userController.CreateNewUser(newUser);
                            MessageBox.Show("Thêm mới thành công!", "Thông báo!", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            SetUsername("");
                            label18.Visible = false;
                            txtUsername.Visible = false;
                            createSaveButton();
                            this.Close();
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Có lỗi xảy ra! \nHãy thử lại \n" + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }

                }

                //Sự kiện update thông tin nhân viên
                else if (btnUpdate.Text == "Lưu")
                {
                    if (radioButtonMale.Checked == true && radioButtonFemale.Checked == false)
                    {
                        current_User_Gender = false;
                    }
                    else
                    {
                        current_User_Gender = true;
                    }

                    //Nếu chưa có sự thay đổi về ảnh đại diện, sẽ không update ảnh
                    if (selectedImage)
                    {
                        try
                        {
                            _userController.UpDatePhotoByID(_current_user.Username, ImageToByteArray(pictureBox1.Image));
                        }
                        catch (Exception) { }
                    }

                    //Check các giá trị nhập vào, nếu chưa nhập thì vẫn lưu vào data với giá trị là ""
                    if (!ElementCheck()) return;

                    //try to update data
                    if (cb_Team.SelectedValue == null && _current_user.Auth_Group_ID == PERMISSION_AUTH_GROUP.ADMIN)
                    {
                        MessageBox.Show("Phòng bạn chọn hiện tại chưa có team, vui lòng đợi hoặc chọn phòng khác!", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        enableControl();
                        btnUpdate.Text = "Lưu";
                    }
                    else if (cb_Team.SelectedValue == null && _current_user.Auth_Group_ID != PERMISSION_AUTH_GROUP.ADMIN)
                    {
                        MessageBox.Show("Phòng bạn chọn hiện tại chưa có team, vui lòng đợi hoặc chọn phòng khác!", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        enableControl();
                        btnUpdate.Text = "Lưu";
                    }
                    else
                    {
                        UserDTO userDTO = new UserDTO();
                        userDTO.Username = frmLogin.loggedUser.Username;
                        userDTO.Fullname = txt_Fullname.Text;
                        userDTO.Gender = current_User_Gender;
                        userDTO.Birth_Date = dateTimePickerBirthday.Value;
                        userDTO.Email = txt_Email.Text;
                        userDTO.Phone = txt_Phone.Text;
                        userDTO.Address = txt_Address.Text;
                        userDTO.Ethnic = txt_Ethnic.Text;
                        userDTO.Religion = txt_Religion.Text;
                        userDTO.Citizen_ID = txt_CitizenId.Text;
                        userDTO.Tax_Code = txt_Taxcode.Text;
                        userDTO.Social_Insurance_No = txt_SocialInsuranceNo.Text;
                        userDTO.Date_Hired = dateTimePickerDateHired.Value;
                        userDTO.Contract_No = txt_ContractNo.Text;
                        userDTO.Team_id = cb_Team.SelectedValue.ToString();
                        userDTO.Position_id = cb_Position.SelectedValue.ToString();
                        _userController.UpdateUserProfile(userDTO, _current_user_id);
                        MessageBox.Show("Cập nhật thành công!", "Thông tin", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        //Sau khi update thành công thì disable các box,...
                        disableControl();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnChangePicture_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "Image Files(*.BMP;*.JPG;*.PNG)|*.BMP;*.JPG;*.PNG";

                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    selectedImage = true;
                    string fileName = openFileDialog.FileName;

                    // Resize the image to 168 x 207
                    Image image = Image.FromFile(fileName);
                    Image resizedImage = new Bitmap(image, new Size(168, 213));

                    // Convert the resized image to a byte array
                    _imageBytes = ImageToByteArray(resizedImage);
                    pictureBox1.Image = resizedImage;
                }
                else
                {
                    selectedImage = false;
                }
            }
            catch
            {
                MessageBox.Show("Ảnh không hợp lệ. Vui lòng thử lại!", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dateTimePickerDateHired_ValueChanged(object sender, EventArgs e)
        {
            dateTimePickerDateHired.Format = DateTimePickerFormat.Custom;
            dateTimePickerDateHired.CustomFormat = "dd/MM/yyyy";
        }

        private void dateTimePickerBirthday_ValueChanged(object sender, EventArgs e)
        {
            dateTimePickerBirthday.Format = DateTimePickerFormat.Custom;
            dateTimePickerBirthday.CustomFormat = "dd/MM/yyyy";
        }

        private void txtUsername_Leave(object sender, EventArgs e)
        {
            if (!CheckUserName()) return;
        }
    }
}
