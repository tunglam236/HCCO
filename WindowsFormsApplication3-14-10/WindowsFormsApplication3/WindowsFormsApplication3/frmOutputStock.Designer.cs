namespace WindowsFormsApplication3
{
    partial class frmOutputStock
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmOutputStock));
            this.txtCreateDate = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.labelX1 = new DevComponents.DotNetBar.LabelX();
            this.labelX2 = new DevComponents.DotNetBar.LabelX();
            this.labelX3 = new DevComponents.DotNetBar.LabelX();
            this.labelX4 = new DevComponents.DotNetBar.LabelX();
            this.labelX5 = new DevComponents.DotNetBar.LabelX();
            this.txtStockCode = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtProductCode = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtNote = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.grTTK = new DevComponents.DotNetBar.Controls.GroupPanel();
            this.cbMember = new DevComponents.DotNetBar.Controls.ComboBoxEx();
            this.cbUser = new DevComponents.DotNetBar.Controls.ComboBoxEx();
            this.cboPaymentType = new DevComponents.DotNetBar.Controls.ComboBoxEx();
            this.ckPrint = new DevComponents.DotNetBar.Controls.CheckBoxX();
            this.txtTotalPrice = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtTotal = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtVoucher = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtDiscount = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtCustomeReturn = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtCustomePay = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.labelX8 = new DevComponents.DotNetBar.LabelX();
            this.labelX9 = new DevComponents.DotNetBar.LabelX();
            this.labelX7 = new DevComponents.DotNetBar.LabelX();
            this.labelX10 = new DevComponents.DotNetBar.LabelX();
            this.labelX12 = new DevComponents.DotNetBar.LabelX();
            this.labelX6 = new DevComponents.DotNetBar.LabelX();
            this.btnHelp = new DevComponents.DotNetBar.ButtonX();
            this.btnAddMember = new DevComponents.DotNetBar.ButtonX();
            this.btnList = new DevComponents.DotNetBar.ButtonX();
            this.btnExit = new DevComponents.DotNetBar.ButtonX();
            this.btnCancel = new DevComponents.DotNetBar.ButtonX();
            this.btnSave = new DevComponents.DotNetBar.ButtonX();
            this.btnDel = new DevComponents.DotNetBar.ButtonX();
            this.btnInsert = new DevComponents.DotNetBar.ButtonX();
            this.labelX13 = new DevComponents.DotNetBar.LabelX();
            this.labelX11 = new DevComponents.DotNetBar.LabelX();
            this.dgvTemp = new DevComponents.DotNetBar.Controls.DataGridViewX();
            this.Id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ProductCode = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Quantity = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.UnitId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.UnitName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PriceCoss = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Price = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Discount = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TotalPrice = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column7 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Total = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Note = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.lbTotalPrice = new System.Windows.Forms.ToolStripStatusLabel();
            this.grTTK.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTemp)).BeginInit();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtCreateDate
            // 
            // 
            // 
            // 
            this.txtCreateDate.Border.Class = "TextBoxBorder";
            this.txtCreateDate.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtCreateDate.Location = new System.Drawing.Point(100, 10);
            this.txtCreateDate.Name = "txtCreateDate";
            this.txtCreateDate.ReadOnly = true;
            this.txtCreateDate.Size = new System.Drawing.Size(100, 20);
            this.txtCreateDate.TabIndex = 10;
            // 
            // labelX1
            // 
            this.labelX1.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX1.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX1.Location = new System.Drawing.Point(19, 7);
            this.labelX1.Name = "labelX1";
            this.labelX1.Size = new System.Drawing.Size(62, 23);
            this.labelX1.TabIndex = 1;
            this.labelX1.Text = "Ngày xuất";
            // 
            // labelX2
            // 
            this.labelX2.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX2.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX2.Location = new System.Drawing.Point(224, 7);
            this.labelX2.Name = "labelX2";
            this.labelX2.Size = new System.Drawing.Size(75, 23);
            this.labelX2.TabIndex = 1;
            this.labelX2.Text = "Số phiếu xuất";
            // 
            // labelX3
            // 
            this.labelX3.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX3.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX3.Location = new System.Drawing.Point(468, 7);
            this.labelX3.Name = "labelX3";
            this.labelX3.Size = new System.Drawing.Size(110, 23);
            this.labelX3.TabIndex = 1;
            this.labelX3.Text = "Mã vạch sản phẩm";
            // 
            // labelX4
            // 
            this.labelX4.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX4.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX4.Location = new System.Drawing.Point(19, 47);
            this.labelX4.Name = "labelX4";
            this.labelX4.Size = new System.Drawing.Size(75, 23);
            this.labelX4.TabIndex = 1;
            this.labelX4.Text = "Mã khách hàng";
            // 
            // labelX5
            // 
            this.labelX5.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX5.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX5.Location = new System.Drawing.Point(780, 47);
            this.labelX5.Name = "labelX5";
            this.labelX5.Size = new System.Drawing.Size(52, 23);
            this.labelX5.TabIndex = 1;
            this.labelX5.Text = "Ghi chú";
            // 
            // txtStockCode
            // 
            // 
            // 
            // 
            this.txtStockCode.Border.Class = "TextBoxBorder";
            this.txtStockCode.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtStockCode.Location = new System.Drawing.Point(312, 10);
            this.txtStockCode.Name = "txtStockCode";
            this.txtStockCode.ReadOnly = true;
            this.txtStockCode.Size = new System.Drawing.Size(137, 20);
            this.txtStockCode.TabIndex = 11;
            // 
            // txtProductCode
            // 
            // 
            // 
            // 
            this.txtProductCode.Border.Class = "TextBoxBorder";
            this.txtProductCode.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtProductCode.Location = new System.Drawing.Point(575, 10);
            this.txtProductCode.Name = "txtProductCode";
            this.txtProductCode.Size = new System.Drawing.Size(138, 20);
            this.txtProductCode.TabIndex = 0;
            this.txtProductCode.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtProductCode_KeyPress);
            this.txtProductCode.KeyUp += new System.Windows.Forms.KeyEventHandler(this.txtProductCode_KeyUp);
            // 
            // txtNote
            // 
            this.txtNote.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            // 
            // 
            // 
            this.txtNote.Border.Class = "TextBoxBorder";
            this.txtNote.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtNote.Location = new System.Drawing.Point(834, 47);
            this.txtNote.Name = "txtNote";
            this.txtNote.Size = new System.Drawing.Size(406, 20);
            this.txtNote.TabIndex = 2;
            // 
            // grTTK
            // 
            this.grTTK.CanvasColor = System.Drawing.SystemColors.Control;
            this.grTTK.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007;
            this.grTTK.Controls.Add(this.cbMember);
            this.grTTK.Controls.Add(this.cbUser);
            this.grTTK.Controls.Add(this.cboPaymentType);
            this.grTTK.Controls.Add(this.ckPrint);
            this.grTTK.Controls.Add(this.txtTotalPrice);
            this.grTTK.Controls.Add(this.txtTotal);
            this.grTTK.Controls.Add(this.txtVoucher);
            this.grTTK.Controls.Add(this.txtDiscount);
            this.grTTK.Controls.Add(this.txtCustomeReturn);
            this.grTTK.Controls.Add(this.txtCustomePay);
            this.grTTK.Controls.Add(this.labelX8);
            this.grTTK.Controls.Add(this.labelX9);
            this.grTTK.Controls.Add(this.labelX7);
            this.grTTK.Controls.Add(this.labelX10);
            this.grTTK.Controls.Add(this.labelX12);
            this.grTTK.Controls.Add(this.labelX6);
            this.grTTK.Controls.Add(this.btnHelp);
            this.grTTK.Controls.Add(this.btnAddMember);
            this.grTTK.Controls.Add(this.btnList);
            this.grTTK.Controls.Add(this.btnExit);
            this.grTTK.Controls.Add(this.btnCancel);
            this.grTTK.Controls.Add(this.btnSave);
            this.grTTK.Controls.Add(this.btnDel);
            this.grTTK.Controls.Add(this.btnInsert);
            this.grTTK.Controls.Add(this.labelX1);
            this.grTTK.Controls.Add(this.labelX13);
            this.grTTK.Controls.Add(this.labelX5);
            this.grTTK.Controls.Add(this.txtCreateDate);
            this.grTTK.Controls.Add(this.labelX4);
            this.grTTK.Controls.Add(this.labelX2);
            this.grTTK.Controls.Add(this.txtNote);
            this.grTTK.Controls.Add(this.txtProductCode);
            this.grTTK.Controls.Add(this.labelX11);
            this.grTTK.Controls.Add(this.labelX3);
            this.grTTK.Controls.Add(this.txtStockCode);
            this.grTTK.DisabledBackColor = System.Drawing.Color.Empty;
            this.grTTK.Dock = System.Windows.Forms.DockStyle.Top;
            this.grTTK.Location = new System.Drawing.Point(0, 0);
            this.grTTK.Name = "grTTK";
            this.grTTK.Size = new System.Drawing.Size(1260, 216);
            // 
            // 
            // 
            this.grTTK.Style.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2;
            this.grTTK.Style.BackColorGradientAngle = 90;
            this.grTTK.Style.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground;
            this.grTTK.Style.BorderBottom = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.grTTK.Style.BorderBottomWidth = 1;
            this.grTTK.Style.BorderColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder;
            this.grTTK.Style.BorderLeft = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.grTTK.Style.BorderLeftWidth = 1;
            this.grTTK.Style.BorderRight = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.grTTK.Style.BorderRightWidth = 1;
            this.grTTK.Style.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.grTTK.Style.BorderTopWidth = 1;
            this.grTTK.Style.CornerDiameter = 4;
            this.grTTK.Style.CornerType = DevComponents.DotNetBar.eCornerType.Rounded;
            this.grTTK.Style.TextAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Center;
            this.grTTK.Style.TextColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelText;
            this.grTTK.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near;
            // 
            // 
            // 
            this.grTTK.StyleMouseDown.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            // 
            // 
            // 
            this.grTTK.StyleMouseOver.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.grTTK.TabIndex = 1;
            this.grTTK.Text = "Thông tin xuất hàng";
            // 
            // cbMember
            // 
            this.cbMember.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cbMember.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cbMember.DisplayMember = "Name";
            this.cbMember.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cbMember.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cbMember.FormattingEnabled = true;
            this.cbMember.ItemHeight = 15;
            this.cbMember.Location = new System.Drawing.Point(100, 47);
            this.cbMember.Name = "cbMember";
            this.cbMember.Size = new System.Drawing.Size(190, 21);
            this.cbMember.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.cbMember.TabIndex = 17;
            this.cbMember.ValueMember = "Id";
            this.cbMember.KeyUp += new System.Windows.Forms.KeyEventHandler(this.cbMember_KeyUp);
            // 
            // cbUser
            // 
            this.cbUser.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cbUser.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cbUser.DisplayMember = "Name";
            this.cbUser.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cbUser.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cbUser.FormattingEnabled = true;
            this.cbUser.ItemHeight = 15;
            this.cbUser.Location = new System.Drawing.Point(468, 47);
            this.cbUser.Name = "cbUser";
            this.cbUser.Size = new System.Drawing.Size(245, 21);
            this.cbUser.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.cbUser.TabIndex = 17;
            this.cbUser.ValueMember = "Id";
            // 
            // cboPaymentType
            // 
            this.cboPaymentType.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.cboPaymentType.DisplayMember = "Text";
            this.cboPaymentType.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboPaymentType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboPaymentType.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cboPaymentType.FormattingEnabled = true;
            this.cboPaymentType.ItemHeight = 14;
            this.cboPaymentType.Location = new System.Drawing.Point(834, 10);
            this.cboPaymentType.Name = "cboPaymentType";
            this.cboPaymentType.Size = new System.Drawing.Size(406, 20);
            this.cboPaymentType.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.cboPaymentType.TabIndex = 16;
            // 
            // ckPrint
            // 
            this.ckPrint.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.ckPrint.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.ckPrint.Checked = true;
            this.ckPrint.CheckState = System.Windows.Forms.CheckState.Checked;
            this.ckPrint.CheckValue = "Y";
            this.ckPrint.Location = new System.Drawing.Point(17, 160);
            this.ckPrint.Name = "ckPrint";
            this.ckPrint.Size = new System.Drawing.Size(131, 23);
            this.ckPrint.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.ckPrint.TabIndex = 15;
            this.ckPrint.Text = "In phiếu sau khi lưu";
            // 
            // txtTotalPrice
            // 
            // 
            // 
            // 
            this.txtTotalPrice.Border.Class = "TextBoxBorder";
            this.txtTotalPrice.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtTotalPrice.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTotalPrice.ForeColor = System.Drawing.Color.Red;
            this.txtTotalPrice.Location = new System.Drawing.Point(100, 83);
            this.txtTotalPrice.Name = "txtTotalPrice";
            this.txtTotalPrice.ReadOnly = true;
            this.txtTotalPrice.Size = new System.Drawing.Size(99, 27);
            this.txtTotalPrice.TabIndex = 3;
            this.txtTotalPrice.Text = "0";
            this.txtTotalPrice.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // txtTotal
            // 
            // 
            // 
            // 
            this.txtTotal.Border.Class = "TextBoxBorder";
            this.txtTotal.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTotal.ForeColor = System.Drawing.Color.Red;
            this.txtTotal.Location = new System.Drawing.Point(640, 83);
            this.txtTotal.Name = "txtTotal";
            this.txtTotal.ReadOnly = true;
            this.txtTotal.Size = new System.Drawing.Size(125, 27);
            this.txtTotal.TabIndex = 5;
            this.txtTotal.Text = "0";
            this.txtTotal.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // txtVoucher
            // 
            // 
            // 
            // 
            this.txtVoucher.Border.Class = "TextBoxBorder";
            this.txtVoucher.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtVoucher.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtVoucher.ForeColor = System.Drawing.Color.Red;
            this.txtVoucher.Location = new System.Drawing.Point(274, 85);
            this.txtVoucher.Name = "txtVoucher";
            this.txtVoucher.Size = new System.Drawing.Size(108, 24);
            this.txtVoucher.TabIndex = 4;
            this.txtVoucher.KeyUp += new System.Windows.Forms.KeyEventHandler(this.txtVoucher_KeyUp);
            // 
            // txtDiscount
            // 
            // 
            // 
            // 
            this.txtDiscount.Border.Class = "TextBoxBorder";
            this.txtDiscount.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtDiscount.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDiscount.ForeColor = System.Drawing.Color.Red;
            this.txtDiscount.Location = new System.Drawing.Point(451, 83);
            this.txtDiscount.Name = "txtDiscount";
            this.txtDiscount.Size = new System.Drawing.Size(93, 27);
            this.txtDiscount.TabIndex = 4;
            this.txtDiscount.Text = "0";
            this.txtDiscount.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtDiscount.KeyUp += new System.Windows.Forms.KeyEventHandler(this.txtDiscount_KeyUp);
            this.txtDiscount.MouseLeave += new System.EventHandler(this.txtDiscount_MouseLeave);
            // 
            // txtCustomeReturn
            // 
            // 
            // 
            // 
            this.txtCustomeReturn.Border.Class = "TextBoxBorder";
            this.txtCustomeReturn.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtCustomeReturn.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCustomeReturn.ForeColor = System.Drawing.Color.Red;
            this.txtCustomeReturn.Location = new System.Drawing.Point(1074, 83);
            this.txtCustomeReturn.Name = "txtCustomeReturn";
            this.txtCustomeReturn.ReadOnly = true;
            this.txtCustomeReturn.Size = new System.Drawing.Size(166, 27);
            this.txtCustomeReturn.TabIndex = 7;
            this.txtCustomeReturn.Text = "0";
            this.txtCustomeReturn.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // txtCustomePay
            // 
            // 
            // 
            // 
            this.txtCustomePay.Border.Class = "TextBoxBorder";
            this.txtCustomePay.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtCustomePay.Font = new System.Drawing.Font("Microsoft Sans Serif", 13F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCustomePay.ForeColor = System.Drawing.Color.Red;
            this.txtCustomePay.Location = new System.Drawing.Point(837, 83);
            this.txtCustomePay.Name = "txtCustomePay";
            this.txtCustomePay.Size = new System.Drawing.Size(177, 27);
            this.txtCustomePay.TabIndex = 6;
            this.txtCustomePay.Text = "0";
            this.txtCustomePay.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtCustomePay.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtProductCode_KeyPress);
            this.txtCustomePay.KeyUp += new System.Windows.Forms.KeyEventHandler(this.txtCustome_KeyUp);
            this.txtCustomePay.MouseLeave += new System.EventHandler(this.txtCustomePay_MouseLeave);
            // 
            // labelX8
            // 
            this.labelX8.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX8.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX8.Location = new System.Drawing.Point(1028, 86);
            this.labelX8.Name = "labelX8";
            this.labelX8.Size = new System.Drawing.Size(40, 23);
            this.labelX8.TabIndex = 13;
            this.labelX8.Text = "Dư cuối";
            // 
            // labelX9
            // 
            this.labelX9.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX9.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX9.Location = new System.Drawing.Point(551, 86);
            this.labelX9.Name = "labelX9";
            this.labelX9.Size = new System.Drawing.Size(85, 23);
            this.labelX9.TabIndex = 13;
            this.labelX9.Text = "Tổng thanh toán";
            // 
            // labelX7
            // 
            this.labelX7.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX7.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX7.Location = new System.Drawing.Point(773, 86);
            this.labelX7.Name = "labelX7";
            this.labelX7.Size = new System.Drawing.Size(60, 23);
            this.labelX7.TabIndex = 13;
            this.labelX7.Text = "Khách đưa";
            // 
            // labelX10
            // 
            this.labelX10.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX10.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX10.Location = new System.Drawing.Point(19, 86);
            this.labelX10.Name = "labelX10";
            this.labelX10.Size = new System.Drawing.Size(53, 23);
            this.labelX10.TabIndex = 13;
            this.labelX10.Text = "Tổng tiền";
            // 
            // labelX12
            // 
            this.labelX12.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX12.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX12.Location = new System.Drawing.Point(205, 86);
            this.labelX12.Name = "labelX12";
            this.labelX12.Size = new System.Drawing.Size(62, 23);
            this.labelX12.TabIndex = 13;
            this.labelX12.Text = "Mã giảm giá";
            // 
            // labelX6
            // 
            this.labelX6.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX6.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX6.Location = new System.Drawing.Point(389, 86);
            this.labelX6.Name = "labelX6";
            this.labelX6.Size = new System.Drawing.Size(53, 23);
            this.labelX6.TabIndex = 13;
            this.labelX6.Text = "Chiết khấu";
            // 
            // btnHelp
            // 
            this.btnHelp.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnHelp.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnHelp.Image = global::WindowsFormsApplication3.Properties.Resources.help;
            this.btnHelp.ImageFixedSize = new System.Drawing.Size(20, 20);
            this.btnHelp.Location = new System.Drawing.Point(296, 47);
            this.btnHelp.Name = "btnHelp";
            this.btnHelp.Size = new System.Drawing.Size(27, 20);
            this.btnHelp.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnHelp.TabIndex = 12;
            this.btnHelp.Tooltip = "Tìm khách hàng";
            this.btnHelp.Click += new System.EventHandler(this.btnHelp_Click);
            // 
            // btnAddMember
            // 
            this.btnAddMember.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnAddMember.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnAddMember.Image = global::WindowsFormsApplication3.Properties.Resources.add1_;
            this.btnAddMember.Location = new System.Drawing.Point(325, 47);
            this.btnAddMember.Name = "btnAddMember";
            this.btnAddMember.Size = new System.Drawing.Size(27, 20);
            this.btnAddMember.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnAddMember.TabIndex = 12;
            this.btnAddMember.Tooltip = "Thêm khách hàng mới";
            this.btnAddMember.Click += new System.EventHandler(this.btnAddMember_Click);
            // 
            // btnList
            // 
            this.btnList.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnList.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnList.Image = global::WindowsFormsApplication3.Properties.Resources.frmChiTietPSGD;
            this.btnList.ImageFixedSize = new System.Drawing.Size(20, 20);
            this.btnList.Location = new System.Drawing.Point(566, 127);
            this.btnList.Name = "btnList";
            this.btnList.Size = new System.Drawing.Size(158, 23);
            this.btnList.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnList.TabIndex = 14;
            this.btnList.Text = "Xem danh sách xuất hàng";
            this.btnList.Tooltip = "Xem danh sách xuất hàng";
            this.btnList.Click += new System.EventHandler(this.btnList_Click);
            // 
            // btnExit
            // 
            this.btnExit.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnExit.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnExit.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnExit.Image = global::WindowsFormsApplication3.Properties.Resources.quit;
            this.btnExit.ImageFixedSize = new System.Drawing.Size(16, 16);
            this.btnExit.Location = new System.Drawing.Point(730, 127);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(108, 23);
            this.btnExit.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnExit.TabIndex = 13;
            this.btnExit.Text = "Esc - Thoát";
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnCancel.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnCancel.Image = global::WindowsFormsApplication3.Properties.Resources.huy;
            this.btnCancel.Location = new System.Drawing.Point(402, 127);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlZ);
            this.btnCancel.Size = new System.Drawing.Size(158, 23);
            this.btnCancel.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnCancel.TabIndex = 12;
            this.btnCancel.Text = "Ctrl + Z - Hủy phiếu xuất";
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnSave
            // 
            this.btnSave.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnSave.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnSave.Image = global::WindowsFormsApplication3.Properties.Resources.save;
            this.btnSave.Location = new System.Drawing.Point(236, 127);
            this.btnSave.Name = "btnSave";
            this.btnSave.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlS);
            this.btnSave.Size = new System.Drawing.Size(159, 23);
            this.btnSave.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnSave.TabIndex = 11;
            this.btnSave.Text = "Ctrl + S - Lưu phiếu xuất";
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnDel
            // 
            this.btnDel.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnDel.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnDel.Image = global::WindowsFormsApplication3.Properties.Resources.DeleteRed;
            this.btnDel.Location = new System.Drawing.Point(157, 127);
            this.btnDel.Name = "btnDel";
            this.btnDel.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.Del);
            this.btnDel.Size = new System.Drawing.Size(75, 23);
            this.btnDel.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnDel.TabIndex = 10;
            this.btnDel.Text = "Del - Xóa";
            this.btnDel.Click += new System.EventHandler(this.btnDel_Click);
            // 
            // btnInsert
            // 
            this.btnInsert.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnInsert.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnInsert.Image = global::WindowsFormsApplication3.Properties.Resources.add1_;
            this.btnInsert.Location = new System.Drawing.Point(19, 127);
            this.btnInsert.Name = "btnInsert";
            this.btnInsert.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.F1);
            this.btnInsert.Size = new System.Drawing.Size(131, 23);
            this.btnInsert.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnInsert.TabIndex = 8;
            this.btnInsert.Text = "F1 - Thêm sản phẩm";
            this.btnInsert.Click += new System.EventHandler(this.btnInsert_Click);
            // 
            // labelX13
            // 
            this.labelX13.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX13.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX13.Location = new System.Drawing.Point(358, 47);
            this.labelX13.Name = "labelX13";
            this.labelX13.Size = new System.Drawing.Size(105, 23);
            this.labelX13.TabIndex = 1;
            this.labelX13.Text = "Nhân viên bán hàng";
            // 
            // labelX11
            // 
            this.labelX11.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX11.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX11.Location = new System.Drawing.Point(722, 7);
            this.labelX11.Name = "labelX11";
            this.labelX11.Size = new System.Drawing.Size(110, 23);
            this.labelX11.TabIndex = 1;
            this.labelX11.Text = "Hình thức thanh toán";
            // 
            // dgvTemp
            // 
            this.dgvTemp.AllowUserToAddRows = false;
            this.dgvTemp.AllowUserToDeleteRows = false;
            this.dgvTemp.AllowUserToOrderColumns = true;
            this.dgvTemp.AllowUserToResizeRows = false;
            this.dgvTemp.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvTemp.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvTemp.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTemp.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Id,
            this.ProductCode,
            this.Column3,
            this.Quantity,
            this.UnitId,
            this.UnitName,
            this.PriceCoss,
            this.Price,
            this.Discount,
            this.TotalPrice,
            this.Column7,
            this.Total,
            this.Note});
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvTemp.DefaultCellStyle = dataGridViewCellStyle3;
            this.dgvTemp.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvTemp.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.dgvTemp.EnableHeadersVisualStyles = false;
            this.dgvTemp.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(215)))), ((int)(((byte)(229)))));
            this.dgvTemp.Location = new System.Drawing.Point(0, 216);
            this.dgvTemp.MultiSelect = false;
            this.dgvTemp.Name = "dgvTemp";
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle4.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle4.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle4.SelectionForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle4.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvTemp.RowHeadersDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvTemp.RowHeadersVisible = false;
            this.dgvTemp.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvTemp.Size = new System.Drawing.Size(1260, 262);
            this.dgvTemp.TabIndex = 2;
            this.dgvTemp.CellBeginEdit += new System.Windows.Forms.DataGridViewCellCancelEventHandler(this.dgvTemp_CellBeginEdit);
            this.dgvTemp.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvTemp_CellClick);
            this.dgvTemp.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvTemp_CellDoubleClick);
            this.dgvTemp.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvTemp_CellEndEdit);
            // 
            // Id
            // 
            this.Id.DataPropertyName = "ProductId";
            this.Id.HeaderText = "Id";
            this.Id.Name = "Id";
            this.Id.Visible = false;
            // 
            // ProductCode
            // 
            this.ProductCode.DataPropertyName = "ProductCode";
            this.ProductCode.HeaderText = "Mã hàng";
            this.ProductCode.Name = "ProductCode";
            // 
            // Column3
            // 
            this.Column3.DataPropertyName = "ProductName";
            this.Column3.HeaderText = "Tên hàng";
            this.Column3.Name = "Column3";
            // 
            // Quantity
            // 
            this.Quantity.DataPropertyName = "Quantity";
            this.Quantity.HeaderText = "Số lượng";
            this.Quantity.Name = "Quantity";
            // 
            // UnitId
            // 
            this.UnitId.DataPropertyName = "UnitId";
            this.UnitId.HeaderText = "UnitId";
            this.UnitId.Name = "UnitId";
            this.UnitId.Visible = false;
            // 
            // UnitName
            // 
            this.UnitName.DataPropertyName = "UnitName";
            this.UnitName.HeaderText = "Đơn vị tính";
            this.UnitName.Name = "UnitName";
            // 
            // PriceCoss
            // 
            this.PriceCoss.DataPropertyName = "PriceCoss";
            this.PriceCoss.HeaderText = "Đơn giá";
            this.PriceCoss.Name = "PriceCoss";
            this.PriceCoss.ReadOnly = true;
            // 
            // Price
            // 
            this.Price.DataPropertyName = "Price";
            this.Price.HeaderText = "Giá bán";
            this.Price.Name = "Price";
            // 
            // Discount
            // 
            this.Discount.DataPropertyName = "Discount";
            this.Discount.HeaderText = "Chiết khấu";
            this.Discount.Name = "Discount";
            // 
            // TotalPrice
            // 
            this.TotalPrice.DataPropertyName = "TotalPrice";
            dataGridViewCellStyle2.Format = "N0";
            dataGridViewCellStyle2.NullValue = "0";
            this.TotalPrice.DefaultCellStyle = dataGridViewCellStyle2;
            this.TotalPrice.HeaderText = "Thành tiền";
            this.TotalPrice.Name = "TotalPrice";
            // 
            // Column7
            // 
            this.Column7.DataPropertyName = "IsCombo";
            this.Column7.HeaderText = "IsCombo";
            this.Column7.Name = "Column7";
            this.Column7.Visible = false;
            // 
            // Total
            // 
            this.Total.DataPropertyName = "Total";
            this.Total.HeaderText = "Price";
            this.Total.Name = "Total";
            this.Total.Visible = false;
            // 
            // Note
            // 
            this.Note.DataPropertyName = "Note";
            this.Note.HeaderText = "Ghi chú";
            this.Note.Name = "Note";
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.lbTotalPrice});
            this.statusStrip1.Location = new System.Drawing.Point(0, 456);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(1260, 22);
            this.statusStrip1.TabIndex = 4;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // lbTotalPrice
            // 
            this.lbTotalPrice.BackColor = System.Drawing.Color.Transparent;
            this.lbTotalPrice.Name = "lbTotalPrice";
            this.lbTotalPrice.Size = new System.Drawing.Size(118, 17);
            this.lbTotalPrice.Text = "toolStripStatusLabel1";
            // 
            // frmOutputStock
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnExit;
            this.ClientSize = new System.Drawing.Size(1260, 478);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.dgvTemp);
            this.Controls.Add(this.grTTK);
            this.DoubleBuffered = true;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MinimumSize = new System.Drawing.Size(1276, 517);
            this.Name = "frmOutputStock";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Xuất bán hàng";
            this.Load += new System.EventHandler(this.frmOutputStock_Load);
            this.grTTK.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTemp)).EndInit();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevComponents.DotNetBar.Controls.TextBoxX txtCreateDate;
        private DevComponents.DotNetBar.LabelX labelX1;
        private DevComponents.DotNetBar.LabelX labelX2;
        private DevComponents.DotNetBar.LabelX labelX3;
        private DevComponents.DotNetBar.LabelX labelX4;
        private DevComponents.DotNetBar.LabelX labelX5;
        private DevComponents.DotNetBar.Controls.TextBoxX txtStockCode;
        private DevComponents.DotNetBar.Controls.TextBoxX txtProductCode;
        private DevComponents.DotNetBar.Controls.TextBoxX txtNote;
        private DevComponents.DotNetBar.Controls.GroupPanel grTTK;
        private DevComponents.DotNetBar.ButtonX btnList;
        private DevComponents.DotNetBar.ButtonX btnExit;
        private DevComponents.DotNetBar.ButtonX btnCancel;
        private DevComponents.DotNetBar.ButtonX btnSave;
        private DevComponents.DotNetBar.ButtonX btnDel;
        private DevComponents.DotNetBar.ButtonX btnInsert;
        private DevComponents.DotNetBar.Controls.DataGridViewX dgvTemp;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel lbTotalPrice;
        private DevComponents.DotNetBar.ButtonX btnAddMember;
        private DevComponents.DotNetBar.Controls.TextBoxX txtCustomePay;
        private DevComponents.DotNetBar.LabelX labelX8;
        private DevComponents.DotNetBar.LabelX labelX7;
        private DevComponents.DotNetBar.LabelX labelX6;
        private DevComponents.DotNetBar.Controls.TextBoxX txtDiscount;
        private DevComponents.DotNetBar.Controls.TextBoxX txtTotal;
        private DevComponents.DotNetBar.LabelX labelX9;
        private DevComponents.DotNetBar.Controls.TextBoxX txtCustomeReturn;
        private DevComponents.DotNetBar.Controls.TextBoxX txtTotalPrice;
        private DevComponents.DotNetBar.LabelX labelX10;
        private DevComponents.DotNetBar.Controls.CheckBoxX ckPrint;
        private DevComponents.DotNetBar.Controls.ComboBoxEx cboPaymentType;
        private DevComponents.DotNetBar.LabelX labelX11;
        private DevComponents.DotNetBar.Controls.TextBoxX txtVoucher;
        private DevComponents.DotNetBar.LabelX labelX12;
        private DevComponents.DotNetBar.Controls.ComboBoxEx cbUser;
        private DevComponents.DotNetBar.LabelX labelX13;
        private DevComponents.DotNetBar.ButtonX btnHelp;
        private DevComponents.DotNetBar.Controls.ComboBoxEx cbMember;
        private System.Windows.Forms.DataGridViewTextBoxColumn Id;
        private System.Windows.Forms.DataGridViewTextBoxColumn ProductCode;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column3;
        private System.Windows.Forms.DataGridViewTextBoxColumn Quantity;
        private System.Windows.Forms.DataGridViewTextBoxColumn UnitId;
        private System.Windows.Forms.DataGridViewTextBoxColumn UnitName;
        private System.Windows.Forms.DataGridViewTextBoxColumn PriceCoss;
        private System.Windows.Forms.DataGridViewTextBoxColumn Price;
        private System.Windows.Forms.DataGridViewTextBoxColumn Discount;
        private System.Windows.Forms.DataGridViewTextBoxColumn TotalPrice;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column7;
        private System.Windows.Forms.DataGridViewTextBoxColumn Total;
        private System.Windows.Forms.DataGridViewTextBoxColumn Note;
    }
}