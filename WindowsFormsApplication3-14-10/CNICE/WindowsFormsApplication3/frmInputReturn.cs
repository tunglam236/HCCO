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
    public partial class frmInputReturn : Office2007Form
    {
        public frmInputReturn()
        {
            InitializeComponent();
        }
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        private string id_current = "0";
        private int quantity_current = 0;
        private DataTable dtTemp = new DataTable();
        private void frmInputReturn_Load(object sender, EventArgs e)
        {
            stt.Text = "";
            txtOutputCode.Focus();
        }

        private void txtOutputCode_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                if (txtOutputCode.Text.Trim() != "")
                {
                    dtTemp.Rows.Clear();
                    if (dtTemp.Columns.Count == 0)
                    {
                        dtTemp.Columns.Add("ProductId", typeof(string));
                        dtTemp.PrimaryKey = new DataColumn[] { dtTemp.Columns[0] };
                        dtTemp.Columns.Add("CodeId", typeof(string));
                        dtTemp.Columns.Add("ProductCode", typeof(string));
                        dtTemp.Columns.Add("ProductName", typeof(string));
                        dtTemp.Columns.Add("BrandName", typeof(string));
                        dtTemp.Columns.Add("CountryName", typeof(string));
                        dtTemp.Columns.Add("UnitName", typeof(string));
                        dtTemp.Columns.Add("CapacityName", typeof(string));
                        dtTemp.Columns.Add("Quantity", typeof(int));
                        dtTemp.Columns.Add("Price", typeof(string));
                        dtTemp.Columns.Add("DiscountPercent", typeof(string));
                        dtTemp.Columns.Add("Discount", typeof(float));
                        dtTemp.Columns.Add("Total", typeof(float));
                        dtTemp.Columns.Add("IsCombo", typeof(string));
                        dtTemp.Columns.Add("Note", typeof(string));
                    }
                    var sp = db.sp_getBillCode_ReturnCnice(WindowsFormsApplication3.Form1.branch_id.ToString(), txtOutputCode.Text.Trim());
                    int i = 0;
                    foreach (var d in sp.ToList())
                    {
                        if (i == 0)
                        {
                            stt.Text = "Tên khách hàng: " + d.MemberName.Replace("#"," - ") + " - Chi nhánh xuất: " + d.Branch + " - Ngày xuất: " + d.CreateAt;
                        }
                        DataRow dr = dtTemp.NewRow();
                        dr[0] = d.ProductId.ToString();
                        dr[1] = d.CodeId;
                        dr[2] = d.ProductCode;
                        dr[3] = d.ProductName;
                        dr[4] = d.BrandName;
                        dr[5] = d.CountryName;
                        dr[6] = d.UnitName;
                        dr[7] = d.CapacityName;
                        dr[8] = d.Quantity.ToString();
                        dr[9] = string.Format("{0:0,0}", d.Price);
                        dr[10] = d.DiscountPercent.ToString() + "%";
                        dr[11] = d.Discount.ToString();
                        dr[12] = string.Format("{0:0,0}", d.Total);
                        dr[13] = d.IsCombo.ToString();
                        dr[14] = d.Note.ToString();
                        dtTemp.Rows.Add(dr);
                        i++;
                    }

                    dgvProductNew.DataSource = dtTemp;
                    txtProductCode.Focus();

                    if(dtTemp.Rows.Count==0)
                        MessageBox.Show("Không tìm thấy số hóa đơn, kiểm tra lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void txtProductCode_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                insertProduct();
            }
        }
        
        
        private void insertProduct()
        {
            if (txtProductCode.Text.Trim().Equals(""))
                MessageBox.Show("Nhập mã sản phẩm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                try
                {
                    var d = db.sp_Product_GetDetailByCodeIdCnice(WindowsFormsApplication3.Form1.branch_type_id, WindowsFormsApplication3.Form1.branch_id, txtProductCode.Text.Trim(), 1).ToList();
                    if (d.Count() > 0)
                    {
                        if (d.FirstOrDefault().Price > 0)
                        {
                            if (dtTemp.Columns.Count == 0)
                            {
                                dtTemp.Columns.Add("ProductId", typeof(string));
                                dtTemp.PrimaryKey = new DataColumn[] { dtTemp.Columns[0] };
                                dtTemp.Columns.Add("CodeId", typeof(string));
                                dtTemp.Columns.Add("ProductCode", typeof(string));
                                dtTemp.Columns.Add("ProductName", typeof(string));
                                dtTemp.Columns.Add("BrandName", typeof(string));
                                dtTemp.Columns.Add("CountryName", typeof(string));
                                dtTemp.Columns.Add("UnitName", typeof(string));
                                dtTemp.Columns.Add("CapacityName", typeof(string));
                                dtTemp.Columns.Add("Quantity", typeof(int));
                                dtTemp.Columns.Add("Price", typeof(string));
                                dtTemp.Columns.Add("DiscountPercent", typeof(string));
                                dtTemp.Columns.Add("Discount", typeof(float));
                                dtTemp.Columns.Add("Total", typeof(float));
                                dtTemp.Columns.Add("IsCombo", typeof(string));
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
                            DataRow dr = dtTemp.NewRow();
                            dr[0] = d.FirstOrDefault().Id.ToString();
                            dr[1] = d.FirstOrDefault().ProductCode;
                            dr[2] = d.FirstOrDefault().Code;
                            dr[3] = d.FirstOrDefault().ProductName;
                            dr[4] = d.FirstOrDefault().BrandName;
                            dr[5] = d.FirstOrDefault().CountryName;
                            dr[6] = d.FirstOrDefault().UnitName;
                            dr[7] = d.FirstOrDefault().CapacityName;
                            dr[8] = currrent_quantity + 1;
                            dr[9] = string.Format("{0:0,0}", d.FirstOrDefault().Price);
                            dr[10] = "";
                            dr[11] = string.Format("{0:0,0}", d.FirstOrDefault().Discount);
                            dr[12] = string.Format("{0:0,0}", (currrent_quantity + 1)* d.FirstOrDefault().Price- d.FirstOrDefault().Discount);
                            dr[13] = d.FirstOrDefault().IsCombo.ToString();
                            dr[14] = "";

                            dtTemp.Rows.Add(dr);

                            dgvProductNew.DataSource = dtTemp;

                            if (dgvProductNew.Rows.Count > 0)
                            {
                                btnSave.Enabled = true;
                                btnCancel.Enabled = true;
                                txtProductCode.Text = "";
                                txtProductCode.Focus();
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

        private void dgvProductNew_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            #region Cell_Click
            try
            {
                if (dgvProductNew.Rows.Count != -1 && e.RowIndex != -1)
                {
                    btnDel.Enabled = true;

                    var id = dgvProductNew[0, e.RowIndex].Value.ToString();
                    id_current = id;
                }
            }
            catch (Exception a)
            {
                MessageBox.Show(a.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            #endregion
        }

        private void dgvProductNew_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                if (dgvProductNew.CurrentCell.ColumnIndex == 8)
                {
                    dgvProductNew.BeginEdit(true);
                }
            }
        }

        private void dgvProductNew_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            var id = dgvProductNew.Rows[e.RowIndex].Cells[0].Value;
            var code = dgvProductNew.Rows[e.RowIndex].Cells[1].Value;
            var v = dgvProductNew.Rows[e.RowIndex].Cells[e.ColumnIndex].Value;

            try
            {
                var d = db.sp_Product_GetDetailByCodeIdCnice(WindowsFormsApplication3.Form1.branch_type_id, WindowsFormsApplication3.Form1.branch_id, code.ToString(), int.Parse(v.ToString())).ToList();

                DataRow r = dtTemp.Rows.Find(id.ToString());
                if (r != null && !r.IsNull("ProductId"))
                {
                    r["Quantity"] = int.Parse(v.ToString());
                    r["Total"] = string.Format("{0:0,0}", int.Parse(v.ToString()) * double.Parse(r["Price"].ToString()));
                }
                dgvProductNew.DataSource = dtTemp;
            }
            catch (Exception ax)
            {
                dgvProductNew.Rows[e.RowIndex].Cells[e.ColumnIndex].Value = quantity_current.ToString();
                MessageBox.Show(ax.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnDel_Click(object sender, EventArgs e)
        {
            if (dtTemp.Rows.Count > 0)
            {
                DataRow r = dtTemp.Rows.Find(id_current);
                if (r != null && !r.IsNull("ProductId"))
                {
                    dtTemp.Rows.Remove(r);
                }

                dgvProductNew.DataSource = dtTemp;

                if (dtTemp.Rows.Count > 0)
                {
                   
                    btnSave.Enabled = true;
                    btnCancel.Enabled = true;
                    txtProductCode.Text = "";
                    txtProductCode.Focus();
                }
            }
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            txtProductCode.Text = "";
            btnDel.Enabled = false;
        }

        private void btnInsert_Click(object sender, EventArgs e)
        {
            insertProduct();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtOutputCode.Text.Trim().Equals(""))
                MessageBox.Show("Nhập mã phiếu xuất", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else if (dtTemp.Rows.Count == 0)
                MessageBox.Show("Không có dữ liệu nào để lưu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                if (MessageBox.Show("Bạn chắc chắc muốn lưu phiếu nhập này ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    var codeId = db.sp_StockInput_GetCodeId().FirstOrDefault().CodeId.Value;
                    object total_price = dtTemp.Compute("SUM(Total)", "");

                    var p = new tStockInput();
                    p.StockInputCode = "HBTL" + DateTime.Now.ToString("ddMMyy") + (codeId + 1).ToString("D3");
                    p.BranchTypeId = WindowsFormsApplication3.Form1.branch_type_id;
                    p.BranchId = WindowsFormsApplication3.Form1.branch_id;
                    p.StockOutputCode = txtOutputCode.Text.Trim().ToUpper();
                    p.InputType = 0;//nhap tra lai
                    p.TotalPrice = double.Parse(total_price.ToString());
                    p.Note = txtNote.Text.Trim();
                    p.Status = 1;
                    p.CreateAt = DateTime.Now;
                    p.CreateBy = WindowsFormsApplication3.Form1.user_id;

                    db.tStockInputs.InsertOnSubmit(p);
                    db.SubmitChanges();

                    for (int i = 0; i < dtTemp.Rows.Count; i++)
                    {
                        if (int.Parse(dtTemp.Rows[i]["IsCombo"].ToString()) == 0)
                        {
                            var detail = new tStockInputDetail();
                            detail.StockInputId = p.Id;
                            detail.ProductId = int.Parse(dtTemp.Rows[i]["ProductId"].ToString());
                            detail.Quantity = int.Parse(dtTemp.Rows[i]["Quantity"].ToString());
                            detail.Price = double.Parse(dtTemp.Rows[i]["Price"].ToString());
                            detail.IsCombo = false;
                            detail.ComboId = 0;
                            detail.ComboQuantity = 0;
                            db.tStockInputDetails.InsertOnSubmit(detail);


                            var ton = new tStockInventory();
                            ton.BranchTypeId = WindowsFormsApplication3.Form1.branch_type_id;
                            ton.BranchId = WindowsFormsApplication3.Form1.branch_id;
                            ton.ProductId = int.Parse(dtTemp.Rows[i]["ProductId"].ToString());
                            ton.QuantityIn = byte.Parse(dtTemp.Rows[i]["Quantity"].ToString());
                            ton.CreateAt = DateTime.Now;
                            db.tStockInventories.InsertOnSubmit(ton);
                        }
                        else
                        {
                            //is combo, foreach product in combo
                            var pd = from x in db.tCombos
                                     from y in db.tComboDetails
                                     where x.Id == y.ComboId && x.Id == Int64.Parse(dtTemp.Rows[i]["IsCombo"].ToString())
                                     select new { x.Id, y.ProductId, y.Quantity };
                            var si = 0;
                            foreach (var item in pd.ToList())
                            {
                                var detail = new tStockInputDetail();
                                detail.StockInputId = p.Id;
                                detail.ProductId = item.ProductId.Value;
                                detail.Quantity = int.Parse(dtTemp.Rows[i]["Quantity"].ToString()) * item.Quantity.Value;
                                if (si == 0)
                                {
                                    detail.Price = double.Parse(dtTemp.Rows[i]["Price"].ToString());
                                }
                                else
                                {
                                    detail.Price = 0;
                                }
                                detail.IsCombo = true;
                                detail.ComboId = item.Id;
                                detail.ComboQuantity = byte.Parse(dtTemp.Rows[i]["Quantity"].ToString());
                                db.tStockInputDetails.InsertOnSubmit(detail);
                                si++;

                                var ton = new tStockInventory();
                                ton.BranchTypeId = WindowsFormsApplication3.Form1.branch_type_id;
                                ton.BranchId = WindowsFormsApplication3.Form1.branch_id;
                                ton.ProductId = item.ProductId.Value;
                                ton.QuantityIn = byte.Parse((int.Parse(dtTemp.Rows[i]["Quantity"].ToString()) * item.Quantity.Value).ToString());
                                ton.CreateAt = DateTime.Now;
                                db.tStockInventories.InsertOnSubmit(ton);
                            }
                        }
                    }
                    db.SubmitChanges();
                    dtTemp.Rows.Clear();
                    txtNote.Text = "";
                    txtOutputCode.Text = "";
                    txtProductCode.Text = "";
                    MessageBox.Show("Lưu thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                }
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Phiếu này sẽ không được lưu, bạn chắc chắn muốn hủy không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void dgvProductNew_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            if (dgvProductNew.CurrentCell.ColumnIndex == 8)
            {
                var v = dgvProductNew.Rows[e.RowIndex].Cells[e.ColumnIndex].Value;
                quantity_current = int.Parse(v.ToString());
            }
        }
    }
}
