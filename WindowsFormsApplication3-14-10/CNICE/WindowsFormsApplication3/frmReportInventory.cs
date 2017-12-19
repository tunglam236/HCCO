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
    public partial class frmReportInventory : Office2007Form
    {
        public frmReportInventory()
        {
            InitializeComponent();
        }

        cls.clsProcess cl = new cls.clsProcess();
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        private void frmReportInventory_Load(object sender, EventArgs e)
        {
            txtFromDate.Text = DateTime.Now.ToString("MM/dd/yyyy");
            txtToDate.Text = DateTime.Now.ToString("MM/dd/yyyy");
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtFromDate.Text.Trim().Equals(""))
                MessageBox.Show("Nhập ngày bắt đầu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                dgvGrid.DataSource = db.sp_ReportInventoryCNice(WindowsFormsApplication3.Form1.branch_type_id, WindowsFormsApplication3.Form1.branch_id,
                    DateTime.Parse(cl.returnDatetime(txtFromDate.Text.Trim())), DateTime.Parse(cl.returnDatetime(txtToDate.Text.Trim())));

                if (dgvGrid.Rows.Count == 0)
                {
                    MessageBox.Show("Không tìm thấy dữ liệu nào phù hợp", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                int tondau = 0, tongnhap = 0, tongxuat = 0, tongton = 0;

                for (int k = 0; k < dgvGrid.Rows.Count; k++)
                {
                    tondau += int.Parse(dgvGrid.Rows[k].Cells["TonTruoc"].Value.ToString());
                    tongnhap += int.Parse(dgvGrid.Rows[k].Cells["TongNhap"].Value.ToString());
                    tongxuat += int.Parse(dgvGrid.Rows[k].Cells["TongXuat"].Value.ToString());
                    tongton += int.Parse(dgvGrid.Rows[k].Cells["TongTon"].Value.ToString());
                }
                lbTonDau.Text = tondau == 0 ? "0" : string.Format("{0:0,0}", tondau);
                lbTongNhap.Text = tongnhap == 0 ? "0" : string.Format("{0:0,0}", tongnhap);
                lbTongXuat.Text = tongxuat == 0 ? "0" : string.Format("{0:0,0}", tongxuat);
                lbTongTon.Text = tongton == 0 ? "0" : string.Format("{0:0,0}", tongton);
            }
        }

    }
}
