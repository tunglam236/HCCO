using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DevComponents.DotNetBar;
using System.Drawing.Printing;

namespace WindowsFormsApplication3
{
    public partial class frmSummaryStockOutput : Office2007Form
    {
        public frmSummaryStockOutput()
        {
            InitializeComponent();
        }

        private string code = "", type = "", date = "", price = "",discount="", branch = "", note = "";
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        cls.clsProcess cl = new cls.clsProcess();
        private void frmSummaryStockOutput_Load(object sender, EventArgs e)
        {
            btnDetail.Enabled = false;
            btnPrint.Enabled = false;
            txtFromDate.Text = DateTime.Now.ToString("MM/dd/yyyy");
            txtToDate.Text = DateTime.Now.ToString("MM/dd/yyyy");
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtFromDate.Text.Trim().Equals("") || txtToDate.Text.Trim().Equals(""))
                MessageBox.Show("Nhập khoảng thời gian cần xem", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                var p = db.sp_SummaryStock(WindowsFormsApplication3.Form1.branch_type_id, WindowsFormsApplication3.Form1.branch_id,
                    DateTime.Parse(cl.returnDatetime(txtFromDate.Text.Trim())),
                    DateTime.Parse(cl.returnDatetime(txtToDate.Text.Trim())), txtBillCode.Text.Trim(), txtMember.Text.Trim());

                dgvGrid.DataSource = p;
                btnDetail.Enabled = false;
                btnPrint.Enabled = false;
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
                price = dgvGrid.Rows[e.RowIndex].Cells["Total"].Value.ToString();
                branch = dgvGrid.Rows[e.RowIndex].Cells["BranchName"].Value.ToString();
                note = dgvGrid.Rows[e.RowIndex].Cells["Note1"].Value.ToString();
                discount = dgvGrid.Rows[e.RowIndex].Cells["Discount1"].Value == null ?"0": dgvGrid.Rows[e.RowIndex].Cells["Discount1"].Value.ToString();

                frmSummaryStockOutputDetail.type = type;
                frmSummaryStockOutputDetail.code = code;
                frmSummaryStockOutputDetail.date = date;
                frmSummaryStockOutputDetail.price = price;
                frmSummaryStockOutputDetail.branch = branch;
                frmSummaryStockOutputDetail.note = note;
                frmSummaryStockOutputDetail.discount = discount;

                var f = new frmSummaryStockOutputDetail();
                f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
                f.Show();
            }
        }

        private void btnPrint_Click(object sender, EventArgs e)
        {
            if (code != "")
            {
                if (type == "1")
                {
                    //frmPrintOrder.code = code;
                    //var f = new frmPrintOrder();
                    //f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
                    //f.Show();
                    try
                    {
                        
                        PrintDialog _PrintDialog = new PrintDialog();
                        PrintDocument _PrintDocument = new PrintDocument();
                        _PrintDialog.Document = _PrintDocument;

                        _PrintDocument.PrintPage += new System.Drawing.Printing.PrintPageEventHandler(_CreateReceipt);
                        DialogResult result = _PrintDialog.ShowDialog();
                        if (result == DialogResult.OK)
                        {
                            _PrintDocument.Print();
                        }
                    }
                    catch (Exception ax)
                    {
                        MessageBox.Show(ax.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
                else
                {
                    frmPrintStockOutputInternal.code = code;
                    var f = new frmPrintStockOutputInternal();
                    f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
                    f.Show();
                }
            }
            else
                MessageBox.Show("Hãy chọn phiếu cần in", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }
        private void _CreateReceipt(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        {
            double total = 0;
            double sale = 0, custome_pay = 0, custome_return = 0;
            string code_bill = "", created = "", total_price = "", money = "",doitra="", branchtype = "", address = "", phone = "", website = "", facebook="", type = "", membername = "", memberphone = "", createdby = "", score="";
            var s = db.sp_getBillById(code);
            int i = 0;

            Graphics graphic = e.Graphics;

            Font font = new Font("Tahoma", 8);
            float FontHeight = font.GetHeight();
            int startX = 0;
            int startY = 10;
            int offset = 40;
            string line = "-----------------------------------------------------";
            int font_size = 7;
            //--detail
            foreach (var item in s.ToList())
            {
                if (i == 0)
                {
                    code_bill = item.StockCode;
                    created = item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss");
                    doitra = item.Doitra;
                    address = item.BranchName.Split('#')[0];
                    phone = item.BranchName.Split('#')[1];
                    branchtype = item.BranchType.Split('#')[0];
                    website = item.BranchType.Split('#')[1];
                    facebook = item.BranchType.Split('#')[2];
                    total_price = string.Format("{0:0,0 đ}", item.Total.Value);
                    sale = item.TotalDiscount;
                    total = item.TotalPrice.Value;
                    score = item.Score > 999 ? string.Format("{0:0,0 đ}", item.Score.Value) : item.Score.ToString();

                    custome_pay = item.CustomePay.Value;
                    custome_return = item.CustomeReturn.Value;

                    if (item.MemberName != "")
                    {
                        membername = item.MemberName.Split('#')[0];
                        memberphone = item.MemberName.Split('#')[1];
                    }
                    createdby = item.CreatedBy;
                    type = item.OutputType;

                    graphic.DrawString(branchtype, new Font("Tahoma", 15), new SolidBrush(Color.Black), startX + 50, startY);

                    graphic.DrawString("Địa chỉ: "+address, new Font("Tahoma", 7), new SolidBrush(Color.Black), startX, startY + 30);

                    offset = offset + (int)FontHeight;
                    graphic.DrawString(phone, new Font("Tahoma", 7), new SolidBrush(Color.Black), startX, startY + offset - 5);

                    offset = offset + (int)FontHeight;
                    graphic.DrawString("Website: "+website, new Font("Tahoma", 7), new SolidBrush(Color.Black), startX, startY + offset);

                    offset = offset + (int)FontHeight +5;
                    graphic.DrawString("Facebook: "+ facebook, new Font("Tahoma", 7), new SolidBrush(Color.Black), startX, startY + offset);

                    offset = offset + (int)FontHeight + 10;
                    graphic.DrawString(type, new Font("Tahoma", 10), new SolidBrush(Color.Black), startX + 30, startY + offset);

                    offset = offset + (int)FontHeight + 10;
                    graphic.DrawString("(Số HĐ: " + code_bill + ")", new Font("Tahoma", font_size, FontStyle.Italic), new SolidBrush(Color.Black), startX + 30, startY + offset);


                    offset = offset + (int)FontHeight + 3;
                    graphic.DrawString("Ngày HĐ: " + created, new Font("Tahoma", font_size), new SolidBrush(Color.Black), startX, startY + offset);

                    offset = offset + (int)FontHeight + 3;
                    graphic.DrawString("Thu Ngân: " + createdby, new Font("Tahoma", font_size), new SolidBrush(Color.Black), startX, startY + offset);

                    if (membername != "")
                    {
                        offset = offset + (int)FontHeight + 3;
                        graphic.DrawString("Khách hàng: " + membername, new Font("Tahoma", font_size), new SolidBrush(Color.Black), startX, startY + offset);

                        offset = offset + (int)FontHeight + 3;
                        graphic.DrawString("Điện thoại: " + memberphone, new Font("Tahoma", font_size), new SolidBrush(Color.Black), startX, startY + offset);

                        offset = offset + (int)FontHeight + 5;
                        graphic.DrawString("Tổng tiền tích lũy: " + score, new Font("Tahoma", font_size), new SolidBrush(Color.Black), startX, startY + offset);
                    }

                    offset = offset + (int)FontHeight + 5;
                    graphic.DrawString(line, new Font("Tahoma", 7, FontStyle.Regular), new SolidBrush(Color.Black), startX, startY + offset);

                    offset = offset + (int)FontHeight;
                    string top = "STT".PadRight(4) + "Tên hàng".PadRight(10) + "SL x ĐG".PadRight(15) + "Thành tiền";
                    graphic.DrawString(top, new Font("Tahoma", 7, FontStyle.Bold), new SolidBrush(Color.Black), startX, startY + offset);

                    offset = offset + (int)FontHeight;
                    graphic.DrawString(line, new Font("Tahoma", 7, FontStyle.Regular), new SolidBrush(Color.Black), startX, startY + offset);


                }

                offset = offset + (int)FontHeight + 3;
                graphic.DrawString((i + 1).ToString(), new Font("Tahoma", 6, FontStyle.Bold), new SolidBrush(Color.Black), startX+5, startY + offset);
                graphic.DrawString(item.ProductCode + " - " + item.ProductName, new Font("Tahoma", 7, FontStyle.Regular), new SolidBrush(Color.Black), startX + 20, startY + offset);

                if (item.Discount > 0)
                {
                    offset = offset + (int)FontHeight + 5;
                    graphic.DrawString(item.Quantity.Value.ToString("D2") + " x " + string.Format("{0:#,#}", item.Price.Value - item.Discount) + " = " + string.Format("{0:#,#}", item.Quantity.Value * (item.Price.Value - item.Discount)), new Font("Tahoma", 7, FontStyle.Regular), new SolidBrush(Color.Black), startX + 70, startY + offset);

                    offset = offset + (int)FontHeight + 5;
                    if (item.DiscountPercent > 0)
                        graphic.DrawString("Đơn giá: " + string.Format("{0:#,#}", item.Price.Value) + " chiết khấu " + item.DiscountPercent.ToString() + " %", new Font("Tahoma", 6, FontStyle.Italic), new SolidBrush(Color.Black), startX + 25, startY + offset);
                    else
                        graphic.DrawString("Đơn giá: " + string.Format("{0:#,#}", item.Price.Value) + " chiết khấu " + string.Format("{0:#,#}", item.Discount), new Font("Tahoma", 6, FontStyle.Italic), new SolidBrush(Color.Black), startX + 25, startY + offset);
                }
                else
                {
                    offset = offset + (int)FontHeight + 5;
                    graphic.DrawString(item.Quantity.Value.ToString("D2") + " x " + string.Format("{0:#,#}", item.Price.Value) + " = " + string.Format("{0:#,#}", item.Quantity.Value * item.Price.Value), new Font("Tahoma", 7, FontStyle.Regular), new SolidBrush(Color.Black), startX + 70, startY + offset);
                }
                i++;
            }

            //--end detail

            offset = offset + 10;
            graphic.DrawString(line, new Font("Tahoma", 7, FontStyle.Regular), new SolidBrush(Color.Black), startX, startY + offset);

            offset = offset + (int)FontHeight + 5;
            graphic.DrawString("Tổng tiền hàng ", new Font("Tahoma", font_size, FontStyle.Bold), new SolidBrush(Color.Black), startX, startY + offset);
            graphic.DrawString(total_price, font, new SolidBrush(Color.Black), startX + 125, startY + offset);

            offset = offset + (int)FontHeight + 5;
            graphic.DrawString("Chiết khấu ", new Font("Tahoma", font_size, FontStyle.Bold), new SolidBrush(Color.Black), startX, startY + offset);
            graphic.DrawString(sale > 0 ? string.Format("{0:0,0 đ}", sale) : "0 đ", font, new SolidBrush(Color.Black), startX + 125, startY + offset);

            offset = offset + (int)FontHeight + 5;
            graphic.DrawString("Tổng thanh toán ", new Font("Tahoma", font_size, FontStyle.Bold), new SolidBrush(Color.Black), startX, startY + offset);
            graphic.DrawString(total <= 0 ? "0 đ" : string.Format("{0:0,0 đ}", total), font, new SolidBrush(Color.Black), startX + 125, startY + offset);

            offset = offset + (int)FontHeight + 5;
            graphic.DrawString("Khách đưa ", new Font("Tahoma", font_size, FontStyle.Bold), new SolidBrush(Color.Black), startX, startY + offset);
            graphic.DrawString(custome_pay > 0 ? string.Format("{0:0,0 đ}", custome_pay) : "0 đ", font, new SolidBrush(Color.Black), startX + 125, startY + offset);

            offset = offset + (int)FontHeight + 5;
            graphic.DrawString("Trả lại ", new Font("Tahoma", font_size, FontStyle.Bold), new SolidBrush(Color.Black), startX, startY + offset);
            graphic.DrawString(custome_return > 0 ? string.Format("{0:0,0 đ}", custome_return) : "0 đ", font, new SolidBrush(Color.Black), startX + 125, startY + offset);

            money = cl.money_code(int.Parse(total.ToString()));

            var so1 = money.Split(' ');
            string sub = "", sub2 = "";
            if (so1.Length > 8)
            {
                for (int t = 0; t <= 7; t++)
                {
                    sub += so1[t] + " ";
                }
                for (int t = 8; t < so1.Length; t++)
                {
                    sub2 += so1[t] + " ";
                }
            }
            else sub = money;

            offset = offset + (int)FontHeight + 5;
            graphic.DrawString("Số tiền bằng chữ:", new Font("Tahoma", font_size, FontStyle.Italic), new SolidBrush(Color.Black), startX, startY + offset);

            offset = offset + (int)FontHeight + 5;

            graphic.DrawString(sub, new Font("Tahoma", 7, FontStyle.Italic), new SolidBrush(Color.Black), startX, startY + offset);
            if (so1.Length > 9)
            {
                offset = offset + (int)FontHeight + 5;
                graphic.DrawString(sub2, new Font("Tahoma", 7, FontStyle.Italic), new SolidBrush(Color.Black), startX, startY + offset);
            }

            offset = offset + (int)FontHeight + 2;
            graphic.DrawString(line, new Font("Tahoma", 7, FontStyle.Regular), new SolidBrush(Color.Black), startX, startY + offset);

            offset = offset + (int)FontHeight + 2;
            graphic.DrawString("Lưu ý !", new Font("Tahoma", 6, FontStyle.Bold), new SolidBrush(Color.Black), startX + 5, startY + offset);

            if (doitra.Trim() != "")
            {
                var dt = doitra.Trim().Split('#');
                foreach (var b in dt)
                {
                    offset = offset + (int)FontHeight + 2;
                    graphic.DrawString(b, new Font("Tahoma", 6, FontStyle.Italic), new SolidBrush(Color.Black), startX + 5, startY + offset);
                }
            }

            offset = offset + (int)FontHeight + 5;
            graphic.DrawString("XIN CẢM ƠN VÀ HẸN GẶP LẠI QUÝ KHÁCH !", new Font("Tahoma", 6, FontStyle.Bold), new SolidBrush(Color.Black), startX + 5, startY + offset);

            offset = offset + (int)FontHeight + 10;
            graphic.DrawString("Ngày in phiếu: " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"), new Font("Tahoma", 7, FontStyle.Regular), new SolidBrush(Color.Black), startX + 5, startY + offset);

            offset = offset + (int)FontHeight + 10;
            graphic.DrawString(line, new Font("Tahoma", 7, FontStyle.Regular), new SolidBrush(Color.Black), startX, startY + offset);
        }
        private void dgvGrid_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                btnDetail.Enabled = true;
                btnPrint.Enabled = true;

                var typeId = dgvGrid.Rows[e.RowIndex].Cells["InputType"].Value.ToString();
                type = typeId;
                var codeId = dgvGrid.Rows[e.RowIndex].Cells["StockCode"].Value.ToString();
                code = codeId;
                date = dgvGrid.Rows[e.RowIndex].Cells["CreateAt"].Value.ToString();
                price = dgvGrid.Rows[e.RowIndex].Cells["Total"].Value.ToString();
                branch = dgvGrid.Rows[e.RowIndex].Cells["BranchName"].Value.ToString();
                note = dgvGrid.Rows[e.RowIndex].Cells["Note1"].Value.ToString();
                discount = dgvGrid.Rows[e.RowIndex].Cells["Discount1"].Value == null ? "0" : dgvGrid.Rows[e.RowIndex].Cells["Discount1"].Value.ToString();
            }
        }

        private void btnDetail_Click(object sender, EventArgs e)
        {
            frmSummaryStockOutputDetail.type = type;
            frmSummaryStockOutputDetail.code = code;
            frmSummaryStockOutputDetail.date = date;
            frmSummaryStockOutputDetail.price = price;
            frmSummaryStockOutputDetail.branch = branch;
            frmSummaryStockOutputDetail.note = note;
            frmSummaryStockOutputDetail.discount = discount;

            var f = new frmSummaryStockOutputDetail();
            f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
            f.Show();
        }

    }
}
