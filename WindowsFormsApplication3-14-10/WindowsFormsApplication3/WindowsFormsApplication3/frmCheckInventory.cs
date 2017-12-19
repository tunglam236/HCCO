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
    public partial class frmCheckInventory : Office2007Form
    {
        public frmCheckInventory()
        {
            InitializeComponent();
        }

        private void frmCheckInventory_Load(object sender, EventArgs e)
        {

        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtProductCode.Text.Trim().Equals(""))
                MessageBox.Show("Nhập mã vạch sản phẩm cần tra cứu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
                dgvProduct.DataSource = db.sp_CheckInventoryByProductCode(WindowsFormsApplication3.Form1.branch_type_id.ToString(), txtProductCode.Text.Trim());
                if(dgvProduct.Rows.Count==0)
                    MessageBox.Show("Không tìm thấy thông tin nào", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void txtProductCode_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                btnSearch_Click(sender, e);
            }
        }
    }
}
