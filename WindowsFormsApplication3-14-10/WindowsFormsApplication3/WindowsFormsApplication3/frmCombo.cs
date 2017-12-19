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
    public partial class frmCombo : Office2007Form
    {
        public frmCombo()
        {
            InitializeComponent();
        }

        private void frmCombo_Load(object sender, EventArgs e)
        {
            CFManagerDataContext db = new CFManagerDataContext(frmOpenConnection.connection);
            dgvCombo.DataSource = db.sp_getComboList(WindowsFormsApplication3.Form1.branch_type_id,
                WindowsFormsApplication3.Form1.branch_id,0,0);
            
        }
    }
}
