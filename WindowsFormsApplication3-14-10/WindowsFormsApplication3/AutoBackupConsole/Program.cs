using System;
using System.Runtime.InteropServices;
using System.Configuration;

namespace AutoBackupConsole
{
    class Program
    {
        [DllImport("Kernel32.dll")]
        private static extern IntPtr GetConsoleWindow();
        [DllImport("User32.dll")]
        private static extern bool ShowWindow(IntPtr hwind, int cmdShow);
        private static string SERVER_NAME = ConfigurationManager.AppSettings["server_name"];
        private static string DB_NAME = ConfigurationManager.AppSettings["db_name"];
        private static string DB_PATH = ConfigurationManager.AppSettings["db_path"];
        static void Main(string[] args)
        {
            IntPtr hw = GetConsoleWindow();
            ShowWindow(hw, 0);

            string db_name = DateTime.Now.ToString("ddMMyyyyHHmmss");
            try
            {
                var proc1 = new System.Diagnostics.ProcessStartInfo();
                string anyCommand = "sqlcmd -e -s " + SERVER_NAME + " -q #backup database " + DB_NAME + " to disk = '" + DB_PATH + db_name + ".bak'#";
                proc1.UseShellExecute = true;

                proc1.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
                proc1.WorkingDirectory = @"C:\Windows\System32";
                proc1.FileName = @"C:\Windows\System32\cmd.exe";
                proc1.Verb = "runas";
                proc1.Arguments = "/c " + anyCommand.Replace("#", "\"").Replace("|", "\\"); ;
                proc1.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
                System.Diagnostics.Process.Start(proc1);

                using (System.IO.StreamWriter file = new System.IO.StreamWriter("backup_history.txt", true))
                {
                    file.WriteLine(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + "\t" + db_name + ".bak" + "\t" + "SUCCESS");
                }
                
            }
            catch
            {
                using (System.IO.StreamWriter file = new System.IO.StreamWriter("backup_history.txt", true))
                {
                    file.WriteLine(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + "\t" + db_name + ".bak" + "\t" + "FAILURE");
                }
            }
        }
    }
}
