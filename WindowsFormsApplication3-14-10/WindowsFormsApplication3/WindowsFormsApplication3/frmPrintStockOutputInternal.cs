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
    public partial class frmPrintStockOutputInternal : Office2007Form
    {
        public frmPrintStockOutputInternal()
        {
            InitializeComponent();
        }
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        cls.clsProcess cl = new cls.clsProcess();

        public static string code = "";

        private void crystalReportViewer1_Load(object sender, EventArgs e)
        {
            CrystalReport1 cry = new CrystalReport1();
            string code_bill = "", created = "", branchto = "", branchtype = "", address = "", phone = "", website = "", type = "", createdby = "";
            DataTable dt = new DataTable();
            dt.Columns.Add("ProductCode", typeof(string));
            dt.Columns.Add("ProductName", typeof(string));
            dt.Columns.Add("Quantity", typeof(int));
            dt.Columns.Add("Price", typeof(string));
            dt.Columns.Add("Total", typeof(string));
            dt.Columns.Add("STT", typeof(string));

            var s = db.sp_getBillStockOutputInternalById(code);
            int i = 0;
            foreach (var item in s.ToList())
            {
                if (i == 0)
                {
                    code_bill = item.StockCode;
                    created = item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss");
                    address = item.BranchName.Split('#')[0];
                    phone = item.BranchName.Split('#')[1];
                    branchtype = item.BranchType.Split('#')[0];
                    website = item.BranchType.Split('#')[1];
                    branchto = item.BranchToName.Replace("#", " - ");
                    createdby = item.CreatedBy;
                    type = item.OutputType;
                }

                DataRow dr = dt.NewRow();
                dr[0] = item.ProductId;
                dr[1] = item.ProductName.ToUpper();
                dr[2] = item.Quantity;
                dr[3] = string.Format("{0:0,0}", item.Price);
                dr[4] = string.Format("{0:0,0}", item.Quantity * item.Price);
                dr[5] = (i + 1).ToString();
                dt.Rows.Add(dr);
                i++;
            }
            cry.SetDataSource(dt);
            cry.DataDefinition.FormulaFields["branchtype"].Text = "\"" + branchtype + "\"";
            cry.DataDefinition.FormulaFields["address"].Text = "\"" + address + "\"";
            cry.DataDefinition.FormulaFields["name"].Text = "\"" + createdby + "\"";
            cry.DataDefinition.FormulaFields["branchto"].Text = "\"" + branchto + "\"";
            cry.DataDefinition.FormulaFields["codebill"].Text = "\"" + code_bill + "\"";
            cry.DataDefinition.FormulaFields["date"].Text = "\"" + created + "\"";
            cry.DataDefinition.FormulaFields["tel"].Text = "\"" + phone + "\"";
            cry.DataDefinition.FormulaFields["website"].Text = "\"Website: " + website + "\"";
            cry.DataDefinition.FormulaFields["type"].Text = "\"" + type + "\"";
            cry.DataDefinition.FormulaFields["printdate"].Text = "\"" + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + "\"";

            crystalReportViewer1.ReportSource = cry;
            crystalReportViewer1.Refresh();
        }
    }
}
