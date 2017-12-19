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
    public partial class frmMember : Office2007Form
    {
        public frmMember()
        {
            InitializeComponent();
        }

        private int id_current = 0;
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        private void frmMember_Load(object sender, EventArgs e)
        {
            resetControl();
            txtName.Focus();
        }
        private void resetControl()
        {
            btnSave.Enabled = true;
            btnUpdate.Enabled = false;
            foreach (Control ctr in grTTK.Controls)
            {
                if (ctr is TextBox)
                {
                    ctr.Text = "";
                }
            }
            txtBirthday.Text = "";
            txtName.Focus();
            dgvMember.DataSource = from x in db.tMembers
                                   where x.Status != 0
                                       && x.BranchTypeId == WindowsFormsApplication3.Form1.branch_type_id
                                   orderby x.CreateAt descending
                                   select new { x.Id, x.MemberCode, x.MemberName, Sex = x.Sex.Value ? "Nam" : "Nữ", x.Phone, x.Birthday, x.Address,x.Email, x.Note };
            
            Dictionary<string, string> sex = new Dictionary<string, string>();
            sex.Add("1", "Nam");
            sex.Add("0", "Nữ");

            cboSex.DataSource = new BindingSource(sex, null);
            cboSex.DisplayMember = "Value";
            cboSex.ValueMember = "Key";
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            resetControl();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            cls.Member c = new cls.Member();
            string mess = "";
            if (txtName.Text.Trim().Equals("") || txtPhone.Text.Trim().Equals(""))
                MessageBox.Show("Nhập tên khách hàng và số điện thoại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                var ok = c.insertMember(txtName.Text.Trim(), txtBirthday.Text.Trim(), cboSex.SelectedValue.ToString(), txtPhone.Text.Trim(),
                    txtAddress.Text.Trim(),txtEmail.Text.Trim(), txtNote.Text.Trim(), WindowsFormsApplication3.Form1.branch_type_id, out mess);
                if (ok)
                {
                    string name = txtName.Text.Trim();
                    resetControl();
                    MessageBox.Show("Đã thêm khách hàng [" + name + "]", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    
                }
                else
                    MessageBox.Show("Chưa thêm được khách hàng [" + txtName.Text.Trim() + "]. " + mess, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn chắc chắn muốn sửa không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                if (txtName.Text.Trim().Equals("") || txtPhone.Text.Trim().Equals(""))
                    MessageBox.Show("Nhập tên khách hàng và số điện thoại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                else
                {
                    var id = id_current.ToString();
                    cls.Member c = new cls.Member();
                    string mess = "";
                    var ok = c.updateMember(id, txtName.Text.Trim(), txtBirthday.Text.Trim(), cboSex.SelectedValue.ToString(), txtPhone.Text.Trim(),
                    txtAddress.Text.Trim(),txtEmail.Text.Trim(), txtNote.Text.Trim(), WindowsFormsApplication3.Form1.branch_type_id, out mess);
                    if (ok)
                    {
                        string name = txtName.Text.Trim();
                        resetControl();
                        MessageBox.Show("Đã cập nhật khách hàng [" + name + "]", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        
                    }
                    else
                        MessageBox.Show("Chưa cập nhật được khách hàng [" + txtName.Text.Trim() + "]. " + mess, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dgvMember_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            #region Cell_Click
            try
            {
                if (dgvMember.Rows.Count != -1 && e.RowIndex != -1)
                {
                    btnUpdate.Enabled = true;
                    btnSave.Enabled = false;

                    var id = dgvMember[0, e.RowIndex].Value.ToString();
                    id_current = int.Parse(id);
                    var d = from x in db.tMembers where x.Id == int.Parse(id) select x;
                    if (d.Count() > 0)
                    {
                        txtName.Text = d.FirstOrDefault().MemberName;
                        txtAddress.Text = d.FirstOrDefault().Address;
                        txtNote.Text = d.FirstOrDefault().Note;
                        txtEmail.Text = d.FirstOrDefault().Email;
                        txtPhone.Text = d.FirstOrDefault().Phone;
                        if (d.FirstOrDefault().Birthday != null)
                            txtBirthday.Text = d.FirstOrDefault().Birthday.Value.ToString("MM/dd/yyyy");
                        else txtBirthday.Text = "";
                    }
                    else
                        MessageBox.Show("Không tìm thấy thông tin, hãy thử lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            catch (Exception a)
            {
                MessageBox.Show(a.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            #endregion
        }

        private void txtPhone_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && (!char.IsControl(e.KeyChar)))
            {
                e.Handled = true;
            }
        }
    }
}
