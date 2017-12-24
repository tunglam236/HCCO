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
    public partial class frmBarCode : Office2007Form
    {
        public frmBarCode()
        {
            InitializeComponent();
        }
        public static string codeId = "";
        private void frmBarCode_Load(object sender, EventArgs e)
        {
            txtCode.Focus();
            txtCount.Text = "1";
            txtCount.MinValue = 1;
            if (codeId != "")
                txtCode.Text = codeId;
        }
        private void btnCreateBarCode_Click(object sender, EventArgs e)
        {
            report.rptBarCode cry = new report.rptBarCode();
            DataTable dt = new DataTable();
            dt.Columns.Add("Id", typeof(string));
            dt.Columns.Add("Code", typeof(string));
            dt.Columns.Add("ProductCode", typeof(string));
            dt.Columns.Add("ProductName", typeof(string));
            dt.Columns.Add("Brand", typeof(string));
            dt.Columns.Add("Country", typeof(string));

            CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
            if (txtCount.Text.Trim().Equals(""))
                MessageBox.Show("Nhập số lượng mã cần tạo", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                if (ckAll.Checked)
                {
                    var s = db.sp_getBarCodeCnice(WindowsFormsApplication3.Form1.branch_type_id.ToString(), "");
                    int i = 0;
                    foreach (var item in s.ToList())
                    {
                        for (int k = 0; k < int.Parse(txtCount.Text.Trim()); k++)
                        {
                            DataRow dr = dt.NewRow();
                            dr[0] = item.CodeId;
                            dr[1] = item.Code;
                            dr[2] = item.ProductCode;
                            dr[3] = item.ProductName;
                            dr[4] = item.Brand;
                            dr[5] = item.Country;
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
                            var tep = spli[cp].Trim().Split('-');
                            var s = db.sp_getBarCodeCnice(WindowsFormsApplication3.Form1.branch_type_id.ToString(), tep[0].Trim());
                            
                            foreach (var item in s.ToList())
                            {
                                for (int k = 0; k < int.Parse(tep[1].Trim()); k++)
                                {
                                    DataRow dr = dt.NewRow();
                                    dr[0] = item.CodeId;
                                    dr[1] = item.Code;
                                    dr[2] = item.ProductCode;
                                    dr[3] = item.ProductName;
                                    dr[4] = item.Brand;
                                    dr[5] = item.Country;
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
