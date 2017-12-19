using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Text;
using System.Windows.Forms;
using DevComponents.DotNetBar;
using System.IO;
using System.Configuration;

namespace WindowsFormsApplication3
{
    public partial class frmCheckUpdate : Office2007Form
    {
        public frmCheckUpdate()
        {
            InitializeComponent();
        }
        private string HOST_ADDRESS = ConfigurationManager.AppSettings["host_address"];
        private const string UPDATE_FILE_VERSION = "version.txt";
        private const string UPDATE_FILE_VERSION_LOCAL = "version_local.txt";
        private const string TEMP_DIR = "CManager_Temp";
        private void frmCheckUpdate_Load(object sender, EventArgs e)
        {
            CheckForUpdate();
        }
        private void CheckForUpdate()
        {
            int ver_new = 0, ver_old = 0;
            try
            {
                string remotePath = HOST_ADDRESS + "/" + UPDATE_FILE_VERSION;
                string version_new = System.IO.Path.GetTempPath() + TEMP_DIR + "\\" + UPDATE_FILE_VERSION;

                if (File.Exists(version_new))
                    File.Delete(version_new);

                CreateTempDirectory();
                DownloadFile(remotePath, version_new);

                
                var fileContent = System.IO.File.ReadAllLines(version_new);
                ver_new = int.Parse(fileContent[0]);//lay version moi nhat tu server

                fileContent = System.IO.File.ReadAllLines(UPDATE_FILE_VERSION_LOCAL);
                ver_old = int.Parse(fileContent[0]);//lay version hien tai may tram

                if (ver_new > ver_old)//neu co version moi
                {
                    if (MessageBox.Show("Đã có phiên bản cập nhật mới, bạn có muốn cập nhật ngay bây giờ hay không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        frmUpdateVersion f = new frmUpdateVersion();
                        f.Show();
                    }
                    else this.Close();
                }
            }
            catch
            {
                
                this.Close();
            }
        }


        private void DownloadFile(string remotePath, string localPath)
        {
            try
            {
                WebClient client = new WebClient();
                client.DownloadFile(remotePath, localPath);
            }
            catch(Exception ax)
            {
                MessageBox.Show(ax.Message + ":" + localPath + ":" + remotePath, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
        private void CreateTempDirectory()
        {
            string tempPath = System.IO.Path.GetTempPath() + TEMP_DIR;
            if (!System.IO.Directory.Exists(tempPath))
            {
                System.IO.Directory.CreateDirectory(tempPath);
            }
        }
    }
}
