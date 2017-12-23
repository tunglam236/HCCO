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
    public partial class frmTemphu : Office2007Form
    {
        public frmTemphu()
        {
            InitializeComponent();
        }

        private void frmTemphu_Load(object sender, EventArgs e)
        {
            txtCode.Focus();
            txtCount.Text = "1";
            txtCount.MinValue = 1;
        }

        private void btnCreateBarCode_Click(object sender, EventArgs e)
        {
            report.rptCodeTemphu cry = new report.rptCodeTemphu();
            DataTable dt = new DataTable();
            dt.Columns.Add("Content", typeof(string));

            CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
            if (txtCount.Text.Trim().Equals(""))
                MessageBox.Show("Nhập số lượng mã cần tạo", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                if (ckAll.Checked)
                {
                    var s = db.sp_getTemphuCnice(WindowsFormsApplication3.Form1.branch_type_id.ToString(),"");
                    int i = 0;
                    foreach (var item in s.ToList())
                    {
                        for (int k = 0; k < int.Parse(txtCount.Text.Trim()); k++)
                        {
                            DataRow dr = dt.NewRow();
                            dr[0] = item.Temp;
                            dt.Rows.Add(dr);
                            i++;
                        }
                    }
                    if (i == 0)
                        MessageBox.Show("Không tìm thấy mã vạch nào. Hãy kiểm tra lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    if (txtCode.Text.Trim().Equals("") || txtCount.Text.Trim().Equals(""))
                        MessageBox.Show("Nhập mã vạch và số lượng mã cần tạo", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    else
                    {
                        var spli = txtCode.Text.Trim().Split(',');
                        int i = 0;
                        for (int cp = 0; cp < spli.Length; cp++)
                        {
                            var s = db.sp_getTemphuCnice(WindowsFormsApplication3.Form1.branch_type_id.ToString(), spli[cp].Trim());

                            foreach (var item in s.ToList())
                            {
                                for (int k = 0; k < int.Parse(txtCount.Text.Trim()); k++)
                                {
                                    DataRow dr = dt.NewRow();
                                    dr[0] = item.Temp;
                                    dt.Rows.Add(dr);
                                    i++;
                                }
                            }
                        }
                        if (i == 0)
                            MessageBox.Show("Không tìm thấy mã vạch " + txtCode.Text.Trim() + ". Hãy kiểm tra lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }

                cry.SetDataSource(dt);
                crystalReportViewer1.ReportSource = cry;
                crystalReportViewer1.Refresh();
            }
        }

        private void btnPrint_Click(object sender, EventArgs e)
        {
            crystalReportViewer1.PrintReport();
        }
    }
}
