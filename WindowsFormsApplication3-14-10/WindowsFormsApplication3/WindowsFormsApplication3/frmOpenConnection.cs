using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DevComponents.DotNetBar;
using System.Runtime.InteropServices;

namespace WindowsFormsApplication3
{
    public partial class frmOpenConnection : Office2007Form
    {
        public frmOpenConnection()
        {
            InitializeComponent();
        }

        public static string connection = "";
        private void frmOpenConnection_Load(object sender, EventArgs e)
        {
            try
            {
                if (InternetConnection.IsConnectedToInternet())
                {
                    WSC.CMServices s = new WSC.CMServices();
                    var con = s.getConnection();
                    cls.clsProcess cls = new WindowsFormsApplication3.cls.clsProcess();
                    connection = cls.Decrypt(con);
                    //connection = @"Data Source=.;Initial Catalog=CMS0;Persist Security Info=True;User ID=it_hcc;Password=123";
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Chưa có kết nối mạng, hãy kiểm tra lại kết nối", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    this.Close();
                    Application.Exit();
                }
            }
            catch (Exception ax)
            {
                MessageBox.Show("Lỗi thông tin kết nối, hãy thử lại: " + ax.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                Application.Exit();
            }
        }
        class InternetConnection
        {
            [DllImport("wininet.dll")]
            private extern static bool InternetGetConnectedState(out int description, int reservedValuine);
            public static bool IsConnectedToInternet()
            {
                int desc;
                return InternetGetConnectedState(out desc, 0);
            }
        }
    }
}
