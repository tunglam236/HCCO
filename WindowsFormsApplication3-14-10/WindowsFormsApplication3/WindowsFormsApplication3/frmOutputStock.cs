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
using System.Net;
using System.Globalization;

namespace WindowsFormsApplication3
{
    public partial class frmOutputStock : Office2007Form
    {
        public frmOutputStock()
        {
            InitializeComponent();
        }
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        cls.clsProcess cl = new cls.clsProcess();
        private string id_current = "0",stockcode="";
        private string discountId = "", discountCode = "";
        public static int memberId = 0;
        public static string memberName = "";
        private static int percent = 0;
        private DataTable dtTemp = new DataTable();
        private int quantity_current=0;

        private void resetControl()
        {
            memberId = 0;
            memberName = "";
            btnDel.Enabled = false;
            btnSave.Enabled = false;
            btnCancel.Enabled = false;
            btnInsert.Enabled = true;
            foreach (Control ctr in grTTK.Controls)
            {
                if (ctr is TextBox)
                {
                    ctr.Text = "";
                }
            }
            var stt = 1;
            txtCreateDate.Text =  DateTime.Now.ToString("dd/MM/yyyy");
            var codeId = db.sp_StockOutput_GetCodeId().FirstOrDefault().CodeId.Value;
            stt = codeId + 1;
            txtStockCode.Text = "HDBH"+DateTime.Now.ToString("ddMMyy") + stt.ToString("D3");
            txtProductCode.Focus();
            id_current = "0"; memberId = 0;
            lbTotalPrice.Text = "Tổng tiền: 0";
            txtDiscount.Text = "0";
            percent = 0;
            Dictionary<string, string> type = new Dictionary<string, string>();
            type.Add("1", "Tiền mặt");
            type.Add("2", "Qua ngân hàng");
            type.Add("3", "Cà thẻ");
            cboPaymentType.DataSource = new BindingSource(type, null);
            cboPaymentType.DisplayMember = "Value";
            cboPaymentType.ValueMember = "Key";

            cbMember.SelectedItem = null;
            cbUser.SelectedItem = null;
        }
        private string getDateTime()
        {
            var myHttpWebRequest = (HttpWebRequest)WebRequest.Create("https://time.is/Vietnam");
            var response = myHttpWebRequest.GetResponse();
            string todaysDates = response.Headers["Expires"];
            DateTime dateTime = DateTime.Parse(todaysDates);
            string dt = dateTime.ToString("dd/MM/yyyy hh:mm:ss");
            response.Close();
            return dt;
        }
        private void insertProduct()
        {
            if (txtProductCode.Text.Trim().Equals(""))
                MessageBox.Show("Nhập mã sản phẩm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                try
                {
                    var d = db.sp_Product_GetDetailByCodeId(WindowsFormsApplication3.Form1.branch_type_id, WindowsFormsApplication3.Form1.branch_id, txtProductCode.Text.Trim(), 1).ToList();
                    if (d.Count() > 0)
                    {
                        if (d.FirstOrDefault().Price > 0)
                        {
                            if (dtTemp.Columns.Count == 0)
                            {
                                dtTemp.Columns.Add("ProductId", typeof(string));
                                dtTemp.PrimaryKey = new DataColumn[] { dtTemp.Columns[0] };
                                dtTemp.Columns.Add("ProductCode", typeof(string));
                                dtTemp.Columns.Add("ProductName", typeof(string));
                                dtTemp.Columns.Add("Quantity", typeof(int));
                                dtTemp.Columns.Add("UnitId", typeof(int));
                                dtTemp.Columns.Add("UnitName", typeof(string));
                                dtTemp.Columns.Add("PriceCoss", typeof(string));
                                dtTemp.Columns.Add("Price", typeof(string));
                                dtTemp.Columns.Add("Discount", typeof(string));
                                dtTemp.Columns.Add("Total", typeof(float));
                                dtTemp.Columns.Add("IsCombo", typeof(string));
                                dtTemp.Columns.Add("ToTalPrice", typeof(float));
                                dtTemp.Columns.Add("Note", typeof(string));
                            }
                            int currrent_quantity = 0;
                            if (dtTemp.Rows.Count > 0)
                            {
                                DataRow r = dtTemp.Rows.Find(d.FirstOrDefault().Id.ToString());
                                if (r != null && !r.IsNull("ProductId"))
                                {
                                    currrent_quantity = int.Parse(r["Quantity"].ToString());
                                    dtTemp.Rows.Remove(r);
                                }
                            }

                            double _price = 0, _priSaleValue = 0;
                            int _priType = 0;
                            _price = d.FirstOrDefault().Price.Value;
                            _priType = d.FirstOrDefault().saleType.Value;
                            _priSaleValue = d.FirstOrDefault().saleValue.Value;

                            if (_priType == 1)//giam gia tien
                                _price = _price - d.FirstOrDefault().saleValue.Value;
                            else if (_priType == 2)//giam phan tram
                                _price = _price - ((_price * d.FirstOrDefault().saleValue.Value) / 100);
                            else if (_priType == 3)//dong gia
                                _price = d.FirstOrDefault().saleValue.Value;

                            DataRow dr = dtTemp.NewRow();
                            dr["ProductId"] = d.FirstOrDefault().Id.ToString();
                            dr["ProductCode"] = d.FirstOrDefault().ProductCode;
                            dr["ProductName"] = d.FirstOrDefault().ProductName;
                            dr["Quantity"] = currrent_quantity + 1;
                            dr["UnitId"] = d.FirstOrDefault().UnitId;
                            dr["UnitName"] = d.FirstOrDefault().UnitName;
                            dr["PriceCoss"] = string.Format("{0:0,0}", d.FirstOrDefault().Price.Value);
                            dr["Price"] = string.Format("{0:0,0}", _price);
                            dr["Discount"] = d.FirstOrDefault().Discount > 999 ? string.Format("{0:0,0}", d.FirstOrDefault().Discount) : d.FirstOrDefault().Discount.ToString();
                            dr["Total"] = (currrent_quantity + 1) * _price;
                            dr["IsCombo"] = d.FirstOrDefault().IsCombo;

                            dr["ToTalPrice"] = string.Format("{0:0,0}", (((currrent_quantity + 1) * _price) - d.FirstOrDefault().Discount));
                            dr["Note"] = _priType == 1 ? "Giảm giá " + string.Format("{0:0,0 đ}", _priSaleValue) :
                                _priType == 2 ? "Giảm giá " + _priSaleValue.ToString() + " %" :
                                _priType == 3 ? "Đồng giá " + string.Format("{0:0,0 đ}", _priSaleValue) : "";

                            dtTemp.Rows.Add(dr);

                            dgvTemp.DataSource = dtTemp;
                            
                            if (dtTemp.Rows.Count > 0)
                            {
                                object total_price = dtTemp.Compute("SUM(Total)", "");

                                btnSave.Enabled = true;
                                btnCancel.Enabled = true;
                                txtProductCode.Text = "";
                                txtProductCode.Focus();
                                txtTotalPrice.Text = string.Format("{0:0,0}", double.Parse(total_price.ToString()));
                                //var discount = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", ""));
                                double discount = 0;// double.Parse(txtDiscount.Text.Trim().Replace(",", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", ""));
                                if (txtDiscount.Text.Trim().Contains("%"))
                                {
                                    var di = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace("%", ""));
                                    discount = Math.Round((double.Parse(total_price.ToString()) * di) / 100, 0);
                                }
                                else
                                    discount = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace("%", ""));


                                txtTotal.Text = string.Format("{0:0,0}", double.Parse(total_price.ToString()) - discount);
                                lbTotalPrice.Text = "Tổng tiền: " + string.Format("{0:0,0}", double.Parse(total_price.ToString())- discount) + " (" + cl.money_code(double.Parse(total_price.ToString())- discount) + ")";
                                returnMoney();
                            }
                        }
                        else
                            MessageBox.Show("Sản phẩm chưa có giá bán. Vui lòng kiểm tra lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                    else
                    {
                        if (txtProductCode.Text.Trim().StartsWith("20"))
                            MessageBox.Show("Không tìm thấy thông tin combo hoặc combo không trong thời gian áp dụng, hãy kiểm tra lại mã combo", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        else
                            MessageBox.Show("Không tìm thấy thông tin sản phẩm, hãy kiểm tra lại mã sản phẩm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
                catch (Exception ax)
                {
                    MessageBox.Show(ax.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }
        private void frmOutputStock_Load(object sender, EventArgs e)
        {
            resetControl();
            cbUser.DataSource = from x in db.tAccounts from y in db.tGroupUsers
                                where x.GroupUserId==y.Id && x.BranchTypeId == WindowsFormsApplication3.Form1.branch_type_id
                                && x.BranchId == WindowsFormsApplication3.Form1.branch_id && (x.Status == 1 || x.Status == 3)
                                && (y.GroupCode=="SF" || y.GroupCode=="LB")
                                select new { x.Id, Name = x.Username + " - " + x.FullName };
            cbUser.SelectedItem = null;

            cbMember.DataSource = from x in db.tMembers
                                where x.BranchTypeId == WindowsFormsApplication3.Form1.branch_type_id
                                 && x.Status == 1
                                  select new { x.Id, Name = x.Phone + " - " + x.MemberName };
            cbMember.SelectedItem = null;
            txtProductCode.Focus();
        }

        private void btnInsert_Click(object sender, EventArgs e)
        {
            insertProduct();
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            txtProductCode.Text = "";
            btnInsert.Enabled = true;
            btnDel.Enabled = false;
        }

        private void btnDel_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn chắc chắc muốn xóa ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                if (dtTemp.Rows.Count > 0)
                {
                    DataRow r = dtTemp.Rows.Find(id_current);
                    if (r != null && !r.IsNull("ProductId"))
                    {
                        dtTemp.Rows.Remove(r);
                    }

                    dgvTemp.DataSource = dtTemp;

                    if (dtTemp.Rows.Count > 0)
                    {
                        object total_price = dtTemp.Compute("SUM(Total)", "");

                        btnSave.Enabled = true;
                        btnCancel.Enabled = true;
                        txtProductCode.Text = "";
                        txtProductCode.Focus();
                        txtTotalPrice.Text = string.Format("{0:0,0}", double.Parse(total_price.ToString()));
                        //var discount = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", ""));
                        double discount = 0;// double.Parse(txtDiscount.Text.Trim().Replace(",", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", ""));
                        if (txtDiscount.Text.Trim().Contains("%"))
                        {
                            var di = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace("%", ""));
                            discount = Math.Round((double.Parse(total_price.ToString()) * di) / 100, 0);
                        }
                        else
                            discount = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace("%", ""));

                        txtTotal.Text = string.Format("{0:0,0}", double.Parse(total_price.ToString()) - discount);
                        lbTotalPrice.Text = "Tổng tiền: " + string.Format("{0:0,0}", double.Parse(total_price.ToString()) - discount) + " (" + cl.money_code(double.Parse(total_price.ToString()) - discount) + ")";
                        returnMoney();
                    }
                    else
                    {
                        txtTotal.Text = "0";
                        txtTotalPrice.Text = "0";
                        txtDiscount.Text = "0";
                        txtCustomePay.Text = "0";
                        txtCustomeReturn.Text = "0";
                        lbTotalPrice.Text = "Tổng tiền: 0";
                    }
                }
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Bạn chắc chắc muốn lưu phiếu xuất này ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    if (dtTemp.Rows.Count > 0)
                    {
                        if (cbUser.SelectedItem != null)
                        {
                            if (txtCustomePay.Text.Trim() == "" || (txtTotal.Text.Trim()!="0" && txtCustomePay.Text.Trim() == "0"))
                                MessageBox.Show("Nhập số tiền khách thanh toán", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            else
                            {
                                object total_price = dtTemp.Compute("SUM(Total)", "");
                                var codeId = db.sp_StockOutput_GetCodeId().FirstOrDefault().CodeId.Value;

                                var p = new tStockOutput();
                                var code2 = "HDBH" + DateTime.Now.ToString("ddMMyy") + (codeId + 1).ToString("D3");
                                p.StockCode = code2;
                                p.BranchTypeId = WindowsFormsApplication3.Form1.branch_type_id;
                                p.BranchId = WindowsFormsApplication3.Form1.branch_id;
                                p.OutputType = 1;//xuat ban
                                p.Note = txtNote.Text.Trim();
                                p.TotalPrice = double.Parse(txtTotal.Text.Trim().Replace(",", "").Equals("") ? "0" : txtTotal.Text.Trim().Replace(",", ""));
                                p.Total = double.Parse(txtTotalPrice.Text.Trim().Replace(",", "").Equals("") ? "0" : txtTotalPrice.Text.Trim().Replace(",", ""));
                                p.Status = 1;
                                p.PaymentType = byte.Parse(cboPaymentType.SelectedValue.ToString());

                                if (cbUser.SelectedItem != null)
                                {
                                    p.AccountId = int.Parse(cbUser.SelectedValue.ToString().Trim());
                                }
                                if (discountId.Trim() != "")
                                {
                                    p.DiscountId = int.Parse(discountId);
                                    p.DiscountCode = discountCode.Trim();

                                    var dis = from x in db.tDiscountLists
                                              where x.Id == int.Parse(discountId.Trim())
                                              select x;
                                    dis.FirstOrDefault().IsUsing = true;
                                    dis.FirstOrDefault().ModifiedAt = DateTime.Now;
                                }

                                if (cbMember.SelectedItem != null && cbMember.SelectedValue.ToString() != "")
                                    p.MemberId = int.Parse(cbMember.SelectedValue.ToString());
                                p.CreateAt = DateTime.Now; //DateTime.Parse(cl.returnDatetime(getDateTime()));
                                p.CreateBy = WindowsFormsApplication3.Form1.user_id;
                                //p.Discount = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", ""));
                                //if (percent > 0)
                                //    p.DiscountPercent = double.Parse(percent.ToString());

                                double discount = 0;// double.Parse(txtDiscount.Text.Trim().Replace(",", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", ""));
                                if (txtDiscount.Text.Trim().Contains("%"))
                                {
                                    var di = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Replace(" ", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Replace(" ", ""));
                                    discount = Math.Round((double.Parse(total_price.ToString()) * di) / 100, 0);
                                    p.DiscountPercent = di;
                                    p.Discount = discount;
                                }
                                else
                                {
                                    discount = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Replace(" ", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Replace(" ", ""));
                                    p.DiscountPercent = 0;
                                    p.Discount = discount;
                                }

                                if (txtCustomePay.Text.Trim().Equals("") || txtCustomePay.Text.Trim().Equals("0"))
                                {
                                    p.CustomePay = p.TotalPrice;
                                    p.CustomeReturn = 0;
                                }
                                else
                                {
                                    p.CustomePay = double.Parse(txtCustomePay.Text.Trim().Replace(",", "").Equals("") ? "0" : txtCustomePay.Text.Trim().Replace(",", ""));
                                    p.CustomeReturn = double.Parse(txtCustomeReturn.Text.Trim().Replace(",", "").Equals("") ? "0" : txtCustomeReturn.Text.Trim().Replace(",", ""));
                                }
                                db.tStockOutputs.InsertOnSubmit(p);
                                db.SubmitChanges();

                                //insert feedback
                                if (cbMember.SelectedItem != null && cbMember.SelectedValue.ToString() != "")
                                {
                                    var f = new tFeedback();
                                    f.BranchTypeId = WindowsFormsApplication3.Form1.branch_type_id;
                                    f.BranchId = WindowsFormsApplication3.Form1.branch_id;
                                    f.OrderId = p.Id;
                                    f.MemberId = int.Parse(cbMember.SelectedValue.ToString());
                                    f.OrderAt = DateTime.Now;
                                    f.Status = false;
                                    db.tFeedbacks.InsertOnSubmit(f);
                                    db.SubmitChanges();
                                }

                                for (int i = 0; i < dtTemp.Rows.Count; i++)
                                {
                                    if (int.Parse(dtTemp.Rows[i]["IsCombo"].ToString()) == 0)
                                    {
                                        var d_sl = int.Parse(dtTemp.Rows[i]["Quantity"].ToString().Replace(",", ""));
                                        var d_dg = double.Parse(dtTemp.Rows[i]["Price"].ToString().Replace(",", ""));
                                        

                                        var detail = new tStockOutputDetail();
                                        detail.StockOutputId = p.Id;
                                        detail.ProductId = int.Parse(dtTemp.Rows[i]["ProductId"].ToString());
                                        detail.Quantity = d_sl;
                                        detail.Price = d_dg;

                                        if (dtTemp.Rows[i]["Discount"].ToString().Contains("%"))
                                        {
                                            var ds = int.Parse(dtTemp.Rows[i]["Discount"].ToString().Replace("%", "").Replace(",", ""));
                                            var s = Math.Round(((d_sl * d_dg * ds) / 100),0);

                                            detail.Discount = s;
                                            detail.DiscountPercent = double.Parse(ds.ToString());
                                        }
                                        else
                                        {
                                            detail.Discount = double.Parse(dtTemp.Rows[i]["Discount"].ToString().Replace(",",""));
                                            detail.DiscountPercent = 0;
                                        }
                                        detail.IsCombo = false;
                                        detail.ComboId = 0;
                                        detail.Note = dtTemp.Rows[i]["Note"].ToString();
                                        detail.ComboQuantity = 0;
                                        db.tStockOutputDetails.InsertOnSubmit(detail);


                                        var ton = new tStockInventory();
                                        ton.BranchTypeId = WindowsFormsApplication3.Form1.branch_type_id;
                                        ton.BranchId = WindowsFormsApplication3.Form1.branch_id;
                                        ton.ProductId = int.Parse(dtTemp.Rows[i]["ProductId"].ToString());
                                        ton.QuantityOut = byte.Parse(dtTemp.Rows[i]["Quantity"].ToString());
                                        ton.CreateAt = DateTime.Now;
                                        db.tStockInventories.InsertOnSubmit(ton);
                                    }
                                    else
                                    {
                                        var d_sl = int.Parse(dtTemp.Rows[i]["Quantity"].ToString());
                                        var d_dg = double.Parse(dtTemp.Rows[i]["Price"].ToString());

                                        //is combo, foreach product in combo
                                        var pd = from x in db.tCombos
                                                 from y in db.tComboDetails
                                                 where x.Id == y.ComboId && x.Id == Int64.Parse(dtTemp.Rows[i]["IsCombo"].ToString())
                                                 select new { x.Id, y.ProductId, y.Quantity };
                                        var si = 0;
                                        foreach (var item in pd.ToList())
                                        {
                                            var detail = new tStockOutputDetail();
                                            detail.StockOutputId = p.Id;
                                            detail.ProductId = item.ProductId.Value;
                                            detail.Quantity = d_sl * item.Quantity.Value;
                                            if (si == 0)
                                            {
                                                detail.Price = d_dg;
                                                //detail.Discount = double.Parse(dtTemp.Rows[i]["Discount"].ToString());
                                                if (dtTemp.Rows[i]["Discount"].ToString().Contains("%"))
                                                {
                                                    var ds = int.Parse(dtTemp.Rows[i]["Discount"].ToString().Replace("%", "").Replace(",", ""));
                                                    var s = Math.Round((d_sl * d_dg) - ((d_sl * d_dg * ds) / 100), 0);

                                                    detail.Discount = s;
                                                    detail.DiscountPercent = double.Parse(ds.ToString());
                                                }
                                                else
                                                {
                                                    detail.Discount = double.Parse(dtTemp.Rows[i]["Discount"].ToString().Replace(",", ""));
                                                    detail.DiscountPercent = 0;
                                                }

                                            }
                                            else
                                            {
                                                detail.Price = 0;
                                                detail.Discount = 0;
                                            }
                                            detail.IsCombo = true;
                                            detail.ComboId = item.Id;
                                            detail.Note = dtTemp.Rows[i]["Note"].ToString();
                                            detail.ComboQuantity = byte.Parse(dtTemp.Rows[i]["Quantity"].ToString());
                                            db.tStockOutputDetails.InsertOnSubmit(detail);
                                            si++;

                                            var ton = new tStockInventory();
                                            ton.BranchTypeId = WindowsFormsApplication3.Form1.branch_type_id;
                                            ton.BranchId = WindowsFormsApplication3.Form1.branch_id;
                                            ton.ProductId = item.ProductId.Value;
                                            ton.QuantityOut = byte.Parse((int.Parse(dtTemp.Rows[i]["Quantity"].ToString()) * item.Quantity.Value).ToString());
                                            ton.CreateAt = DateTime.Now;

                                            db.tStockInventories.InsertOnSubmit(ton);
                                        }
                                    }
                                }
                                db.SubmitChanges();
                                
                                dtTemp.Rows.Clear();
                                resetControl();
                                MessageBox.Show("Lưu thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                if (ckPrint.Checked)
                                {
                                    stockcode = code2;
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
                            }
                        }
                        else
                            MessageBox.Show("Chọn nhân viên bán hàng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                    else
                        MessageBox.Show("Không có sản phẩm nào trong đơn hàng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            catch (Exception ax)
            {
                MessageBox.Show(ax.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            if (dtTemp.Rows.Count > 0)
            {
                if (MessageBox.Show("Phiếu xuất này sẽ không được lưu, bạn chắc chắn muốn hủy không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    dtTemp.Rows.Clear();
                    resetControl();
                }
            }
            else resetControl();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (dtTemp.Rows.Count > 0)
            {
                if (MessageBox.Show("Phiếu xuất này sẽ không được lưu, bạn chắc chắn muốn hủy không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    this.Close();
                }
            }
            else
                this.Close();
        }

        private void btnList_Click(object sender, EventArgs e)
        {
            var f = new frmSummaryStockOutput();
            f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
            f.Show();
        }

        private void dgvTemp_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            #region Cell_Click
            try
            {
                if (dgvTemp.Rows.Count != -1 && e.RowIndex != -1)
                {
                    btnDel.Enabled = true;

                    var id = dgvTemp[0, e.RowIndex].Value.ToString();
                    id_current = id;
                }
            }
            catch (Exception a)
            {
                MessageBox.Show(a.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            #endregion
        }

        private void dgvTemp_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                if (dgvTemp.CurrentCell.ColumnIndex == 3 || dgvTemp.CurrentCell.ColumnIndex == 8 || dgvTemp.CurrentCell.ColumnIndex == 12)
                {
                    dgvTemp.BeginEdit(true);
                }
            }
        }

        private void txtProductCode_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && (!char.IsControl(e.KeyChar)))
            {
                e.Handled = true;
            }
        }

        private void txtProductCode_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
               insertProduct();
            }
        }

        private void dgvTemp_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            if (e.ColumnIndex == 3)
            {
                var v = dgvTemp.Rows[e.RowIndex].Cells[e.ColumnIndex].Value;
                quantity_current = int.Parse(v.ToString());
            }
            else
            {
                var v = dgvTemp.Rows[e.RowIndex].Cells["Quantity"].Value;
                quantity_current = int.Parse(v.ToString());
            }
        }
        private void dgvTemp_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex != 12)
            {
                var id = dgvTemp.Rows[e.RowIndex].Cells["Id"].Value;
                var code = dgvTemp.Rows[e.RowIndex].Cells["ProductCode"].Value;
                var quantity = dgvTemp.Rows[e.RowIndex].Cells["Quantity"].Value;
                var dis = dgvTemp.Rows[e.RowIndex].Cells["Discount"].Value;
                var price = dgvTemp.Rows[e.RowIndex].Cells["Price"].Value;
                try
                {
                    if (int.Parse(quantity.ToString()) <= 0)
                    {
                        //MessageBox.Show("Nhập số lượng lớn hơn 0 hoặc xóa sản phẩm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        DataRow r = dtTemp.Rows.Find(id_current);
                        if (r != null && !r.IsNull("ProductId"))
                        {
                            dtTemp.Rows.Remove(r);

                            object total_price = dtTemp.Compute("SUM(Total)", "");

                            txtTotalPrice.Text = string.Format("{0:0,0}", double.Parse(total_price.ToString()));
                            double discount = 0;// double.Parse(txtDiscount.Text.Trim().Replace(",", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", ""));
                            if (txtDiscount.Text.Trim().Contains("%"))
                            {
                                var d = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace("%", ""));
                                discount = Math.Round((double.Parse(total_price.ToString()) * d) / 100, 0);
                            }
                            else
                                discount = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace("%", ""));


                            txtTotal.Text = string.Format("{0:0,0}", double.Parse(total_price.ToString()) - discount);
                            lbTotalPrice.Text = "Tổng tiền: " + string.Format("{0:0,0}", double.Parse(total_price.ToString()) - discount) + " (" + cl.money_code(double.Parse(total_price.ToString()) - discount) + ")";
                            returnMoney();
                        }
                    }
                    else
                    {
                        //check so luong ton khi sua so luong
                        var d = db.sp_Product_GetDetailByCodeId(WindowsFormsApplication3.Form1.branch_type_id, WindowsFormsApplication3.Form1.branch_id, code.ToString(), int.Parse(quantity.ToString())).ToList();

                        DataRow r = dtTemp.Rows.Find(id.ToString());
                        if (r != null && !r.IsNull("ProductId"))
                        {
                            r["Quantity"] = int.Parse(quantity.ToString());

                            var discount = dis.ToString().Replace(",", "");
                            if (discount == "") discount = "0";

                            if (!discount.Contains("%"))
                            {
                                var disc = double.Parse(dis.ToString().Trim().Replace(",", ""));
                                r["Discount"] = dis.ToString() == "" ? "0" : disc > 999 ? string.Format("{0:0,0}", disc) : dis.ToString();
                                r["Total"] = (int.Parse(quantity.ToString()) * double.Parse(r["Price"].ToString())) - double.Parse(discount);
                                r["TotalPrice"] = string.Format("{0:0,0}", (int.Parse(quantity.ToString()) * double.Parse(r["Price"].ToString())) - double.Parse(discount));
                            }
                            else
                            {
                                var p = discount.Replace("%", "");
                                discount = Math.Round((int.Parse(quantity.ToString()) * double.Parse(price.ToString())) - ((int.Parse(quantity.ToString()) * double.Parse(price.ToString()) * double.Parse(p)) / 100), 0).ToString();
                                r["Discount"] = discount == "" ? "0" : dis;
                                r["Total"] = discount;
                                r["TotalPrice"] = string.Format("{0:0,0}", discount);
                            }
                        }
                    }

                    dgvTemp.DataSource = dtTemp;
                    if (dtTemp.Rows.Count > 0)
                    {
                        object total_price = dtTemp.Compute("SUM(Total)", "");
                        txtTotalPrice.Text = string.Format("{0:0,0}", double.Parse(total_price.ToString()));
                        //var discount = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", ""));
                        double discount = 0;// double.Parse(txtDiscount.Text.Trim().Replace(",", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", ""));
                        if (txtDiscount.Text.Trim().Contains("%"))
                        {
                            var d = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace("%", ""));
                            discount = Math.Round((double.Parse(total_price.ToString()) * d) / 100, 0);
                        }
                        else
                            discount = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace("%", ""));


                        txtTotal.Text = string.Format("{0:0,0}", double.Parse(total_price.ToString()) - discount);

                        lbTotalPrice.Text = "Tổng tiền: " + string.Format("{0:0,0}", double.Parse(total_price.ToString()) - discount) + " (" + cl.money_code(double.Parse(total_price.ToString()) - discount) + ")";
                        returnMoney();
                    }
                }
                catch (Exception ax)
                {
                    dgvTemp.Rows[e.RowIndex].Cells[e.ColumnIndex].Value = quantity_current.ToString();
                    MessageBox.Show(ax.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }
        private void btnAddMember_Click(object sender, EventArgs e)
        {
            var f = new frmMember();
            f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
            f.Show();
        }

        private void txtCustome_KeyUp(object sender, KeyEventArgs e)
        {
            returnMoney();
        }
        void returnMoney()
        {
            double totalprice = double.Parse(txtTotalPrice.Text.Trim().Replace(",", "").Equals("") ? "0" : txtTotalPrice.Text.Trim().Replace(",", ""));
            double discount = 0;// double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace("%", ""));
            if(txtDiscount.Text.Trim().Contains("%"))
            {
                var d = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace("%", ""));
                discount = Math.Round((totalprice * d) / 100, 0);
            }
            else
                discount = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace("%", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace("%", ""));

            txtTotal.Text = totalprice - discount > 999 ? string.Format("{0:0,0}", totalprice - discount) : totalprice - discount <= 0 ? "0" : (totalprice - discount).ToString();

            double total = double.Parse(txtTotal.Text.Trim().Replace(",", "").Equals("") ? "0" : txtTotal.Text.Trim().Replace(",", ""));
            double customepay = double.Parse(txtCustomePay.Text.Trim().Replace(",", "").Equals("") ? "0" : txtCustomePay.Text.Trim().Replace(",", ""));

            txtCustomeReturn.Text = (customepay - total) == 0 ? (customepay - total).ToString() : string.Format("{0:0,0}", customepay - total);
            txtCustomePay.Text = customepay.ToString();// customepay > 1000 ? string.Format("{0:0,0}", customepay) : customepay.ToString();

            lbTotalPrice.Text = "Tổng tiền: " + string.Format("{0:0,0}", total) + " (" + cl.money_code(total) + ")";
        }
        private void txtCustome_MouseClick(object sender, MouseEventArgs e)
        {
            //txtCustomePay.SelectAll();
        }

        private void txtDiscount_KeyUp(object sender, KeyEventArgs e)
        {
            var per = txtDiscount.Text.Trim() == "" ? "0" : txtDiscount.Text.Trim().Replace(",", "");
            if (txtDiscount.Text.Trim().Length>1 && txtDiscount.Text.Trim().Contains("%"))
            {
                per = per.Replace(" ","").Replace("%", "");
                percent = int.Parse(per);
                var total = double.Parse(txtTotalPrice.Text.Trim().Replace(",", "").Equals("") ? "0" : txtTotalPrice.Text.Trim().Replace(",", ""));
                //txtDiscount.Text = string.Format("{0:0,0}", Math.Round((double.Parse(per) * total) / 100), 0);
                txtDiscount.Text = per+" %";// Math.Round((double.Parse(per) * total) / 100).ToString();
            }
            else
            {
                percent = 0;
                per = per.Replace("%", "").Replace(" ", "").Equals("") ? "0" : per.Replace("%", "");
                //if (double.Parse(per)>999)
                txtDiscount.Text = per.ToString();// string.Format("{0:0,0}", double.Parse(per));
            }
            returnMoney();
        }
        private void txtDiscount_MouseClick(object sender, MouseEventArgs e)
        {
           //txtDiscount.SelectAll();
        }

        private void txtDiscount_MouseLeave(object sender, EventArgs e)
        {
            if (!txtDiscount.Text.Trim().Contains("%"))
            {
                var total = double.Parse(txtDiscount.Text.Trim().Replace(",", "").Replace(" ", "").Replace("%", "").Equals("") ? "0" : txtDiscount.Text.Trim().Replace(",", "").Replace(" ", "").Replace("%", ""));
                txtDiscount.Text = total > 999 ? string.Format("{0:0,0}", total) : total.ToString();
            }
        }

        private void txtCustomePay_MouseLeave(object sender, EventArgs e)
        {
            var total = double.Parse(txtCustomePay.Text.Trim().Replace(",", "").Equals("") ? "0" : txtCustomePay.Text.Trim().Replace(",", ""));
            txtCustomePay.Text = total > 999 ? string.Format("{0:0,0}", total) : total.ToString();
        }

        private void btnHelp_Click(object sender, EventArgs e)
        {
            cbMember.DataSource = from x in db.tMembers
                                  where x.BranchTypeId == WindowsFormsApplication3.Form1.branch_type_id
                                  && x.Status == 1
                                  select new { x.Id, Name = x.Phone + " - " + x.MemberName };
            cbMember.SelectedItem = null;

            var h = new frmMemberSearch();
            h.ShowDialog();
            if (memberId > 0)
            {
                cbMember.SelectedValue = memberId;
            }
        }

        private void cbMember_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                memberId = 0;
                if (cbMember.SelectedItem != null)
                {
                    memberId = int.Parse(cbMember.SelectedValue.ToString());
                    //load chiet khau khach hang
                }
            }
        }

        private void txtVoucher_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                var t = db.sp_checkDiscount(WindowsFormsApplication3.Form1.branch_type_id.ToString(), txtVoucher.Text.Trim()).ToList();
                if (t.Count() > 0)
                {
                    var id = t.FirstOrDefault().Id.ToString();
                    var code = t.FirstOrDefault().DiscountCode;
                    var min = t.FirstOrDefault().OrderMinValue;
                    var type = t.FirstOrDefault().DiscountType.Value;
                    var values = t.FirstOrDefault().DiscountValue.Value;
                    var total_cur = double.Parse(txtTotalPrice.Text.Trim().Replace(",", "").Equals("") ? "0" : txtTotalPrice.Text.Trim().Replace(",", ""));
                    if (total_cur > values)
                    {
                        discountId = id;
                        discountCode = code;

                        if (type == 1)//giam gia tien
                        {
                            txtDiscount.Text = string.Format("{0:0,0}", values);
                            txtDiscount_KeyUp(sender, e);
                        }
                        else if (type == 2)//giam gia phan tram
                        {
                            txtDiscount.Text = values.ToString() + "%";
                            txtDiscount_KeyUp(sender, e);
                        }
                        else
                        {

                            discountId = "";
                            discountCode = "";

                            txtVoucher.Text = "";
                            txtDiscount.Text = "";
                            txtDiscount_KeyUp(sender, e);
                        }
                    }
                    else
                    {
                        discountId = "";
                        discountCode = "";
                        txtVoucher.Text = "";
                        txtDiscount.Text = "";
                        txtDiscount_KeyUp(sender, e);
                        MessageBox.Show("Giá trị voucher chỉ áp dụng cho giá trị hóa đơn >= " + string.Format("{0:0,0}", values), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
                else
                {
                    discountId = "";
                    discountCode = "";
                    
                    txtDiscount.Text = "";
                    txtDiscount_KeyUp(sender, e);

                    if (txtVoucher.Text.Trim()!="")
                        MessageBox.Show("Mã Voucher không tồn tại hoặc không nằm trong thời gian áp dụng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                    txtVoucher.Text = "";
                }
            }
        }

        private void _CreateReceipt(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        {
            double total = 0;
            double sale = 0, custome_pay = 0, custome_return = 0;
            string code_bill = "", created = "", total_price = "", money = "", doitra = "", branchtype = "", address = "", phone = "", website = "", facebook = "", type = "", membername = "", memberphone = "", createdby = "", score = "";
            var s = db.sp_getBillById(stockcode);
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

                    graphic.DrawString("Địa chỉ: " + address, new Font("Tahoma", 7), new SolidBrush(Color.Black), startX, startY + 30);

                    offset = offset + (int)FontHeight;
                    graphic.DrawString(phone, new Font("Tahoma", 7), new SolidBrush(Color.Black), startX, startY + offset - 5);

                    offset = offset + (int)FontHeight;
                    graphic.DrawString("Website: " + website, new Font("Tahoma", 7), new SolidBrush(Color.Black), startX, startY + offset);

                    offset = offset + (int)FontHeight + 5;
                    graphic.DrawString("Facebook: " + facebook, new Font("Tahoma", 7), new SolidBrush(Color.Black), startX, startY + offset);

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
                graphic.DrawString((i + 1).ToString(), new Font("Tahoma", 6, FontStyle.Bold), new SolidBrush(Color.Black), startX + 5, startY + offset);
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
            graphic.DrawString((total <= 0 ? "0 đ" : string.Format("{0:0,0 đ}", total)), font, new SolidBrush(Color.Black), startX + 125, startY + offset);

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
    }
}
