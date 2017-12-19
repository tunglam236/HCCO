using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevComponents.DotNetBar;

namespace UpdateProgram
{
    public partial class frmUpdate : Office2007Form
    {
        //tên thư mục tạm, chúng ta sẽ sử dụng để lưu các tệp tin tạm thời
        private const string TEMP_DIR = "CManager_Temp";
        private bool up = true;
        public frmUpdate()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            timer1.Enabled = true;
            timer1.Start();
            Thread.Sleep(3000);
            CopyFiles();
        }

        private void CopyFiles()
        {
            
            string currentDirectory = Environment.CurrentDirectory;
            string tempDirectory = Path.GetTempPath() + TEMP_DIR;
            string[] fileList = Directory.GetFiles(tempDirectory);
            foreach (string sourceFile in fileList)
            {
                string fileName = Path.GetFileName(sourceFile);
                string destinationFile = currentDirectory + "\\" + fileName;
                File.Copy(sourceFile, destinationFile, true);
            }

            MessageBox.Show("Đã cập nhật xong dữ liệu phiên bản mới", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            Process.Start("CManagerv1.exe");
            Application.Exit();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (progressBarX1.Value <= 0)
                progressBarX1.Value = 0;

            if (progressBarX1.Value == 100) up = false;
            if (progressBarX1.Value == 0) up = true;

            if (progressBarX1.Value <100 && up) progressBarX1.Value += 10;
            else if (progressBarX1.Value > 0 && !up) progressBarX1.Value -= 10;

        }
    }
}
