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
    public partial class frmSummaryStockInput : Office2007Form
    {
        public frmSummaryStockInput()
        {
            InitializeComponent();
        }
        private string code = "", type = "", date = "", price = "", branch = "", note = "";
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        cls.clsProcess cl = new cls.clsProcess();
        private void frmSummaryStockInput_Load(object sender, EventArgs e)
        {
            txtFromDate.Text = DateTime.Now.ToString("MM/dd/yyyy");
            txtToDate.Text = DateTime.Now.ToString("MM/dd/yyyy");
            btnDetail.Enabled = false;
            btnPrint.Enabled = false;
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtFromDate.Text.Trim().Equals("") || txtToDate.Text.Trim().Equals(""))
                MessageBox.Show("Nhập khoảng thời gian cần xem", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                var p = db.sp_SummaryStockInput(WindowsFormsApplication3.Form1.branch_type_id, WindowsFormsApplication3.Form1.branch_id,
                    DateTime.Parse(cl.returnDatetime(txtFromDate.Text.Trim())), 
                    DateTime.Parse(cl.returnDatetime(txtToDate.Text.Trim())));

                dgvGrid.DataSource = p;
                btnDetail.Enabled = false;
                btnPrint.Enabled = false;
                btnPrintList.Enabled = dgvGrid.Rows.Count > 0;
                if (dgvGrid.Rows.Count == 0)
                    MessageBox.Show("Không tìm thấy dữ liệu nào phù hợp", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }


        private void dgvGrid_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                var typeId = dgvGrid.Rows[e.RowIndex].Cells["InputType"].Value.ToString();
                type = typeId;
                var codeId = dgvGrid.Rows[e.RowIndex].Cells["StockCode"].Value.ToString();
                code = codeId;
                date = dgvGrid.Rows[e.RowIndex].Cells["CreateAt"].Value.ToString();
                //price = dgvGrid.Rows[e.RowIndex].Cells["TotalPrice"].Value.ToString();
                branch = dgvGrid.Rows[e.RowIndex].Cells["BranchName"].Value.ToString();
                note = dgvGrid.Rows[e.RowIndex].Cells["Note1"].Value.ToString();

                if (type == "1")
                {
                    //nhap tu NCC

                    frmSummaryStockInutDetail.code = code;
                    frmSummaryStockInutDetail.date = date;
                    frmSummaryStockInutDetail.price = price;
                    frmSummaryStockInutDetail.branch = branch;
                    frmSummaryStockInutDetail.note = note;

                    var f = new frmSummaryStockInutDetail();
                    f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
                    f.Show();
                }
                else
                {

                    frmSummaryStockInutDetail.code = code;
                    frmSummaryStockInutDetail.date = date;
                    frmSummaryStockInutDetail.price = price;
                    frmSummaryStockInutDetail.branch = branch;
                    frmSummaryStockInutDetail.note = note;

                    var f = new frmSummaryStockInutDetail();
                    f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
                    f.Show();
                }
            }
        }

        //private void btnPrint_Click(object sender, EventArgs e)
        //{
        //    if (code != "")
        //    {
        //        if (type == "1")
        //        {
        //            //frmPrintOrder.code = code;
        //            //frmPrintOrder f = new frmPrintOrder();
        //            //f.ShowDialog();
        //        }
        //        else
        //        {
        //            frmPrintStockInputInternal.code = code;
        //            var f = new frmPrintStockInputInternal();
        //            f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
        //            f.Show();
        //        }
        //    }
        //    else
        //        MessageBox.Show("Hãy chọn phiếu cần in", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        //}

        private void dgvGrid_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                var typeId = dgvGrid.Rows[e.RowIndex].Cells[0].Value.ToString();
                type = typeId;
                var codeId = dgvGrid.Rows[e.RowIndex].Cells[1].Value.ToString();
                code = codeId;
                btnDetail.Enabled = true;
                btnPrint.Enabled = true;
            }
        }

        private void btnDetail_Click(object sender, EventArgs e)
        {
            if (type == "1")
            {
                //nhap tu NCC

                frmSummaryStockInutDetail.code = code;
                frmSummaryStockInutDetail.date = date;
                frmSummaryStockInutDetail.price = price;
                frmSummaryStockInutDetail.branch = branch;
                frmSummaryStockInutDetail.note = note;

                var f = new frmSummaryStockInutDetail();
                f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
                f.Show();
            }
            else
            {

                frmSummaryStockInutDetail.code = code;
                frmSummaryStockInutDetail.date = date;
                frmSummaryStockInutDetail.price = price;
                frmSummaryStockInutDetail.branch = branch;
                frmSummaryStockInutDetail.note = note;

                var f = new frmSummaryStockInutDetail();
                f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
                f.Show();
            }
        }

        private void btnPrint_Click(object sender, EventArgs e)
        {
            frmPrintStockInputInternal.code = code;
            var f = new frmPrintStockInputInternal();
            f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
            f.Show();
        }

        private void btnPrintList_Click(object sender, EventArgs e)
        {

        }

    }
}
