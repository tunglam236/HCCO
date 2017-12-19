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
    public partial class frmProduct : Office2007Form
    {
        public frmProduct()
        {
            InitializeComponent();
        }

        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        private string code_cur = "";
        private void frmProduct_Load(object sender, EventArgs e)
        {
            resetControl();
            labelX2.Text = "Từ khóa";
            comboBoxEx1.Visible = false;
            labelX2.Visible = false;
            txtKeyword.Visible = false;
            btnBarCode.Visible = false;
            btnSearch.Location = new Point(231, 17);
            btnExit.Location = new Point(319, 17);
            btnBarCode.Location = new Point(400, 17);
        }
        private void resetControl()
        {
            labelX2.Text = "Từ khóa";
            comboBoxEx1.Visible = false;
            labelX2.Visible = false;
            txtKeyword.Visible = false;
            Dictionary<string, string> pro_type = new Dictionary<string, string>();

            int p_type = 0;
            var p = from x in db.tProductTypes
                    where x.Status != 0 && x.ParentTypeId == null
                        && x.BranchTypeId == WindowsFormsApplication3.Form1.branch_type_id
                    select new { x.BranchTypeId, x.Id, x.ProductTypeName };
            foreach (var item in p.ToList())
            {
                p_type = 0;
                var p1 = from k in db.tProductTypes
                         where k.Status != 0 && k.ParentTypeId == item.Id
                             && item.BranchTypeId == WindowsFormsApplication3.Form1.branch_type_id
                         select new { k.Id, k.ProductTypeName };
                foreach (var u in p1.ToList())
                {
                    p_type++;
                    pro_type.Add(item.Id.ToString() + "," + u.Id.ToString(), item.ProductTypeName + " » " + u.ProductTypeName);
                }
                if (p_type == 0)
                {
                    pro_type.Add(item.Id.ToString(), item.ProductTypeName);
                }
            }

            comboBoxEx1.DataSource = new BindingSource(pro_type, null);
            comboBoxEx1.DisplayMember = "Value";
            comboBoxEx1.ValueMember = "Key";

            Dictionary<string, string> type = new Dictionary<string, string>();
            type.Add("0", "Tất cả");
            type.Add("1", "Mã vạch");
            type.Add("2", "Mã sản phẩm");
            type.Add("3", "Tên sản phẩm");
            type.Add("4", "Nhóm sản phẩm");
            cboType.DataSource = new BindingSource(type, null);
            cboType.DisplayMember = "Value";
            cboType.ValueMember = "Key";

            dgvProduct.DataSource = db.sp_ProductCnice_Search(WindowsFormsApplication3.Form1.branch_type_id, 0, "");
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }


        private void cboType_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtKeyword.Text = "";
            txtKeyword.Focus();
            labelX2.Text = cboType.Text;
            comboBoxEx1.Visible = cboType.SelectedValue.ToString() == "4";
            txtKeyword.Visible = cboType.SelectedValue.ToString() != "4" && cboType.SelectedValue.ToString() != "0";
            labelX2.Visible = cboType.SelectedValue.ToString() != "0";

            if (cboType.SelectedValue.ToString() == "0")
            {
                btnSearch.Location = new Point(231, 17);
                btnExit.Location = new Point(319, 17);
                btnBarCode.Location = new Point(400, 17);
            }
            else
            {
                btnSearch.Location = new Point(525, 17);
                btnExit.Location = new Point(613, 17);
                btnBarCode.Location = new Point(695, 17);
            }
            if (cboType.SelectedValue.ToString() == "4")
            {
                labelX2.Text = "";
                labelX2.Visible = false;
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            string key = "";
            if (cboType.SelectedValue.ToString() == "4")
                key = comboBoxEx1.SelectedValue.ToString().Contains(",") ? comboBoxEx1.SelectedValue.ToString().Split(',')[1] : comboBoxEx1.SelectedValue.ToString();
            else key = txtKeyword.Text.Trim();
            dgvProduct.DataSource = db.sp_ProductCnice_Search(WindowsFormsApplication3.Form1.branch_type_id,
                int.Parse(cboType.SelectedValue.ToString()), key);
        }

        private void txtKeyword_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                btnSearch_Click(sender, e);
            }
        }

        private void dgvProduct_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvProduct.Rows.Count != -1 && e.RowIndex != -1)
            {
                btnBarCode.Visible = true;
                code_cur = dgvProduct.Rows[e.RowIndex].Cells["ProductCode"].Value.ToString();
            }
        }

        private void btnBarCode_Click(object sender, EventArgs e)
        {
            frmBarCode.codeId = code_cur;
            var f = new frmBarCode();
            f.MdiParent = Form1.ActiveForm;
            f.Show();
        }
    }
}
