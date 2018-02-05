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
    public partial class frmOutputStockInternal : Office2007Form
    {
        public frmOutputStockInternal()
        {
            InitializeComponent();
        }

        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        private string id_current = "0", id_pro = "0";
        private int quantity_current = 0;
        private DataTable dtTemp = new DataTable();
        private void resetControl()
        {
            cboBranch.DataSource = from x in db.tBranches
                                   where x.Status == 1 && x.Id != WindowsFormsApplication3.Form1.branch_id
                                   && x.BranchTypeId == WindowsFormsApplication3.Form1.branch_type_id
                                   select new { x.BranchName, x.Id };

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
            txtCreateDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            var codeId = db.sp_StockOutput_GetCodeId().FirstOrDefault().CodeId.Value;
            stt = codeId + 1;
            txtStockCode.Text = "XKDC"+DateTime.Now.ToString("ddMMyy") + stt.ToString("D3");
            txtProductCode.Focus();
            id_current = "0";
            id_pro = "0";
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
                                dtTemp.Columns.Add("Code", typeof(string));
                                dtTemp.Columns.Add("ProductName", typeof(string));
                                dtTemp.Columns.Add("Quantity", typeof(int));
                                dtTemp.Columns.Add("Price", typeof(string));
                                dtTemp.Columns.Add("Total", typeof(double));
                                dtTemp.Columns.Add("IsCombo", typeof(int));
                                dtTemp.Columns.Add("ToTalPrice", typeof(string));
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
                            dr[4] = currrent_quantity + 1;
                            dr[5] = string.Format("{0:0,0}", d.FirstOrDefault().Price);
                            dr[6] = (currrent_quantity + 1) * d.FirstOrDefault().Price;
                            dr[7] = d.FirstOrDefault().IsCombo;
                            dr[8] = string.Format("{0:0,0}", (currrent_quantity + 1) * d.FirstOrDefault().Price);
                            dtTemp.Rows.Add(dr);

                            dgvTemp.DataSource = dtTemp;

                            if (dtTemp.Rows.Count > 0)
                            {
                                object total_price = dtTemp.Compute("SUM(Total)", "");

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
        private void frmOutputStockInternal_Load(object sender, EventArgs e)
        {
            resetControl();
            txtProductCode.Focus();
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
        private void btnInsert_Click(object sender, EventArgs e)
        {
            insertProduct();
        }

        private void btnRefesh_Click(object sender, EventArgs e)
        {
            txtProductCode.Text = "";
            btnInsert.Enabled = true;
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            insertProduct();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (dtTemp.Rows.Count > 0)
            {
                DataRow r = dtTemp.Rows.Find(id_pro);
                if (r != null && !r.IsNull("ProductId"))
                {
                    dtTemp.Rows.Remove(r);
                }
                dgvTemp.DataSource = dtTemp;

                if (dtTemp.Rows.Count > 0)
                {
                    btnSave.Enabled = true;
                    btnCancel.Enabled = true;
                    txtProductCode.Text = "";
                    txtProductCode.Focus();
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
                        object total_price = dtTemp.Compute("SUM(Total)", "");
                        var codeId = db.sp_StockOutput_GetCodeId().FirstOrDefault().CodeId.Value;

                        var p = new tStockOutput();
                        p.StockCode = "XKDC"+DateTime.Now.ToString("ddMMyy") + (codeId + 1).ToString("D3");
                        p.BranchTypeId = WindowsFormsApplication3.Form1.branch_type_id;
                        p.BranchId = WindowsFormsApplication3.Form1.branch_id;
                        p.OutputType = 2;//xuat noi bo
                        p.Note = txtNote.Text.Trim();
                        p.BranchToId = int.Parse(cboBranch.SelectedValue.ToString());
                        p.TotalPrice = p.Total = double.Parse(total_price.ToString());
                        p.Status = 2;
                        p.CreateAt = DateTime.Now;
                        p.CreateBy = WindowsFormsApplication3.Form1.user_id;
                        db.tStockOutputs.InsertOnSubmit(p);
                        db.SubmitChanges();

                        for (int i = 0; i < dtTemp.Rows.Count; i++)
                        {
                            if (int.Parse(dtTemp.Rows[i]["IsCombo"].ToString()) == 0)
                            {
                                var detail = new tStockOutputDetail();
                                detail.StockOutputId = p.Id;
                                detail.ProductId = int.Parse(dtTemp.Rows[i]["ProductId"].ToString());
                                detail.Quantity = int.Parse(dtTemp.Rows[i]["Quantity"].ToString());
                                detail.Price = double.Parse(dtTemp.Rows[i]["Price"].ToString().Replace(",",""));
                                detail.IsCombo = false;
                                detail.ComboId = 0;
                                detail.ComboQuantity = 0;
                                db.tStockOutputDetails.InsertOnSubmit(detail);

                                var ton = new tStockInventory();
                                ton.BranchTypeId = WindowsFormsApplication3.Form1.branch_type_id;
                                ton.BranchId = WindowsFormsApplication3.Form1.branch_id;
                                ton.ProductId = int.Parse(dtTemp.Rows[i]["ProductId"].ToString());
                                ton.QuantityOut = byte.Parse(dtTemp.Rows[i]["Quantity"].ToString());
                                ton.CreateAt = DateTime.Now;
                                ton.Status = 3;//1//xuat ban//2//qua tang//3//xuat dieu chuyen
                                db.tStockInventories.InsertOnSubmit(ton);
                            }
                            else
                            {
                                //is combo, foreach product in combo
                                var pd = from x in db.tCombos
                                         from y in db.tComboDetails
                                         where x.Id == y.ComboId && x.ComboId == dtTemp.Rows[i]["ProductId"].ToString()
                                         select new { x.Id, y.ProductId, y.Quantity };
                                foreach (var item in pd.ToList())
                                {
                                    var detail = new tStockOutputDetail();
                                    detail.StockOutputId = p.Id;
                                    detail.ProductId = item.ProductId.Value;
                                    detail.Quantity = int.Parse(dtTemp.Rows[i]["Quantity"].ToString()) * item.Quantity.Value;
                                    detail.IsCombo = true;
                                    detail.ComboId = item.Id;
                                    detail.ComboQuantity = byte.Parse(dtTemp.Rows[i]["Quantity"].ToString());
                                    db.tStockOutputDetails.InsertOnSubmit(detail);

                                    var ton = new tStockInventory();
                                    ton.BranchTypeId = WindowsFormsApplication3.Form1.branch_type_id;
                                    ton.BranchId = WindowsFormsApplication3.Form1.branch_id;
                                    ton.ProductId = item.ProductId.Value;
                                    ton.QuantityOut = byte.Parse((int.Parse(dtTemp.Rows[i]["Quantity"].ToString()) * item.Quantity.Value).ToString());
                                    ton.CreateAt = DateTime.Now;
                                    ton.Status = 3;//1//xuat ban//2//qua tang//3//xuat dieu chuyen
                                    db.tStockInventories.InsertOnSubmit(ton);
                                }
                            }
                        }
                        db.SubmitChanges();
                        dtTemp.Rows.Clear();
                        resetControl();
                        MessageBox.Show("Lưu thành công, đã gửi phiếu xuất tới chi nhánh", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
            if (MessageBox.Show("Phiếu xuất này sẽ không được lưu, bạn chắc chắn muốn hủy không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                dtTemp.Rows.Clear();
                resetControl();
            }
        }

        private void txtQuantity_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && (!char.IsControl(e.KeyChar)))
            {
                e.Handled = true;
            }
        }

        private void dgvTemp_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                if (dgvTemp.CurrentCell.ColumnIndex == 4)
                {
                    dgvTemp.BeginEdit(true);
                }
            }
        }

        private void dgvTemp_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            var id = dgvTemp.Rows[e.RowIndex].Cells[0].Value;
            var code = dgvTemp.Rows[e.RowIndex].Cells[1].Value;
            var v = dgvTemp.Rows[e.RowIndex].Cells[e.ColumnIndex].Value;
            try
            {
                var d = db.sp_Product_GetDetailByCodeId(WindowsFormsApplication3.Form1.branch_type_id, WindowsFormsApplication3.Form1.branch_id, code.ToString(), int.Parse(v.ToString())).ToList();

                DataRow r = dtTemp.Rows.Find(id);
                if (r != null && !r.IsNull("ProductId"))
                {
                    r["Quantity"] = int.Parse(v.ToString());
                    r["Total"] = int.Parse(v.ToString()) * double.Parse(r["Price"].ToString());
                    r["TotalPrice"] = string.Format("{0:0,0}", int.Parse(v.ToString()) * double.Parse(r["Price"].ToString()));
                }
                dgvTemp.DataSource = dtTemp;
            }
            catch (Exception ax)
            {
                dgvTemp.Rows[e.RowIndex].Cells[e.ColumnIndex].Value = quantity_current.ToString();
                MessageBox.Show(ax.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void dgvTemp_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            #region Cell_Click
            try
            {
                if (dgvTemp.Rows.Count != -1 && e.RowIndex != -1)
                {
                    btnDel.Enabled = true;
                    var id = dgvTemp.Rows[e.RowIndex].Cells["Quantity"].Value.ToString();
                    var pro_id = dgvTemp.Rows[e.RowIndex].Cells["ProductId"].Value.ToString();
                    id_current = id;
                    id_pro = pro_id;

                    //var id = dgvTemp[0, e.RowIndex].Value.ToString();
                    //id_current = id;
                }
            }
            catch (Exception a)
            {
                MessageBox.Show(a.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            #endregion
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

        private void btnList_Click(object sender, EventArgs e)
        {
            var f = new frmSummaryStockOutput();
            f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
            f.Show();
        }

        private void dgvTemp_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            var v = dgvTemp.Rows[e.RowIndex].Cells[e.ColumnIndex].Value;
            quantity_current = int.Parse(v.ToString());
        }

    }
}
