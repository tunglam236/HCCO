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
    public partial class frmHourGoldDetail : Office2007Form
    {
        public frmHourGoldDetail()
        {
            InitializeComponent();
        }
        public static int saleId = 0;
        CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
        private void frmHourGoldDetail_Load(object sender, EventArgs e)
        {
            dgvDetail.DataSource = db.sp_loadGiftDetail(saleId.ToString());
        }
    }
}
