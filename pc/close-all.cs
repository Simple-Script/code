# CloseAllApplications

using System;
using System.Diagnostics;
using System.Linq;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace CloseAllApps
{
    class Program
    {
        [DllImport("user32.dll")]
        static extern IntPtr GetForegroundWindow();

        [DllImport("user32.dll")]
        static extern bool SetForegroundWindow(IntPtr hWnd);

        static void Main()
        {
            Application.Run(new CloseAllAppsForm());
        }
    }

    public class CloseAllAppsForm : Form
    {
        public CloseAllAppsForm()
        {
            this.KeyDown += new KeyEventHandler(OnKeyDown);
            this.FormBorderStyle = FormBorderStyle.None;
            this.WindowState = FormWindowState.Minimized;
            this.ShowInTaskbar = false;
        }

        private void OnKeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F5)
            {
                CloseAllApplications();
            }
        }

        private void CloseAllApplications()
        {
            var processes = Process.GetProcesses().Where(p => p.Id != Process.GetCurrentProcess().Id);
            foreach (var process in processes)
            {
                try
                {
                    process.Kill();
                }
                catch
                {
                    // Handle exceptions if needed
                }
            }
        }
    }
}
