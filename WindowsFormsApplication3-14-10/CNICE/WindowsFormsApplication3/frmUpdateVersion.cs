using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DevComponents.DotNetBar;
using System.IO;
using System.Diagnostics;
using System.Configuration;
using System.Net;

namespace WindowsFormsApplication3
{
    public partial class frmUpdateVersion : Office2007Form
    {
        private string HOST_ADDRESS = ConfigurationManager.AppSettings["host_address"];
        private const string UPDATE_FILE_NAME = "update_list.txt";
        private const string UPDATE_FILE_VERSION = "version.txt";
        private const string UPDATE_FILE_VERSION_LOCAL = "version_local.txt";
        private const string TEMP_DIR = "CManager_Temp";

        public frmUpdateVersion()
        {
            InitializeComponent();
        }

        private void frmUpdateVersion_Load(object sender, EventArgs e)
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
                    //copy file version moi ve may tram
                    File.Copy(version_new, Environment.CurrentDirectory + "\\" + UPDATE_FILE_VERSION_LOCAL, true);

                    //down file danh sach file can cap nhat ve thu muc temp cua windows
                    remotePath = HOST_ADDRESS + "/" + UPDATE_FILE_NAME;
                    var localPath = System.IO.Path.GetTempPath() + TEMP_DIR + "\\" + UPDATE_FILE_NAME;
                    CreateTempDirectory();
                    DownloadFile(remotePath, localPath);
                    AnalyzeFile(localPath);
                }
                else
                {
                    MessageBox.Show("Không có phiên bản mới nào", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.Close();
                }
            }
            catch(Exception ax)
            {
                //neu co loi ghi lai version cu de cap nhat lai
                using (StreamWriter sw = new StreamWriter(Environment.CurrentDirectory + "\\" + UPDATE_FILE_VERSION_LOCAL))
                {
                    sw.Write(ver_old);
                }
                MessageBox.Show("Có lỗi phát sinh khi cập nhật phiên bản mới,hãy thử cập nhật lại. Lỗi chi tiết: " + ax.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.Close();
            }
        }

        private void AnalyzeFile(string filePath)
        {
            List<String> FileList = new List<string>();

            string fileContent = System.IO.File.ReadAllText(filePath);
            string[] lines = fileContent.Split(new[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);
            foreach (string line in lines)
            {
                //add tung file vao danh sach can download
                FileList.Add(line);
            }
            if (FileList.Count > 0)
            {
                //download tung file
                DownloadFiles(FileList);
            }
            else
            {
                MessageBox.Show("Không có file nào cần cập nhật", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                this.Close();
            }
        }

        private void DownloadFiles(List<string> fileList)
        {
            System.IO.Directory.Delete(System.IO.Path.GetTempPath() + TEMP_DIR, true);
            CreateTempDirectory();
            foreach (string fileName in fileList)
            {
                string localPath = System.IO.Path.GetTempPath() + TEMP_DIR + "\\" + fileName;
                string remotePath = HOST_ADDRESS + "/" + fileName;
                DownloadFile(remotePath, localPath);
            }
            Process p = new Process();
            p.StartInfo.FileName = "UpdateProgram.exe";
            p.StartInfo.Verb = "runas";
            p.Start();
            Application.Exit();
        }

        private void DownloadFile(string remotePath, string localPath)
        {
            try
            {
                WebClient client = new WebClient();
                client.DownloadFile(remotePath, localPath);
            }
            catch (Exception ax)
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
