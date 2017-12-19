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
    public partial class frmHourGold : Office2007Form
    {
        public frmHourGold()
        {
            InitializeComponent();
        }
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        private void frmHourGold_Load(object sender, EventArgs e)
        {
            dgvSale.DataSource = db.sp_loadGift(WindowsFormsApplication3.Form1.branch_type_id.ToString(), WindowsFormsApplication3.Form1.branch_id.ToString());
        }

        private void dgvSale_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                var Id = dgvSale.Rows[e.RowIndex].Cells["Id"].Value.ToString();
                frmHourGoldDetail.saleId = int.Parse(Id);
                var f = new frmHourGoldDetail();
                f.MdiParent = Form1.ActiveForm;
                f.Show();
            }
        }
    }
}
