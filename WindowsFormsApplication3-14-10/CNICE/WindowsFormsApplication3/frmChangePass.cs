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
    public partial class frmChangePass : Office2007Form
    {
        public frmChangePass()
        {
            InitializeComponent();
        }
        
        private void btnChange_Click(object sender, EventArgs e)
        {
            if (txtUser.Text.Trim().Equals("") ||
                txtPassOld.Text.Trim().Equals("") ||
                txtPassNew.Text.Trim().Equals("") ||
                txtPassNew2.Text.Trim().Equals(""))
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                if (txtPassNew.Text.Trim().Equals(txtPassNew2.Text.Trim()))
                {
                    if (txtPassNew.Text.Trim().Length >= 6 && txtPassNew2.Text.Trim().Length >= 6)
                    {
                        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
                        cls.clsProcess cl = new cls.clsProcess();
                        var check = from x in db.tAccounts
                                    where x.Username == txtUser.Text.Trim()
                                        && x.Password == cl.Encrypt(txtPassOld.Text.Trim())
                                        && x.Status != 0
                                        && x.BranchTypeId == WindowsFormsApplication3.Form1.branch_type_id
                                    select x;
                        if (check.Count() == 1)
                        {
                            check.FirstOrDefault().Password = cl.Encrypt(txtPassNew.Text.Trim());
                            db.SubmitChanges();
                            MessageBox.Show("Thay đổi mật khẩu thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            this.Close();
                        }
                        else
                            MessageBox.Show("Thông tin tài khoản cũ không đúng, kiểm tra lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                    else
                        MessageBox.Show("Nhập mật khẩu từ 6 kí tự trở lên, kiểm tra lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                    MessageBox.Show("Mật khẩu xác nhận không trùng khớp", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmChangePass_Load(object sender, EventArgs e)
        {
            txtUser.Text = WindowsFormsApplication3.Form1.user_acc;
            txtPassOld.Focus();
        }
    }
}
