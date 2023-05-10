using MaterialSkin;
using MaterialSkin.Controls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Timesheets_System.Controllers;
using Excel = Microsoft.Office.Interop.Excel;
using Timesheets_System.Models.DTO;
using Timesheets_System.Common.Const;

namespace Timesheets_System.Views
{ 
    public partial class frmTimesheets : Form
    {
        UserController _userController = new UserController();
        TimesheetsController _timesheetsController = new TimesheetsController();
        TimesheetsDetailsController _timesheetsDetailsController = new TimesheetsDetailsController();
        TimesheetsRawDataController _timesheetsRawDataController = new TimesheetsRawDataController();
        public UserDTO curren_user = new UserDTO();
        public frmTimesheets()
        {
            InitializeComponent();
            this.Text = string.Empty;
            this.ControlBox = false;
            this.MaximizedBounds = Screen.FromHandle(this.Handle).WorkingArea;
        }


        private void frmTimesheets_Load(object sender, EventArgs e)
        {
            frmInit();
        }

        private void frmInit()
        {
            curren_user = frmLogin.loggedUser;
            lblAdmin.Text = curren_user.Fullname.ToString();
            UserDTO current_user_value = _userController.GetForeignValue(curren_user.Username);
            lblDepartment.Text = current_user_value.Department_name;
        }

        // Tìm số ngày trong tháng
        private void foundDayInMonth()
        {
            int start = 0; // index of the name column

            int daysInMonth = DateTime.DaysInMonth(dateTimePicker1.Value.Year, dateTimePicker1.Value.Month); // lấy số ngày trong tháng
            for (int i = 0; i < listView1.Columns.Count; i++)
            {
                if (i == start)
                {
                    listView1.Columns[i].Width = 160;
                }
                if (i < daysInMonth + 1 && i > start)
                {
                    listView1.Columns[i].Width = 60;
                }
                else
                {
                    listView1.Columns[i].Width = 0;
                }
            }
            listView1.Columns[32].Width = 100;
            listView1.Columns[33].Width = 100;

        }

        private void btn_UploadData_Click(object sender, EventArgs e)
        {
            //Select data file
            OpenFileDialog openDialog = new OpenFileDialog();
            openDialog.Multiselect = false;
            openDialog.Filter = "Excel Files|*.xlsx;*.xls";
            if (openDialog.ShowDialog() == DialogResult.OK)
            {
                //Check file format
                string dataFile = openDialog.FileName;
                string a = Path.GetExtension(dataFile);
                if (Path.GetExtension(dataFile) != ".xlsx" && Path.GetExtension(dataFile) != ".xls")
                {
                    MessageBox.Show("Vui lòng chọn file có định dạng *.xlsx hoặc *.xls", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // Create a new instance of the Excel Application
                Excel.Application excelApp = new Excel.Application();

                // Hide the Excel Application window from the user
                excelApp.Visible = false;

                // Open the Excel workbook
                Excel.Workbook workbook = excelApp.Workbooks.Open(dataFile);

                try
                {
                    //Open worksheet
                    Excel.Worksheet worksheet = (Excel.Worksheet)workbook.Worksheets[1];
                    Excel.Range usedRange = worksheet.UsedRange;
                    int lastRow = usedRange.Rows.Count;

                    List<TimesheetsRawDataDTO> timesheetRawDataList = new List<TimesheetsRawDataDTO>();

                    //Loop excel file by row
                    for (int index = 1; index <= lastRow; index++)
                    {
                        try
                        {
                            TimesheetsRawDataDTO timesheetRawData = new TimesheetsRawDataDTO();
                            //Get data in column 1 and column 3
                            String fullname = worksheet.Cells[index, 1].Value;
                            DateTime inOutTime = DateTime.Parse(worksheet.Cells[index, 3].Value);

                            //Assign data for timesheets raw data object
                            timesheetRawData.Fullname = fullname.Trim();
                            timesheetRawData.In_Out_Time = inOutTime;

                            //Add timesheets raw data to list
                            timesheetRawDataList.Add(timesheetRawData);

                        }
                        catch { }
                    }

                    //Insert data to database
                    _timesheetsRawDataController.InsertTimesheetsRawData(timesheetRawDataList);

                    // Save and close the Excel file
                    workbook.Close();
                    Marshal.ReleaseComObject(workbook);
                    excelApp.Quit();
                    Marshal.ReleaseComObject(excelApp);
                }
                catch (Exception ex)
                {
                    // Save and close the Excel file
                    workbook.Close();
                    Marshal.ReleaseComObject(workbook);
                    excelApp.Quit();
                    Marshal.ReleaseComObject(excelApp);

                    MessageBox.Show(ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    //Convert raw data(timesheets_raw_data_tb) to details data(timesheets_details_tb)
                    //
                    //   FULLNAME |               INOUTTIME                                                   FULLNAME  |            DATE      |               CHECKIN           |                   CHECKOUT     |   WORKINGHOURS 
                    //Hoàng Văn A |  2022 - 12 - 26 09:45:27               =>                       Hoàng Văn A |   2022 - 12 - 26 |  2022 - 12 - 26 09:45:27  |  2022 - 12 - 26 13:09:03   |               5.4
                    //Hoàng Văn A |  2022 - 12 - 26 11:26:42                                           Hoàng Văn A |   2022 - 12 - 27 |  2022 - 12 - 27 07:43:39  |  2022 - 12 - 27 14:08:01   |               6.4
                    //Hoàng Văn A |  2022 - 12 - 26 12:05:30
                    //Hoàng Văn A |  2022 - 12 - 26 13:09:03
                    //Hoàng Văn A |  2022 - 12 - 27 07:43:39                                 
                    //Hoàng Văn A |  2022 - 12 - 27 08:05:50
                    //Hoàng Văn A |  2022 - 12 - 27 12:19:18
                    //Hoàng Văn A |  2022 - 12 - 27 11:33:50
                    //Hoàng Văn A |  2022 - 12 - 27 14:08:01
                    _timesheetsRawDataController.ConvertRawDataToDetailsData();

                    List<TimesheetsRawDataDTO> rawDataList = new List<TimesheetsRawDataDTO>();
                    rawDataList = _timesheetsRawDataController.GetRawDataList();

                    foreach (TimesheetsRawDataDTO _timesheetsRawDataDTO in rawDataList)
                    {
                        UserDTO _userDTO = _userController.GetUserByFullname(_timesheetsRawDataDTO.Fullname);

                        //Check fullname from raw data exist in user_tb
                        //Exist         => continue
                        //Not exist  => Unnesscessary data
                        if (_userDTO != null)
                        {
                            //Create timesheets object to search
                            TimesheetsDTO _timesheetsDTO = new TimesheetsDTO();
                            _timesheetsDTO.Fullname = _userDTO.Fullname;
                            _timesheetsDTO.Year = _timesheetsRawDataDTO.In_Out_Time.Year;
                            _timesheetsDTO.Month = _timesheetsRawDataDTO.In_Out_Time.Month;

                            if (_timesheetsController.TimesheetsExist(_timesheetsDTO) == false)
                            {
                                _timesheetsDTO.Username = _userDTO.Username;

                                //Insert new row to timekeeping_tb EX: 1, Nguyễn Văn A, 2023, 02
                                _timesheetsController.InsertNewTimesheets(_timesheetsDTO);
                            }

                            TimesheetsDetailsDTO _timesheetsDetailsDTO = new TimesheetsDetailsDTO();
                            _timesheetsDetailsDTO.Fullname = _userDTO.Fullname;
                            _timesheetsDetailsDTO.Date = _timesheetsRawDataDTO.In_Out_Time;
                            _timesheetsDetailsDTO = _timesheetsDetailsController.GetDetailsByFullnameAndDate(_timesheetsRawDataDTO);

                            if (_timesheetsDetailsDTO != null)
                            {
                                _timesheetsController.UpdateTimesheetsByDay(_timesheetsDetailsDTO);
                            }
                        }
                    }

                    //Truncate raw data after filtering and insert to timesheets_details_tb
                    _timesheetsRawDataController.TruncateRawData();

                    //Reload data source for combobox year
                    frmInit();

                    MessageBox.Show("Hoàn tất", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                }
            }
        }

        private void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                
                TimesheetsDTO timesheetsDTO = new TimesheetsDTO();
                timesheetsDTO.Year = dateTimePicker1.Value.Year;
                timesheetsDTO.Month = dateTimePicker1.Value.Month;
                //timesheetsDetailsDTO.month = dateTimePicker1.Value.Month;

                List<TimesheetsDTO> _timesheetsDTO = _timesheetsController.GetTimeSheetsByMonth(timesheetsDTO);
                //Display data in the materialListView
                listView1.Columns.Clear();
                listView1.Items.Clear();
                listView1.FullRowSelect = true;
            
                listView1.Columns.Add("fullname");
                listView1.Columns.Add("d1");
                listView1.Columns.Add("d2");
                listView1.Columns.Add("d3");
                listView1.Columns.Add("d4");
                listView1.Columns.Add("d5");
                listView1.Columns.Add("d6");
                listView1.Columns.Add("d7");
                listView1.Columns.Add("d8");
                listView1.Columns.Add("d9");
                listView1.Columns.Add("d10");
                listView1.Columns.Add("d11");
                listView1.Columns.Add("d12");
                listView1.Columns.Add("d13");
                listView1.Columns.Add("d14");
                listView1.Columns.Add("d15");
                listView1.Columns.Add("d16");
                listView1.Columns.Add("d17");
                listView1.Columns.Add("d18");
                listView1.Columns.Add("d19");
                listView1.Columns.Add("d20");
                listView1.Columns.Add("d21");
                listView1.Columns.Add("d22");
                listView1.Columns.Add("d23");
                listView1.Columns.Add("d24");
                listView1.Columns.Add("d25");
                listView1.Columns.Add("d26");
                listView1.Columns.Add("d27");
                listView1.Columns.Add("d28");
                listView1.Columns.Add("d29");
                listView1.Columns.Add("d30");
                listView1.Columns.Add("d31");
                listView1.Columns.Add("total_working_days");
                listView1.Columns.Add("total_working_hours");

                // customize the appearance of the control
                listView1.UseCompatibleStateImageBehavior = false;
                listView1.View = View.Details;
                               
                listView1.HeaderStyle = ColumnHeaderStyle.Nonclickable;

                // Change the background color of the column headers
                listView1.HeaderStyle = ColumnHeaderStyle.Nonclickable;
                //listView1.HeaderBackColor = Color.FromArgb(55, 71, 79);

                // Set the font and foreground color of the column headers
                listView1.Font = new Font("Segoe UI", 9, FontStyle.Regular);
                //listView1.HeaderFont = new Font("Segoe UI", 9, FontStyle.Bold);
                //listView1.HeaderForeColor = Color.White;

                // Change the background color of the items in the control
                listView1.BackColor = Color.White;
                //listView1.AlternateBackColor = Color.FromArgb(242, 242, 242);

                // Set the font and foreground color of the items in the control
                listView1.ForeColor = Color.Black;
                listView1.Font = new Font("Segoe UI", 9, FontStyle.Regular);

                // Set the alignment of the columns
                listView1.Columns[0].TextAlign = HorizontalAlignment.Center;

                // customize the appearance of the columns
                foundDayInMonth();
                listView1.Columns[0].Width = 160;

                // customize the text of the columns
                listView1.Columns[0].Text = "Họ và tên";

                int days = 1;
                for (int i = 1; i < 32; i++)
                {
                    listView1.Columns[days].Text = days.ToString();
                    days += 1;
                }
                listView1.Columns[32].Text = "Tổng ngày làm";
                listView1.Columns[33].Text = "Tổng giờ làm";

                foreach (TimesheetsDTO items in _timesheetsDTO)
                {
                    var item = new ListViewItem(new[]
                    {
                        items.Fullname,
                        items.D1.ToString(),
                        items.D2.ToString(),
                        items.D3.ToString(),
                        items.D4.ToString(),
                        items.D5.ToString(),
                        items.D6.ToString(),
                        items.D7.ToString(),
                        items.D8.ToString(),
                        items.D9.ToString(),
                        items.D10.ToString(),
                        items.D11.ToString(),
                        items.D12.ToString(),
                        items.D13.ToString(),
                        items.D14.ToString(),
                        items.D15.ToString(),
                        items.D16.ToString(),
                        items.D17.ToString(),
                        items.D18.ToString(),
                        items.D19.ToString(),
                        items.D20.ToString(),
                        items.D21.ToString(),
                        items.D22.ToString(),
                        items.D23.ToString(),
                        items.D24.ToString(),
                        items.D25.ToString(),
                        items.D26.ToString(),
                        items.D27.ToString(),
                        items.D28.ToString(),
                        items.D29.ToString(),
                        items.D30.ToString(),
                        items.D31.ToString(),
                        items.Total_Working_Days.ToString(),
                        items.Total_Working_Hours.ToString()
                    });
                    listView1.Items.Add(item);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex.Message);
            }
        }

        private void listView1_DoubleClick(object sender, EventArgs e)
        {
            if (listView1.SelectedItems.Count > 0)
            {
                ListViewItem selected = listView1.SelectedItems[0];
                string current_user_name = selected.SubItems[0].Text;
                UserDTO selectedUser = new UserDTO();
                selectedUser = _userController.GetUserByFullname(current_user_name);
                string current_user_id = selectedUser.Username.ToString();
                DateTime seletedDateTime = new DateTime();
                seletedDateTime = dateTimePicker1.Value;
                if (string.IsNullOrEmpty(current_user_id))
                {
                    MessageBox.Show("Cannot derect!");
                }
                else
                {
                    frmPersonalTimesheet frmPersonalTimesheet = new frmPersonalTimesheet(current_user_id, seletedDateTime);
                    frmPersonalTimesheet.ShowDialog();
                }
                
                
                //MessageBox.Show("Current user: " + current_user);
                // do something with the selected item
            }
        }
        #region "Custom title"
        //Move form
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private static extern void ReleaseCapture();

        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private static extern void SendMessage(System.IntPtr hWnd, int wMsg, int wParam, int lParam);

        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void panel6_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void panel6_MouseEnter(object sender, EventArgs e)
        {
            panel6.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void panel6_MouseLeave(object sender, EventArgs e)
        {
            panel6.BackColor = COLORS.TITLE_BACKCOLOR;
        }

        private void panel7_Click(object sender, EventArgs e)
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

        private void panel7_MouseEnter(object sender, EventArgs e)
        {
            panel7.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void panel7_MouseLeave(object sender, EventArgs e)
        {
            panel7.BackColor = COLORS.TITLE_BACKCOLOR;
        }

        private void panel8_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void panel8_MouseEnter(object sender, EventArgs e)
        {
            panel8.BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void panel8_MouseLeave(object sender, EventArgs e)
        {
            panel8.BackColor = COLORS.TITLE_BACKCOLOR;
        }


        #endregion
    }
}
