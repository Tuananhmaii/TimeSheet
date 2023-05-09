using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;
using System.Windows.Forms;

namespace Timesheets_System.Common.Util
{
    public class StringUtil
    {
        public static string Encrytion(string inputStr)
        {
            string result = "";

            //Create SHA256 object
            SHA256 sha256 = SHA256Managed.Create();
            //Convert input string to byte array
            byte[] inputStr_inBytes = Encoding.ASCII.GetBytes(inputStr);
            //SHA256 encryption
            inputStr_inBytes = sha256.ComputeHash(inputStr_inBytes);

            //Create MD5 object
            MD5 md5 = MD5.Create();
            //MD5 encryption
            inputStr_inBytes = md5.ComputeHash(inputStr_inBytes);

            //Convert byte array to string
            foreach (byte b in inputStr_inBytes)
            {
                result += b.ToString("x2");
            }

            return result;
        }

    }
}
