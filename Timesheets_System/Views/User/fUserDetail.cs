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
using Timesheets_System.Controllers;
using Timesheets_System.Models.DTO;

namespace Timesheets_System.Views.User
{
    public partial class fUserDetail : Form
    {
        UserController _userController = new UserController(); // Biến cục bộ UserController để chạy các function trong DAO
        DepartmentController _departmentController = new DepartmentController();
        TeamController _teamController = new TeamController();
        PositionController _positionController = new PositionController();
        DateTime myDateTime = DateTime.Today;
        UserDTO UserDTO = new UserDTO();

        private string _current_user_id = frmLogin.loggedUser.Username; // Lấy username của người dùng hiện tại với type string
        private UserDTO _current_user; // Tạo một người dùng hiện tại cục bộ để show thông tin
        private byte[] _imageBytes;
        private bool current_User_Gender;
        private bool selectedImage;
        
        //public static UserDTO loggedUser;

        public fUserDetail()
        {
            InitializeComponent();
        }

        public void DisableUpdatebtn()
        {
            this.btnUpdate.Visible = false; this.btnUpdate.Enabled = false;
        }

        public void SetUsername(string username)
        {
            this._current_user_id = username;
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
                dateTimePickerBirthday.Value = myDateTime;
                return true;
            }

            if (txt_Phone.Text == string.Empty)
            {
                txt_Phone.Text = "";
                return true;
            }

            if (txt_Email.Text == string.Empty)
            {
                txt_Email.Text = "";
                return true;
            }

            if (txt_Taxcode.Text == string.Empty)
            {
                txt_Taxcode.Text = "";
                return true;
            }

            if (txt_Ethnic.Text == string.Empty)
            {
                txt_Ethnic.Text = "";
                return true;
            }

            if (txt_Religion.Text == string.Empty)
            {
                txt_Religion.Text = "";
                return true;
            }

            if (txt_CitizenId.Text == string.Empty)
            {
                txt_CitizenId.Text = "";
                return true;
            }

            if (txt_SocialInsuranceNo.Text == string.Empty)
            {
                txt_SocialInsuranceNo.Text = "";
                return true;
            }

            if (txt_Address.Text == string.Empty)
            {
                txt_Address.Text = "";
                return true;
            }

            if (txt_ContractNo.Text == string.Empty)
            {
                txt_ContractNo.Text = "";
                return true;
            }

            if (cb_Department.Text == string.Empty)
            {
                cb_Department.Text = "Chưa có phòng";
                return true;
            }

            if (cb_Team.Text == string.Empty)
            {
                cb_Team.Text = "None";
                return true;
            }

            if (cb_Position.Text == string.Empty)
            {
                cb_Position.Text = "";
                return true;
            }

            return true;
        }

        private byte[] ImageToByteArray(Image image)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                return ms.ToArray();
            }
        }

        private Image ByteArrayToImage(byte[] byteArray)
        {
            using (MemoryStream ms = new MemoryStream(byteArray))
            {
                Image image = Image.FromStream(ms);
                return image;
            }
        }

        private void fUserDetail_Load(object sender, EventArgs e)
        {
            frmInit();
            loadImage();
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

        private void frmInit()
        {   //Id sẽ là biến string rỗng khi được gọi từ form DepartmentDetail
            //Nên khi nếu bằng "" thì sẽ bỏ qua load form
            //Load department cbx
            List<DepartmentDTO> _departmentDTO = _departmentController.GetDepartmentDTO();
            cb_Department.DataSource = _departmentDTO;
            cb_Department.DisplayMember = "Department_name";
            cb_Department.ValueMember = "Department_id";

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
                    if (DateTime.TryParse(_current_user.Birth_Date.ToString(), out myDateTime))
                    {
                        dateTimePickerBirthday.Value = myDateTime;
                    }
                    else
                    {
                        dateTimePickerBirthday.Value = _current_user.Birth_Date;
                    }
                    if (DateTime.TryParse(_current_user.Date_Hired.ToString(), out myDateTime))
                    {
                        dateTimePickerDateHired.Value = myDateTime;
                    }
                    else
                    {
                        dateTimePickerDateHired.Value = _current_user.Date_Hired;
                    }
                    // Bình thường sẽ không có việc data = null khi thêm user. Chỉ để giảm bớt việc sửa thủ công trong database.
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
                    if (current_user_value != null)
                    {
                        if (current_user_value.Department_name != null) { cb_Department.Text = current_user_value.Department_name.ToString(); }
                        else { cb_Department.Text = ""; }
                        if (current_user_value.Team_name != null) { cb_Team.Text = current_user_value.Team_name.ToString(); }
                        else { cb_Team.Text = ""; }
                        if (current_user_value.Position_name != null) { cb_Position.Text = current_user_value.Position_name.ToString(); }
                        else { cb_Position.Text = ""; }
                    }else
                    {
                        cb_Department.Text = "";
                        cb_Team.Text = "";
                        cb_Position.Text = "";
                    }
                }
                catch { }
            }
        }

        private void enableControl()
        {
            // Cá nhân
            radioButtonMale.Enabled = true;
            radioButtonFemale.Enabled = true;
            dateTimePickerBirthday.Enabled = true;
            btnChangePicture.Enabled = true;
            txt_Fullname.Enabled = true;
            txt_Phone.Enabled = true;
            txt_Email.Enabled = true;
            txt_Taxcode.Enabled = true;
            txt_Ethnic.Enabled = true;
            txt_Religion.Enabled = true;
            txt_Address.Enabled = true;
            txt_CitizenId.Enabled = true;
            txt_SocialInsuranceNo.Enabled = true;

            //Công việc
            //Nếu là admin thì mới có quyền chỉnh sửa công việc
            if (frmLogin.loggedUser.Auth_Group_ID == PERMISSION_AUTH_GROUP.ADMIN)
            {
                cb_Department.Enabled = true;
                cb_Team.Enabled = true;
                cb_Position.Enabled = true;
                txt_ContractNo.Enabled = true;
                dateTimePickerDateHired.Enabled = true;
            }
            btnCancel.Visible = true;
            btnUpdate.Text = "LƯU";
            btnUpdate.Size = new Size(104, 39);
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

            txt_Fullname.Enabled = false;
            txt_Phone.Enabled = false;
            txt_Email.Enabled = false;
            txt_Taxcode.Enabled = false;
            txt_Ethnic.Enabled = false;
            txt_Religion.Enabled = false;
            txt_Address.Enabled = false;
            txt_CitizenId.Enabled = false;
            txt_SocialInsuranceNo.Enabled = false;
            txt_ContractNo.Enabled = false;
            btnCancel.Visible = false;
            btnUpdate.Text = "CẬP NHẬT";
            btnUpdate.Size = new Size(104, 39);
        }

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

        //Khởi tạo button save sau khi muốn thêm nhân viên mới.
        public void createSaveButton()
        {
            enableControl();
            btnCancel.Visible = false;
            btnUpdate.Text = "XÁC NHẬN";  
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
                if (btnUpdate.Text == "CẬP NHẬT")
                {
                    enableControl();
                }

                //Sự kiện thêm mới nhân viên
                else if (btnUpdate.Text == "XÁC NHẬN")
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

                    //try to update data
                    if (cb_Team.SelectedValue == null && newUser.Auth_Group_ID == PERMISSION_AUTH_GROUP.ADMIN)
                    {
                        MessageBox.Show("Phòng bạn chọn hiện tại chưa có team, vui lòng đợi hoặc chọn phòng khác!");
                        enableControl();
                        btnUpdate.Text = "XÁC NHẬN";
                    }
                    else
                    {
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
                        MessageBox.Show("Thêm mới thành công!");
                    }
                    this.Close();
                }

                //Sự kiện update thông tin nhân viên
                else if (btnUpdate.Text == "LƯU")
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
                        MessageBox.Show("Phòng bạn chọn hiện tại chưa có team, vui lòng đợi hoặc chọn phòng khác!");
                        enableControl();
                        btnUpdate.Text = "LƯU";
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
                        MessageBox.Show("Cập nhật thành công!");
                    }
                    //Sau khi update thành công thì disable các box,...
                    disableControl();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex.Message);
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
                MessageBox.Show("Khởi động lại chương trình để tiếp tục chỉnh sửa hình nền!");
            }
            
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnMaximize_Click(object sender, EventArgs e)
        {
            if (WindowState == FormWindowState.Normal)
            {
                this.WindowState = FormWindowState.Maximized;
            }
            else
            {
                this.WindowState = FormWindowState.Normal;
            }
        }

        private void btnMinimize_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        //Move form
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private static extern void ReleaseCapture();

        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private static extern void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);

        private void panel4_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void panel6_MouseEnter(object sender, EventArgs e)
        {
            panel6.BackColor = SystemColors.Window;
        }

        private void panel6_MouseLeave(object sender, EventArgs e)
        {
            Color myColor = Color.FromArgb(2, 136, 209);
            panel6.BackColor = myColor;
        }

        private void panel7_MouseEnter(object sender, EventArgs e)
        {
            panel7.BackColor = SystemColors.Window;
        }

        private void panel7_MouseLeave(object sender, EventArgs e)
        {
            Color myColor = Color.FromArgb(2, 136, 209);
            panel7.BackColor = myColor;
        }

        private void panel8_MouseEnter(object sender, EventArgs e)
        {
            panel8.BackColor = SystemColors.Window;
        }

        private void panel8_MouseLeave(object sender, EventArgs e)
        {
            Color myColor = Color.FromArgb(2, 136, 209);
            panel8.BackColor = myColor;
        }
    }
}
