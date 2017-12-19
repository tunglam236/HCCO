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
   
    public partial class frmRevenue : Office2007Form
    {
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        cls.clsProcess cl = new cls.clsProcess();
        public frmRevenue()
        {
            InitializeComponent();
        }

        private void frmRevenue_Load(object sender, EventArgs e)
        {
            dtFromDate.Text= DateTime.Now.ToString("MM/dd/yyyy");
            dtToDate.Text = DateTime.Now.ToString("MM/dd/yyyy");

            cbPersonnal.DataSource = from x in db.tAccounts
                                     from y in db.tGroupUsers
                                     where x.GroupUserId == y.Id && x.BranchTypeId == WindowsFormsApplication3.Form1.branch_type_id
                                     && x.BranchId == WindowsFormsApplication3.Form1.branch_id && (x.Status == 1|| x.Status==3)
                                     && (y.GroupCode == "SF" || y.GroupCode == "LB")
                                     select new { x.Id, Name = x.Username + " - " + x.FullName };
            cbPersonnal.SelectedItem = null;
        }

        private void btnView_Click(object sender, EventArgs e)
        {
            string acc = "";
            if (cbPersonnal.SelectedItem != null)
                acc = cbPersonnal.SelectedValue.ToString();
            dgvRevenue.DataSource = db.sp_loadRevenueByPersonnel(WindowsFormsApplication3.Form1.branch_type_id,
                acc, DateTime.Parse(cl.returnDatetime(dtFromDate.Text.Trim())), 
                DateTime.Parse(cl.returnDatetime(dtToDate.Text.Trim())));
            if(dgvRevenue.Rows.Count==0)
                MessageBox.Show("Không có dữ liệu nào", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }
    }
}
