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
    public partial class frmInputStock : Office2007Form
    {
        public frmInputStock()
        {
            InitializeComponent();
        }
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        private DataTable dtTemp = new DataTable();
        private void frmInputStock_Load(object sender, EventArgs e)
        {
            resetControl();
            txtStockOutputCode.Focus();
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
            txtStockOutputCode.Focus();
            var stt = 1;
            txtCreateDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            var codeId = db.sp_StockInput_GetCodeId().FirstOrDefault().CodeId.Value;
            stt = codeId + 1;
            txtStockInputCode.Text = "NKDC"+DateTime.Now.ToString("ddMMyy") + stt.ToString("D3");
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtStockOutputCode.Text.Trim().Equals(""))
                MessageBox.Show("Nhập mã phiếu xuất nội bộ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else if (dtTemp.Rows.Count == 0)
                MessageBox.Show("Không có dữ liệu nào để lưu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                if (MessageBox.Show("Bạn chắc chắn muốn lưu phiếu nhập này ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    var status = db.sp_StockInput_InsertData(txtStockInputCode.Text.Trim(), WindowsFormsApplication3.Form1.branch_type_id,
                        WindowsFormsApplication3.Form1.branch_id, int.Parse(dtTemp.Rows[0]["BranchId"].ToString()),
                        txtStockOutputCode.Text.Trim(), txtNote.Text.Trim(), WindowsFormsApplication3.Form1.user_id).FirstOrDefault().stt;
                    if (status == 1)
                    {
                        resetControl();
                        dtTemp.Rows.Clear();
                        dgvTemp.DataSource = dtTemp;
                        lbBranch.Text = "Chi nhánh:";
                        lbCreateAt.Text = "Ngày xuất:";
                        MessageBox.Show("Đã lưu phiếu nhập thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    else
                        MessageBox.Show("Có lỗi xảy ra khi lưu phiếu nhập, vui lòng thử lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        
        private void txtStockOutputCode_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                var d = db.sp_StockInput_GetCnice(WindowsFormsApplication3.Form1.branch_id, WindowsFormsApplication3.Form1.branch_type_id, txtStockOutputCode.Text.Trim());
                dtTemp.Rows.Clear();
                if (dtTemp.Columns.Count == 0)
                {
                    dtTemp.Columns.Add("Id", typeof(int));
                    dtTemp.Columns.Add("Note", typeof(string));
                    dtTemp.Columns.Add("CreateAt", typeof(string));
                    dtTemp.Columns.Add("BranchId", typeof(int));
                    dtTemp.Columns.Add("BranchName", typeof(string));
                    dtTemp.Columns.Add("ProductId", typeof(int));
                    dtTemp.Columns.Add("CodeId", typeof(string));
                    dtTemp.Columns.Add("ProductCode", typeof(string));
                    dtTemp.Columns.Add("ProductName", typeof(string));
                    dtTemp.Columns.Add("BrandName", typeof(string));
                    dtTemp.Columns.Add("CountryName", typeof(string));
                    dtTemp.Columns.Add("UnitName", typeof(string));
                    dtTemp.Columns.Add("CapacityName", typeof(string));
                    dtTemp.Columns.Add("Quantity", typeof(int));
                }
                foreach (var item in d.ToList())
                {
                    DataRow dr = dtTemp.NewRow();
                    dr[0] = item.Id;
                    dr[1] = item.Note;
                    dr[2] = item.CreateAt.Value.ToString("dd/MM/yyyy");
                    dr[3] = item.BranchId;
                    dr[4] = item.BranchName;
                    dr[5] = item.ProductId;
                    dr[6] = item.CodeId;
                    dr[7] = item.ProductCode;
                    dr[8] = item.ProductName;
                    dr[9] = item.BrandName;
                    dr[10] = item.CountryName;
                    dr[11] = item.UnitName;
                    dr[12] = item.CapacityName;
                    dr[13] = item.Quantity;
                    dtTemp.Rows.Add(dr);
                }
                dgvTemp.DataSource = dtTemp;
                if (dtTemp.Rows.Count > 0)
                {
                    lbBranch.Text = "Chi nhánh xuất: " + dtTemp.Rows[0]["BranchName"].ToString() + " | ";
                    lbCreateAt.Text = "Ngày xuất: " + dtTemp.Rows[0]["CreateAt"].ToString() + " | ";
                }
                else
                {
                    lbBranch.Text = "Chi nhánh xuất:  | ";
                    lbCreateAt.Text = "Ngày xuất: | ";
                    MessageBox.Show("Mã phiếu xuất không tồn tại hoặc đã được nhập. Vui lòng kiểm tra lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnList_Click(object sender, EventArgs e)
        {
            var f = new frmSummaryStockInput();
            f.MdiParent = WindowsFormsApplication3.Form1.ActiveForm;
            f.Show();
        }
    }
}
