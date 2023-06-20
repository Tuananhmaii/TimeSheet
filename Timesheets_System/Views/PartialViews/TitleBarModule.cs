using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;
using Timesheets_System.Common.Const;

namespace Timesheets_System.Views
{
    public class TitleBarManager
    {
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private static extern void ReleaseCapture();

        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private static extern void SendMessage(IntPtr hWnd, int wMsg, int wParam, int lParam);

        private Control titleBarControl;
        private Control minimizeButton;
        private Control maximizeButton;
        private Control closeButton;

        public TitleBarManager(Control titleBarControl, Control minimizeButton, Control maximizeButton, Control closeButton)
        {
            this.titleBarControl = titleBarControl;
            this.minimizeButton = minimizeButton;
            this.maximizeButton = maximizeButton;
            this.closeButton = closeButton;

            InitializeEventHandlers();
        }

        private void InitializeEventHandlers()
        {
            if ( titleBarControl != null)
            {
                titleBarControl.MouseDown += TitleBarControl_MouseDown;
                minimizeButton.Click += MinimizeButton_Click;
                maximizeButton.Click += MaximizeButton_Click;
                closeButton.Click += CloseButton_Click;

                minimizeButton.MouseEnter += Button_MouseEnter;
                maximizeButton.MouseEnter += Button_MouseEnter;
                closeButton.MouseEnter += Button_MouseEnter;

                minimizeButton.MouseLeave += Button_MouseLeave;
                maximizeButton.MouseLeave += Button_MouseLeave;
                closeButton.MouseLeave += Button_MouseLeave;
            }
        }

        private void TitleBarControl_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                ReleaseCapture();
                SendMessage(((Control)sender).FindForm().Handle, 0x112, 0xf012, 0);
            }
        }

        private void MinimizeButton_Click(object sender, EventArgs e)
        {
            Form form = minimizeButton.FindForm();
            if (form != null)
            {
                form.WindowState = FormWindowState.Minimized;
            }
        }

        private void MaximizeButton_Click(object sender, EventArgs e)
        {
            Form form = maximizeButton.FindForm();
            if (form != null)
            {
                if (form.WindowState == FormWindowState.Normal)
                {
                    form.WindowState = FormWindowState.Maximized;
                }
                else
                {
                    form.WindowState = FormWindowState.Normal;
                }
            }
        }

        private void CloseButton_Click(object sender, EventArgs e)
        {
            Form form = closeButton.FindForm();
            form?.Close();
        }

        private void Button_MouseEnter(object sender, EventArgs e)
        {
            ((Control)sender).BackColor = COLORS.TITLE_ENTERCOLOR;
        }

        private void Button_MouseLeave(object sender, EventArgs e)
        {
            ((Control)sender).BackColor = COLORS.TITLE_BACKCOLOR;
        }
    }
}
