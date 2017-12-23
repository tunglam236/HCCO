namespace WindowsFormsApplication3
{
    partial class frmOutputStockInternal
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmOutputStockInternal));
            this.btnList = new DevComponents.DotNetBar.ButtonX();
            this.btnExit = new DevComponents.DotNetBar.ButtonX();
            this.dgvTemp = new DevComponents.DotNetBar.Controls.DataGridViewX();
            this.ProductId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CodeId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.BrandName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CountryName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.UnitName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CapacityName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Quantity = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column7 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnSave = new DevComponents.DotNetBar.ButtonX();
            this.btnCancel = new DevComponents.DotNetBar.ButtonX();
            this.btnRefresh = new DevComponents.DotNetBar.ButtonX();
            this.grTTK = new DevComponents.DotNetBar.Controls.GroupPanel();
            this.btnRemove = new DevComponents.DotNetBar.ButtonX();
            this.cboBranch = new DevComponents.DotNetBar.Controls.ComboBoxEx();
            this.btnInsert = new DevComponents.DotNetBar.ButtonX();
            this.labelX1 = new DevComponents.DotNetBar.LabelX();
            this.labelX5 = new DevComponents.DotNetBar.LabelX();
            this.txtCreateDate = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.labelX4 = new DevComponents.DotNetBar.LabelX();
            this.labelX2 = new DevComponents.DotNetBar.LabelX();
            this.txtNote = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtProductCode = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.labelX3 = new DevComponents.DotNetBar.LabelX();
            this.txtStockCode = new DevComponents.DotNetBar.Controls.TextBoxX();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTemp)).BeginInit();
            this.grTTK.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnList
            // 
            this.btnList.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnList.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnList.Image = global::WindowsFormsApplication3.Properties.Resources.frmChiTietPSGD;
            this.btnList.ImageFixedSize = new System.Drawing.Size(20, 20);
            this.btnList.Location = new System.Drawing.Point(803, 86);
            this.btnList.Name = "btnList";
            this.btnList.Size = new System.Drawing.Size(166, 23);
            this.btnList.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnList.TabIndex = 8;
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
            this.btnExit.Location = new System.Drawing.Point(690, 86);
            this.btnExit.Name = "btnExit";
            this.btnExit.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.F4);
            this.btnExit.Size = new System.Drawing.Size(108, 23);
            this.btnExit.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnExit.TabIndex = 7;
            this.btnExit.Text = "Esc - Thoát";
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
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
            this.ProductId,
            this.CodeId,
            this.Column2,
            this.Column3,
            this.BrandName,
            this.CountryName,
            this.UnitName,
            this.CapacityName,
            this.Quantity,
            this.Column7});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvTemp.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvTemp.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvTemp.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.dgvTemp.EnableHeadersVisualStyles = false;
            this.dgvTemp.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(215)))), ((int)(((byte)(229)))));
            this.dgvTemp.Location = new System.Drawing.Point(0, 140);
            this.dgvTemp.MultiSelect = false;
            this.dgvTemp.Name = "dgvTemp";
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvTemp.RowHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvTemp.RowHeadersVisible = false;
            this.dgvTemp.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvTemp.Size = new System.Drawing.Size(987, 356);
            this.dgvTemp.TabIndex = 6;
            this.dgvTemp.CellBeginEdit += new System.Windows.Forms.DataGridViewCellCancelEventHandler(this.dgvTemp_CellBeginEdit);
            this.dgvTemp.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvTemp_CellClick);
            this.dgvTemp.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvTemp_CellDoubleClick);
            this.dgvTemp.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvTemp_CellEndEdit);
            // 
            // ProductId
            // 
            this.ProductId.DataPropertyName = "ProductId";
            this.ProductId.HeaderText = "Id";
            this.ProductId.Name = "ProductId";
            this.ProductId.Visible = false;
            // 
            // CodeId
            // 
            this.CodeId.DataPropertyName = "ProductCode";
            this.CodeId.HeaderText = "Mã vạch";
            this.CodeId.Name = "CodeId";
            this.CodeId.Visible = false;
            // 
            // Column2
            // 
            this.Column2.DataPropertyName = "Code";
            this.Column2.HeaderText = "Mã sản phẩm";
            this.Column2.Name = "Column2";
            // 
            // Column3
            // 
            this.Column3.DataPropertyName = "ProductName";
            this.Column3.HeaderText = "Tên sản phẩm";
            this.Column3.Name = "Column3";
            // 
            // BrandName
            // 
            this.BrandName.DataPropertyName = "BrandName";
            this.BrandName.HeaderText = "Nhãn hiệu";
            this.BrandName.Name = "BrandName";
            this.BrandName.ReadOnly = true;
            // 
            // CountryName
            // 
            this.CountryName.DataPropertyName = "CountryName";
            this.CountryName.HeaderText = "Xuất xứ";
            this.CountryName.Name = "CountryName";
            this.CountryName.ReadOnly = true;
            // 
            // UnitName
            // 
            this.UnitName.DataPropertyName = "UnitName";
            this.UnitName.HeaderText = "Đơn vị tính";
            this.UnitName.Name = "UnitName";
            this.UnitName.ReadOnly = true;
            // 
            // CapacityName
            // 
            this.CapacityName.DataPropertyName = "CapacityName";
            this.CapacityName.HeaderText = "Dung tích";
            this.CapacityName.Name = "CapacityName";
            this.CapacityName.ReadOnly = true;
            // 
            // Quantity
            // 
            this.Quantity.DataPropertyName = "Quantity";
            this.Quantity.HeaderText = "Số lượng";
            this.Quantity.Name = "Quantity";
            // 
            // Column7
            // 
            this.Column7.DataPropertyName = "IsCombo";
            this.Column7.HeaderText = "IsCombo";
            this.Column7.Name = "Column7";
            this.Column7.Visible = false;
            // 
            // btnSave
            // 
            this.btnSave.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnSave.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnSave.Image = global::WindowsFormsApplication3.Properties.Resources.save;
            this.btnSave.Location = new System.Drawing.Point(360, 86);
            this.btnSave.Name = "btnSave";
            this.btnSave.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlS);
            this.btnSave.Size = new System.Drawing.Size(159, 23);
            this.btnSave.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnSave.TabIndex = 5;
            this.btnSave.Text = "Ctrl + S - Lưu phiếu xuất";
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnCancel.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnCancel.Image = global::WindowsFormsApplication3.Properties.Resources.huy;
            this.btnCancel.Location = new System.Drawing.Point(526, 86);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlZ);
            this.btnCancel.Size = new System.Drawing.Size(158, 23);
            this.btnCancel.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnCancel.TabIndex = 6;
            this.btnCancel.Text = "Ctrl + Z - Hủy phiếu xuất";
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnRefresh
            // 
            this.btnRefresh.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnRefresh.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnRefresh.Image = global::WindowsFormsApplication3.Properties.Resources.refresh;
            this.btnRefresh.Location = new System.Drawing.Point(156, 86);
            this.btnRefresh.Name = "btnRefresh";
            this.btnRefresh.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.F5);
            this.btnRefresh.Size = new System.Drawing.Size(117, 23);
            this.btnRefresh.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnRefresh.TabIndex = 3;
            this.btnRefresh.Text = "F5 - Nhập mới";
            this.btnRefresh.Click += new System.EventHandler(this.btnRefesh_Click);
            // 
            // grTTK
            // 
            this.grTTK.CanvasColor = System.Drawing.SystemColors.Control;
            this.grTTK.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007;
            this.grTTK.Controls.Add(this.btnRemove);
            this.grTTK.Controls.Add(this.cboBranch);
            this.grTTK.Controls.Add(this.btnList);
            this.grTTK.Controls.Add(this.btnExit);
            this.grTTK.Controls.Add(this.btnCancel);
            this.grTTK.Controls.Add(this.btnSave);
            this.grTTK.Controls.Add(this.btnRefresh);
            this.grTTK.Controls.Add(this.btnInsert);
            this.grTTK.Controls.Add(this.labelX1);
            this.grTTK.Controls.Add(this.labelX5);
            this.grTTK.Controls.Add(this.txtCreateDate);
            this.grTTK.Controls.Add(this.labelX4);
            this.grTTK.Controls.Add(this.labelX2);
            this.grTTK.Controls.Add(this.txtNote);
            this.grTTK.Controls.Add(this.txtProductCode);
            this.grTTK.Controls.Add(this.labelX3);
            this.grTTK.Controls.Add(this.txtStockCode);
            this.grTTK.DisabledBackColor = System.Drawing.Color.Empty;
            this.grTTK.Dock = System.Windows.Forms.DockStyle.Top;
            this.grTTK.Location = new System.Drawing.Point(0, 0);
            this.grTTK.Name = "grTTK";
            this.grTTK.Size = new System.Drawing.Size(987, 140);
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
            this.grTTK.TabIndex = 5;
            this.grTTK.Text = "Thông tin xuất điều chuyển";
            // 
            // btnRemove
            // 
            this.btnRemove.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnRemove.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnRemove.Image = global::WindowsFormsApplication3.Properties.Resources.DeleteRed;
            this.btnRemove.Location = new System.Drawing.Point(280, 86);
            this.btnRemove.Name = "btnRemove";
            this.btnRemove.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.Del);
            this.btnRemove.Size = new System.Drawing.Size(75, 23);
            this.btnRemove.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnRemove.TabIndex = 12;
            this.btnRemove.Text = "Del - Xóa";
            this.btnRemove.Click += new System.EventHandler(this.btnRemove_Click);
            // 
            // cboBranch
            // 
            this.cboBranch.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.cboBranch.DisplayMember = "BranchName";
            this.cboBranch.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboBranch.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboBranch.FormattingEnabled = true;
            this.cboBranch.ItemHeight = 14;
            this.cboBranch.Location = new System.Drawing.Point(605, 8);
            this.cboBranch.Name = "cboBranch";
            this.cboBranch.Size = new System.Drawing.Size(364, 20);
            this.cboBranch.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.cboBranch.TabIndex = 11;
            this.cboBranch.ValueMember = "Id";
            // 
            // btnInsert
            // 
            this.btnInsert.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnInsert.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnInsert.Image = global::WindowsFormsApplication3.Properties.Resources.add1_;
            this.btnInsert.Location = new System.Drawing.Point(19, 86);
            this.btnInsert.Name = "btnInsert";
            this.btnInsert.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.F1);
            this.btnInsert.Size = new System.Drawing.Size(131, 23);
            this.btnInsert.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnInsert.TabIndex = 2;
            this.btnInsert.Text = "F1 - Thêm sản phẩm";
            this.btnInsert.Click += new System.EventHandler(this.btnInsert_Click);
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
            // labelX5
            // 
            this.labelX5.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX5.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX5.Location = new System.Drawing.Point(508, 47);
            this.labelX5.Name = "labelX5";
            this.labelX5.Size = new System.Drawing.Size(52, 23);
            this.labelX5.TabIndex = 1;
            this.labelX5.Text = "Ghi chú";
            // 
            // txtCreateDate
            // 
            // 
            // 
            // 
            this.txtCreateDate.Border.Class = "TextBoxBorder";
            this.txtCreateDate.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtCreateDate.Location = new System.Drawing.Point(126, 10);
            this.txtCreateDate.Name = "txtCreateDate";
            this.txtCreateDate.ReadOnly = true;
            this.txtCreateDate.Size = new System.Drawing.Size(100, 20);
            this.txtCreateDate.TabIndex = 9;
            // 
            // labelX4
            // 
            this.labelX4.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX4.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX4.Location = new System.Drawing.Point(508, 7);
            this.labelX4.Name = "labelX4";
            this.labelX4.Size = new System.Drawing.Size(90, 23);
            this.labelX4.TabIndex = 1;
            this.labelX4.Text = "Chi nhánh nhận";
            // 
            // labelX2
            // 
            this.labelX2.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX2.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX2.Location = new System.Drawing.Point(246, 7);
            this.labelX2.Name = "labelX2";
            this.labelX2.Size = new System.Drawing.Size(75, 23);
            this.labelX2.TabIndex = 1;
            this.labelX2.Text = "Số phiếu xuất";
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
            this.txtNote.Location = new System.Drawing.Point(605, 47);
            this.txtNote.Name = "txtNote";
            this.txtNote.Size = new System.Drawing.Size(364, 20);
            this.txtNote.TabIndex = 1;
            // 
            // txtProductCode
            // 
            // 
            // 
            // 
            this.txtProductCode.Border.Class = "TextBoxBorder";
            this.txtProductCode.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtProductCode.Location = new System.Drawing.Point(126, 50);
            this.txtProductCode.Name = "txtProductCode";
            this.txtProductCode.Size = new System.Drawing.Size(357, 20);
            this.txtProductCode.TabIndex = 0;
            this.txtProductCode.KeyUp += new System.Windows.Forms.KeyEventHandler(this.txtProductCode_KeyUp);
            // 
            // labelX3
            // 
            this.labelX3.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX3.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX3.Location = new System.Drawing.Point(19, 47);
            this.labelX3.Name = "labelX3";
            this.labelX3.Size = new System.Drawing.Size(101, 23);
            this.labelX3.TabIndex = 1;
            this.labelX3.Text = "Mã vạch sản phẩm";
            // 
            // txtStockCode
            // 
            // 
            // 
            // 
            this.txtStockCode.Border.Class = "TextBoxBorder";
            this.txtStockCode.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtStockCode.Location = new System.Drawing.Point(345, 10);
            this.txtStockCode.Name = "txtStockCode";
            this.txtStockCode.ReadOnly = true;
            this.txtStockCode.Size = new System.Drawing.Size(137, 20);
            this.txtStockCode.TabIndex = 10;
            // 
            // frmOutputStockInternal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnExit;
            this.ClientSize = new System.Drawing.Size(987, 496);
            this.Controls.Add(this.dgvTemp);
            this.Controls.Add(this.grTTK);
            this.DoubleBuffered = true;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmOutputStockInternal";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Xuất điều chuyển nội bộ";
            this.Load += new System.EventHandler(this.frmOutputStockInternal_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTemp)).EndInit();
            this.grTTK.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private DevComponents.DotNetBar.ButtonX btnList;
        private DevComponents.DotNetBar.ButtonX btnExit;
        private DevComponents.DotNetBar.Controls.DataGridViewX dgvTemp;
        private DevComponents.DotNetBar.ButtonX btnSave;
        private DevComponents.DotNetBar.ButtonX btnCancel;
        private DevComponents.DotNetBar.ButtonX btnRefresh;
        private DevComponents.DotNetBar.Controls.GroupPanel grTTK;
        private DevComponents.DotNetBar.ButtonX btnInsert;
        private DevComponents.DotNetBar.LabelX labelX1;
        private DevComponents.DotNetBar.LabelX labelX5;
        private DevComponents.DotNetBar.Controls.TextBoxX txtCreateDate;
        private DevComponents.DotNetBar.LabelX labelX4;
        private DevComponents.DotNetBar.LabelX labelX2;
        private DevComponents.DotNetBar.Controls.TextBoxX txtNote;
        private DevComponents.DotNetBar.Controls.TextBoxX txtProductCode;
        private DevComponents.DotNetBar.LabelX labelX3;
        private DevComponents.DotNetBar.Controls.TextBoxX txtStockCode;
        private DevComponents.DotNetBar.Controls.ComboBoxEx cboBranch;
        private System.Windows.Forms.DataGridViewTextBoxColumn ProductId;
        private System.Windows.Forms.DataGridViewTextBoxColumn CodeId;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column3;
        private System.Windows.Forms.DataGridViewTextBoxColumn BrandName;
        private System.Windows.Forms.DataGridViewTextBoxColumn CountryName;
        private System.Windows.Forms.DataGridViewTextBoxColumn UnitName;
        private System.Windows.Forms.DataGridViewTextBoxColumn CapacityName;
        private System.Windows.Forms.DataGridViewTextBoxColumn Quantity;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column7;
        private DevComponents.DotNetBar.ButtonX btnRemove;
    }
}