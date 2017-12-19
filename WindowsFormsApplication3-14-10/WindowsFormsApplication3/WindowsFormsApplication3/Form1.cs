using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DevComponents.DotNetBar;
using System.Net;
using System.Diagnostics;

namespace WindowsFormsApplication3
{
    public partial class Form1 : Office2007RibbonForm
    {
        public Form1()
        {
            InitializeComponent();
        }

        public static bool logined = false;
        public static int group_id = 1;
        public static string group_code = "";
        public static int user_id = 1;
        public static string user_acc = "";
        public static int branch_type_id = 1;
        public static int branch_id = 1;
        public static string branch_name = "[Chưa đăng nhập]";
        public static string group_name = "[Chưa đăng nhập]";
        public static string name = "[Chưa đăng nhập]";

        private void Form1_Load(object sender, EventArgs e)
        {
            lbDatetime.Text = "Giờ hệ thống: " + DateTime.Now;
            lbUser.Text = " | Người dùng: " + name;
            lbRole.Text = " | Chức vụ: " + group_name;
            lbBranch.Text = " | Chi nhánh: " + branch_name;
            string hostName = Dns.GetHostName();
            string myIP = Dns.GetHostEntry(hostName).AddressList[0].ToString();

            lbServer.Text = " | Tên máy : " + Environment.MachineName + " | IP: " + myIP;
            Unlogin(logined);
            ribbonControl1.SelectFirstVisibleRibbonTab();
            var f = new frmLogin();
            f.ShowDialog();
            if (logined)
            {
                lbUser.Text = " | Người dùng: " + name;
                lbRole.Text = " | Chức vụ: " + group_name;
                lbBranch.Text = " | Chi nhánh: " + branch_name;
                Unlogin(logined);
            }
        }
        private void Unlogin(bool logined)
        {
            btnLogin.Enabled = !logined;
            btnChangePass.Enabled = logined;
            btnLogout.Enabled = logined;
            btnMember.Enabled = logined;
            btnProduct.Enabled = logined;
            btnInputStock.Enabled = logined;
            btnOutputStock.Enabled = logined;
            btnOutputStockInternal.Enabled = logined;
            btnReportInput.Enabled = logined;
            btnReportOutput.Enabled = logined;
            btnInputReturn.Enabled = logined;
            btnReportMoney.Enabled = logined;
            btnReportInventory.Enabled = logined;
            btnBarCode.Enabled = logined;
            btnCombo.Enabled = logined;
            btnCheckInventory.Enabled = logined;
            btnHourGold.Enabled = logined;
            btnHelp.Enabled = logined;
            btnUpdateVersion.Enabled = logined;
            btnRevenue.Enabled = logined;

            if (group_code == "" || group_code == "SF")
            {
                btnReportMoney.Enabled = false;
                //btnReportInventory.Enabled = false;
                btnBarCode.Enabled = false;
                btnOutputStockInternal.Enabled = false;
                btnRevenue.Enabled = false;
            }
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            var f = new frmLogin();
            f.ShowDialog();
            if (logined)
            {
                lbUser.Text = " | Người dùng: " + name;
                lbRole.Text = " | Chức vụ: " + group_name;
                lbBranch.Text = " | Chi nhánh: " + branch_name;
                Unlogin(logined);
            }
        }
        
        private void btnMember_Click(object sender, EventArgs e)
        {
            var f = new frmMember();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnProduct_Click(object sender, EventArgs e)
        {
            var f = new frmProduct();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnInputStock_Click(object sender, EventArgs e)
        {
            var f = new frmInputStock();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnOutputStock_Click(object sender, EventArgs e)
        {
            var f = new frmOutputStock();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnOutputStockInternal_Click(object sender, EventArgs e)
        {
            var f = new frmOutputStockInternal();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnChangePass_Click(object sender, EventArgs e)
        {
            var f = new frmChangePass();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn thực sự muốn đăng xuất khỏi chương trình ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                logined = false;
                group_id = 0;
                user_id = 0;
                user_acc = "";
                branch_type_id = 0;
                branch_id = 0;
                branch_name = "[Chưa đăng nhập]";
                group_name = "[Chưa đăng nhập]";
                name = "[Chưa đăng nhập]";

                lbUser.Text = " | Người dùng: " + name;
                lbRole.Text = " | Chức vụ: " + group_name;
                lbBranch.Text = " | Chi nhánh: " + branch_name;
                Unlogin(logined);
            }
        }

        private void applicationButton1_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn thực sự muốn thoát chương trình ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            lbDatetime.Text = "Giờ hệ thống: " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
        }

        private void btnReportInput_Click(object sender, EventArgs e)
        {
            var f = new frmSummaryStockInput();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnReportOutput_Click(object sender, EventArgs e)
        {
            var f = new frmSummaryStockOutput();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnHelp_Click(object sender, EventArgs e)
        {
            Process p = new Process();
            p.StartInfo.FileName = "Tai-lieu.pdf";
            p.Start();
        }

        private void btnCall_Click(object sender, EventArgs e)
        {
            Process p = new Process();
            p.StartInfo.FileName = "Support.exe";
            p.Start();
        }

        private void btnInputReturn_Click(object sender, EventArgs e)
        {
            var f = new frmInputReturn();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnReportMoney_Click(object sender, EventArgs e)
        {
            var f = new frmReportRevenue();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnReportInventory_Click(object sender, EventArgs e)
        {
            var f = new frmReportInventory();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            //this.Dispose();
            //Application.Exit();
        }

        private void btnInputSupplier_Click(object sender, EventArgs e)
        {
            var f = new frmInputSupplier();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnBarCode_Click(object sender, EventArgs e)
        {
            var f = new frmBarCode();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnCombo_Click(object sender, EventArgs e)
        {
            var f = new frmCombo();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnUpdateVersion_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Khi cập nhật phiên bản mới chương trình sẽ bị đóng lại, và tự khởi động lại khi cập nhật xong dữ liệu. Bạn chắc chắn muốn cập nhật ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                frmUpdateVersion f = new frmUpdateVersion();
                f.Show();
            }
        }

        private void btnCheckInventory_Click(object sender, EventArgs e)
        {
            var f = new frmCheckInventory();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnHourGold_Click(object sender, EventArgs e)
        {
            var f = new frmHourGold();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void btnBarCode_Click_1(object sender, EventArgs e)
        {
            var f = new frmBarCode();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }

        private void ckTime_Tick(object sender, EventArgs e)
        {
            //WSC.CMServices s = new WSC.CMServices();
            //var date_server = s.getDateTime();
            //var dtime = DateTime.Parse(date_server);

            //if ((DateTime.Now - dtime).TotalMinutes >= 1)
            //{
            //    if (logined)
            //    {
            //        logined = false;
            //        group_id = 0;
            //        user_id = 0;
            //        user_acc = "";
            //        branch_type_id = 0;
            //        branch_id = 0;
            //        branch_name = "[Chưa đăng nhập]";
            //        group_name = "[Chưa đăng nhập]";
            //        name = "[Chưa đăng nhập]";

            //        lbUser.Text = " | Người dùng: " + name;
            //        lbRole.Text = " | Chức vụ: " + group_name;
            //        lbBranch.Text = " | Chi nhánh: " + branch_name;
            //        Unlogin(logined);

            //        foreach (Form frm in this.MdiChildren)
            //        {
            //            frm.Dispose();
            //            frm.Close();
            //        }

            //        MessageBox.Show("Sai thông tin ngày giờ hệ thống, vui lòng cài đặt lại giờ hệ thống", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            //    }
            //}
        }

        private void btnRevenue_Click(object sender, EventArgs e)
        {
            var f = new frmRevenue();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }
    }
}
