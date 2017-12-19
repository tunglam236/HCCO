using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AutoBackup
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            backup();
        }
        void backup()
        {
            string db_name = DateTime.Now.ToString("ddMMyyyyHHmmss");
            try
            {
                var proc1 = new System.Diagnostics.ProcessStartInfo();
                string anyCommand = "sqlcmd -e -s DESKTOP-77GHKPT -q #backup database cmshcc to disk = 'E:|backup|" + db_name + ".bak'#";
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
            Application.Exit();
        }
    }
}
