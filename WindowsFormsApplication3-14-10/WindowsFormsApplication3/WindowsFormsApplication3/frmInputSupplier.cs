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
    public partial class frmInputSupplier : Office2007Form
    {
        public frmInputSupplier()
        {
            InitializeComponent();
        }

        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        private DataTable dtTemp = new DataTable();
        private string id_current = "0";
        private int quantity_current = 0;
        private void frmInputSupplier_Load(object sender, EventArgs e)
        {
            cboSupplier.DataSource = from x in db.tSuppliers
                                   where x.Status == 1
                                     select new { SupplierName= x.SupplierName+" - "+Convert.ToString(x.Address.ToString()), x.Id };
            

            resetControl();
            txtProductCode.Focus();
        }
        private void resetControl()
        {
            foreach (Control ctr in grTTK.Controls)
            {
                if (ctr is TextBox)
                {
                    ctr.Text = "";
                }
            }
            
            var stt = 1;
            txtCreateAt.Text = DateTime.Now.ToString("dd/MM/yyyy");
            var codeId = db.sp_StockInput_GetCodeId().FirstOrDefault().CodeId.Value;
            stt = codeId + 1;
            txtStockCode.Text = "PNHH" + DateTime.Now.ToString("ddMMyy") + stt.ToString("D3");
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
            if (dtTemp.Rows.Count > 0)
            {
                DataRow r = dtTemp.Rows.Find(id_current);
                if (r != null && !r.IsNull("ProductId"))
                {
                    dtTemp.Rows.Remove(r);
                }

                dgvGrid.DataSource = dtTemp;

                btnSave.Enabled = true;
                btnCancel.Enabled = true;
                txtProductCode.Text = "";
                txtProductCode.Focus();
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Bạn chắc chắc muốn lưu phiếu nhập này ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    if (dtTemp.Rows.Count > 0)
                    {
                        var codeId = db.sp_StockInput_GetCodeId().FirstOrDefault().CodeId.Value;

                        var p = new tStockInput();
                        p.StockInputCode = "PN" + DateTime.Now.ToString("ddMMyy") + (codeId + 1).ToString("D3");
                        p.BranchTypeId = WindowsFormsApplication3.Form1.branch_type_id;
                        p.BranchId = WindowsFormsApplication3.Form1.branch_id;
                        p.SupplierId = int.Parse(cboSupplier.SelectedValue.ToString());
                        p.InputType = 1;//nhap tu ncc
                        p.TotalPrice = 0;
                        p.Note = txtNote.Text.Trim();
                        p.Status = 1;
                        p.CreateAt = DateTime.Now;
                        p.CreateBy = WindowsFormsApplication3.Form1.user_id;
                        
                        db.tStockInputs.InsertOnSubmit(p);
                        db.SubmitChanges();

                        for (int i = 0; i < dtTemp.Rows.Count; i++)
                        {
                            var detail = new tStockInputDetail();
                            detail.StockInputId = p.Id;
                            detail.ProductId = int.Parse(dtTemp.Rows[i]["ProductId"].ToString());
                            detail.Quantity = int.Parse(dtTemp.Rows[i]["Quantity"].ToString());
                            detail.Price = 0;
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
                        db.SubmitChanges();
                        dtTemp.Rows.Clear();
                        resetControl();
                        MessageBox.Show("Lưu thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        
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
                if (MessageBox.Show("Phiếu nhập này sẽ không được lưu, bạn chắc chắn muốn hủy không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    dtTemp.Rows.Clear();
                    resetControl();
                }
            }
            else
                resetControl();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (dtTemp.Rows.Count > 0)
            {
                if (MessageBox.Show("Phiếu nhập này sẽ không được lưu, bạn chắc chắn muốn hủy không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    this.Close();
                }
            }
            else
                this.Close();
        }

        private void btnList_Click(object sender, EventArgs e)
        {
            var f = new frmSummaryStockInput();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
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
        private void insertProduct()
        {
            if (txtProductCode.Text.Trim().Equals(""))
                MessageBox.Show("Nhập mã sản phẩm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                try
                {
                    var d = from x in db.tProducts where x.CodeId == txtProductCode.Text.Trim()
                            && x.BranchTypeId==WindowsFormsApplication3.Form1.branch_type_id
                            select x;
                    if (d.Count() > 0)
                    {
                        if (dtTemp.Columns.Count == 0)
                        {
                            dtTemp.Columns.Add("ProductId", typeof(string));
                            dtTemp.PrimaryKey = new DataColumn[] { dtTemp.Columns[0] };
                            dtTemp.Columns.Add("Code", typeof(string));
                            dtTemp.Columns.Add("ProductCode", typeof(string));
                            dtTemp.Columns.Add("ProductName", typeof(string));
                            dtTemp.Columns.Add("Quantity", typeof(int));
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
                        dr[2] = d.FirstOrDefault().CodeId;
                        dr[3] = d.FirstOrDefault().ProductName;
                        dr[4] = currrent_quantity + 1;
                        dtTemp.Rows.Add(dr);

                        dgvGrid.DataSource = dtTemp;

                        if (dtTemp.Rows.Count > 0)
                        {
                            btnSave.Enabled = true;
                            btnCancel.Enabled = true;
                            txtProductCode.Text = "";
                            txtProductCode.Focus();
                        }
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

        private void dgvGrid_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            #region Cell_Click
            try
            {
                if (dgvGrid.Rows.Count != -1 && e.RowIndex != -1)
                {
                    btnDel.Enabled = true;

                    var id = dgvGrid[0, e.RowIndex].Value.ToString();
                    id_current = id;
                }
            }
            catch (Exception a)
            {
                MessageBox.Show(a.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            #endregion
        }

        private void dgvGrid_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                if (dgvGrid.CurrentCell.ColumnIndex == 3)
                {
                    dgvGrid.BeginEdit(true);
                }
            }
        }

        private void dgvGrid_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            var id = dgvGrid.Rows[e.RowIndex].Cells[0].Value;
            var code = dgvGrid.Rows[e.RowIndex].Cells[1].Value;
            var quantity = dgvGrid.Rows[e.RowIndex].Cells[3].Value;
            
            try
            {
                if (int.Parse(quantity.ToString()) <= 0)
                {
                    DataRow r = dtTemp.Rows.Find(id_current);
                    if (r != null && !r.IsNull("ProductId"))
                    {
                        dtTemp.Rows.Remove(r);
                    }
                }
                else
                {
                    
                    DataRow r = dtTemp.Rows.Find(id.ToString());
                    if (r != null && !r.IsNull("ProductId"))
                    {
                        r["Quantity"] = int.Parse(quantity.ToString());
                    }
                }

                dgvGrid.DataSource = dtTemp;
            }
            catch (Exception ax)
            {
                dgvGrid.Rows[e.RowIndex].Cells[e.ColumnIndex].Value = quantity_current.ToString();
                MessageBox.Show(ax.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void dgvGrid_CellBeginEdit(object sender, DataGridViewCellCancelEventArgs e)
        {
            var v = dgvGrid.Rows[e.RowIndex].Cells[e.ColumnIndex].Value;
            quantity_current = int.Parse(v.ToString());
        }
    }
}
