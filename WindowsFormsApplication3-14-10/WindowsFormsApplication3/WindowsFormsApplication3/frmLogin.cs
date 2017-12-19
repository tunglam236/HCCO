using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DevComponents.DotNetBar;
namespace WindowsFormsApplication3
{
    public partial class frmLogin : Office2007Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            txtAccount.Text = "km_quanly01";
            txtPass.Text = "123456";
            txtAccount.Focus();
        }

        private void btnLogined_Click(object sender, EventArgs e)
        {
            if (txtAccount.Text.Trim().Equals("") || txtPass.Text.Trim().Equals(""))
                MessageBox.Show("Nhập đầy đủ thông tin đăng nhập", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                //WSC.CMServices s = new WSC.CMServices();
                //var date_server = s.getDateTime();
                //var dtime = DateTime.Parse(date_server);

                //if ((DateTime.Now - dtime).TotalMinutes >= 1)
                //    MessageBox.Show("Sai thông tin ngày giờ hệ thống, vui lòng cài đặt lại giờ hệ thống", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                //else
                //{
                cls.clsProcess cls = new cls.clsProcess();
                CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
                var l = from x in db.tAccounts
                        from y in db.tGroupUsers
                        from z in db.tBranches
                        where x.GroupUserId == y.Id && x.BranchId == z.Id && x.Status != 0 && x.Status!=2 && x.Username == txtAccount.Text.Trim()
                            && x.Password == cls.Encrypt(txtPass.Text.Trim())
                        select new { x.Id, x.Username, x.FullName, x.GroupUserId, y.GroupCode, y.GroupName, x.BranchId, x.BranchTypeId, z.BranchName };
                if (l.Count() > 0)
                {
                    WindowsFormsApplication3.Form1.logined = true;
                    WindowsFormsApplication3.Form1.user_acc = l.FirstOrDefault().Username;
                    WindowsFormsApplication3.Form1.group_id = l.FirstOrDefault().GroupUserId;
                    WindowsFormsApplication3.Form1.group_code = l.FirstOrDefault().GroupCode;
                    WindowsFormsApplication3.Form1.name = l.FirstOrDefault().FullName;
                    WindowsFormsApplication3.Form1.group_name = l.FirstOrDefault().GroupName;
                    WindowsFormsApplication3.Form1.user_id = l.FirstOrDefault().Id;
                    WindowsFormsApplication3.Form1.branch_type_id = l.FirstOrDefault().BranchTypeId;
                    WindowsFormsApplication3.Form1.branch_id = l.FirstOrDefault().BranchId.Value;
                    WindowsFormsApplication3.Form1.branch_name = l.FirstOrDefault().BranchName;
                    checkStockOutputInternal();
                    this.Close();
                }
                else
                    MessageBox.Show("Thông tin đăng nhập không chính xác, vui lòng thử lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                //}
            }
        }
        private void checkStockOutputInternal()
        {
            
            CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
            var c = from x in db.tStockOutputs
                    from y in db.tBranches
                    where x.BranchToId == y.Id && x.Status == 2 && x.BranchToId == WindowsFormsApplication3.Form1.branch_id
                    select new { y.BranchName, x.StockCode };
            if (c.Count() > 0)
                MessageBox.Show("Có phiếu xuất điều chuyển từ chi nhánh " + c.FirstOrDefault().BranchName + " tới, số phiếu [" + c.FirstOrDefault().StockCode + "], hãy nhập điều chuyển", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);

        }
        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
