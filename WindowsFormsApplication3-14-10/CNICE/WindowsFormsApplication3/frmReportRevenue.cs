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
    public partial class frmReportRevenue : Office2007Form
    {
        public frmReportRevenue()
        {
            InitializeComponent();
        }
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        cls.clsProcess cl = new cls.clsProcess();
        private void frmReportRevenue_Load(object sender, EventArgs e)
        {
            txtFromDate.Text = DateTime.Now.ToString("MM/dd/yyyy");
            txtToDate.Text = DateTime.Now.ToString("MM/dd/yyyy");

            Dictionary<string, string> type = new Dictionary<string, string>();
            type.Add("0", "Tất cả");
            type.Add("1", "Tiền mặt");
            type.Add("2", "Qua ngân hàng");
            type.Add("3", "Cà thẻ");
            type.Add("4", "Ship COD");
            cbPaymentType.DataSource = new BindingSource(type, null);
            cbPaymentType.DisplayMember = "Value";
            cbPaymentType.ValueMember = "Key";
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtFromDate.Text.Trim().Equals("") || txtToDate.Text.Trim().Equals(""))
                MessageBox.Show("Nhập khoảng thời gian cần xem", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                var r= db.sp_ReportRevenue(WindowsFormsApplication3.Form1.branch_type_id, WindowsFormsApplication3.Form1.branch_id,
                    DateTime.Parse(cl.returnDatetime(txtFromDate.Text.Trim())), 
                    DateTime.Parse(cl.returnDatetime(txtToDate.Text.Trim())), int.Parse(cbPaymentType.SelectedValue.ToString()));
                dgvGrid.DataSource = r;

                if (dgvGrid.Rows.Count == 0)
                {
                    lbCount.Text = "0";
                    lbRevenue.Text = "0";
                    MessageBox.Show("Không tìm thấy dữ liệu nào phù hợp", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    double re= 0; int bill=0;
                    string code = "";
                    foreach (DataGridViewRow rw in dgvGrid.Rows)
                    {
                        
                        var c = rw.Cells["StockCode"].Value.ToString().Replace(",", "");
                        if (code != c)
                        {
                            bill++;
                            code = c;
                        }
                        re += Convert.ToDouble(rw.Cells["TotalPrice"].Value.ToString().Replace(",",""));
                    }
                    lbCount.Text = bill > 999 ? string.Format("{0:0,0}", bill) : bill.ToString();
                    lbRevenue.Text = re > 999 ? string.Format("{0:0,0}", re) : re.ToString();
                }
            }
        }

    }
}
