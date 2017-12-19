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
    public partial class frmSummaryStockInutDetail : Office2007Form
    {
        public frmSummaryStockInutDetail()
        {
            InitializeComponent();
        }
        public static string type="",code = "", date = "", price = "", branch = "", note = "";
        private void frmSummaryStockInutDetail_Load(object sender, EventArgs e)
        {
            txtBranchName.Text = branch;
            txtCode.Text = code;
            txtCreateAt.Text = date;
            //txtTotalPrice.Text = double.Parse(price.Replace(",", "")) > 999 ? string.Format("{0:0,0}", double.Parse(price.Replace(",", ""))) : double.Parse(price.Replace(",", "")).ToString();
            lbNote.Text = note;

            CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);

            DataTable dt = new DataTable();
            dt.Columns.Add("STT", typeof(string));
            dt.Columns.Add("ProductCode", typeof(string));
            dt.Columns.Add("Code", typeof(string));
            dt.Columns.Add("ProductName", typeof(string));
            dt.Columns.Add("Quantity", typeof(int));


            var s = db.sp_getBillStockInputInternalById(code);
            int i = 0;
            foreach (var item in s.ToList())
            {
                DataRow dr = dt.NewRow();
                dr[0] = (i + 1).ToString();
                dr[1] = item.ProductId.Substring(0, item.ProductId.IndexOf('-'));
                dr[2] = item.ProductId.Substring(item.ProductId.IndexOf('-')+1);
                dr[3] = item.ProductName;
                dr[4] = item.Quantity;
                dt.Rows.Add(dr);
                if (i == 0)
                    txtCreateAt.Text = item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss");
                i++;
            }
            dgGrid.DataSource = dt;
        }

        private void btnPrint_Click(object sender, EventArgs e)
        {
            frmPrintStockInputInternal.code = code;
            var f = new frmPrintStockInputInternal();
            f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
            f.Show();
        }
    }
}
