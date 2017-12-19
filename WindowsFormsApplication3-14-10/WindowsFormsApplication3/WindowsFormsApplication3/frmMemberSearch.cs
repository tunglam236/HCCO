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
    public partial class frmMemberSearch : Office2007Form
    {
        public frmMemberSearch()
        {
            InitializeComponent();
        }

        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        private void frmMemberSearch_Load(object sender, EventArgs e)
        {
            btnSearch_Click(sender, e);
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {

            var m = from x in db.tMembers
                    where x.Status == 1 && x.BranchTypeId == WindowsFormsApplication3.Form1.branch_type_id
                    && (x.MemberCode.Contains(txtCode.Text.Trim()) || txtCode.Text.Trim() == "")
                    && (x.MemberName.Contains(txtName.Text.Trim()) || txtName.Text.Trim() == "")
                    && (x.Phone.Contains(txtPhone.Text.Trim()) || txtPhone.Text.Trim() == "")
                    select new { x.Id, x.MemberCode, x.MemberName,x.Birthday,x.Phone,x.Address };
            dgvMemberSearch.DataSource = m;
        }

        private void dgvMemberSearch_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                int id= int.Parse(dgvMemberSearch.Rows[e.RowIndex].Cells["Id"].Value.ToString());
                WindowsFormsApplication3.frmOutputStock.memberId = id;
                WindowsFormsApplication3.frmOutputStock.memberName = dgvMemberSearch.Rows[e.RowIndex].Cells["Phone"].Value.ToString() + " - " + dgvMemberSearch.Rows[e.RowIndex].Cells["Name"].Value.ToString();
                this.Close();
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
