namespace WindowsFormsApplication3
{
    partial class frmInputStock
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmInputStock));
            this.grTTK = new DevComponents.DotNetBar.Controls.GroupPanel();
            this.txtNote = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtStockOutputCode = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtStockInputCode = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtCreateDate = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.btnList = new DevComponents.DotNetBar.ButtonX();
            this.btnCancel = new DevComponents.DotNetBar.ButtonX();
            this.btnSave = new DevComponents.DotNetBar.ButtonX();
            this.labelX4 = new DevComponents.DotNetBar.LabelX();
            this.labelX3 = new DevComponents.DotNetBar.LabelX();
            this.labelX2 = new DevComponents.DotNetBar.LabelX();
            this.labelX1 = new DevComponents.DotNetBar.LabelX();
            this.dgvTemp = new DevComponents.DotNetBar.Controls.DataGridViewX();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.lbBranch = new System.Windows.Forms.ToolStripStatusLabel();
            this.lbCreateAt = new System.Windows.Forms.ToolStripStatusLabel();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column7 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CodeId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ProductCode = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ProductName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Quantity = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.grTTK.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTemp)).BeginInit();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // grTTK
            // 
            this.grTTK.CanvasColor = System.Drawing.SystemColors.Control;
            this.grTTK.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007;
            this.grTTK.Controls.Add(this.txtNote);
            this.grTTK.Controls.Add(this.txtStockOutputCode);
            this.grTTK.Controls.Add(this.txtStockInputCode);
            this.grTTK.Controls.Add(this.txtCreateDate);
            this.grTTK.Controls.Add(this.btnList);
            this.grTTK.Controls.Add(this.btnCancel);
            this.grTTK.Controls.Add(this.btnSave);
            this.grTTK.Controls.Add(this.labelX4);
            this.grTTK.Controls.Add(this.labelX3);
            this.grTTK.Controls.Add(this.labelX2);
            this.grTTK.Controls.Add(this.labelX1);
            this.grTTK.DisabledBackColor = System.Drawing.Color.Empty;
            this.grTTK.Dock = System.Windows.Forms.DockStyle.Top;
            this.grTTK.Location = new System.Drawing.Point(0, 0);
            this.grTTK.Name = "grTTK";
            this.grTTK.Size = new System.Drawing.Size(979, 104);
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
            this.grTTK.TabIndex = 0;
            this.grTTK.Text = "Thông tin nhập điều chuyển";
            // 
            // txtNote
            // 
            // 
            // 
            // 
            this.txtNote.Border.Class = "TextBoxBorder";
            this.txtNote.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtNote.Location = new System.Drawing.Point(90, 41);
            this.txtNote.Name = "txtNote";
            this.txtNote.Size = new System.Drawing.Size(300, 20);
            this.txtNote.TabIndex = 1;
            // 
            // txtStockOutputCode
            // 
            // 
            // 
            // 
            this.txtStockOutputCode.Border.Class = "TextBoxBorder";
            this.txtStockOutputCode.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtStockOutputCode.Location = new System.Drawing.Point(494, 6);
            this.txtStockOutputCode.Name = "txtStockOutputCode";
            this.txtStockOutputCode.Size = new System.Drawing.Size(382, 20);
            this.txtStockOutputCode.TabIndex = 0;
            this.txtStockOutputCode.KeyUp += new System.Windows.Forms.KeyEventHandler(this.txtStockOutputCode_KeyUp);
            // 
            // txtStockInputCode
            // 
            // 
            // 
            // 
            this.txtStockInputCode.Border.Class = "TextBoxBorder";
            this.txtStockInputCode.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtStockInputCode.Location = new System.Drawing.Point(290, 6);
            this.txtStockInputCode.Name = "txtStockInputCode";
            this.txtStockInputCode.ReadOnly = true;
            this.txtStockInputCode.Size = new System.Drawing.Size(100, 20);
            this.txtStockInputCode.TabIndex = 6;
            // 
            // txtCreateDate
            // 
            // 
            // 
            // 
            this.txtCreateDate.Border.Class = "TextBoxBorder";
            this.txtCreateDate.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtCreateDate.Location = new System.Drawing.Point(90, 6);
            this.txtCreateDate.Name = "txtCreateDate";
            this.txtCreateDate.ReadOnly = true;
            this.txtCreateDate.Size = new System.Drawing.Size(100, 20);
            this.txtCreateDate.TabIndex = 5;
            // 
            // btnList
            // 
            this.btnList.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnList.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnList.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnList.Image = global::WindowsFormsApplication3.Properties.Resources.frmChiTietPSGD;
            this.btnList.ImageFixedSize = new System.Drawing.Size(20, 20);
            this.btnList.Location = new System.Drawing.Point(708, 41);
            this.btnList.Name = "btnList";
            this.btnList.Size = new System.Drawing.Size(168, 23);
            this.btnList.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnList.TabIndex = 4;
            this.btnList.Text = "Xem danh sách phiếu nhập";
            this.btnList.Tooltip = "Xem danh sách phiếu nhập";
            this.btnList.Click += new System.EventHandler(this.btnList_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnCancel.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancel.Image = global::WindowsFormsApplication3.Properties.Resources.huy;
            this.btnCancel.Location = new System.Drawing.Point(587, 41);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlZ);
            this.btnCancel.Size = new System.Drawing.Size(117, 23);
            this.btnCancel.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnCancel.TabIndex = 3;
            this.btnCancel.Text = "Ctrl + Z - Hủy bỏ";
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnSave
            // 
            this.btnSave.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnSave.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnSave.Image = global::WindowsFormsApplication3.Properties.Resources.save;
            this.btnSave.Location = new System.Drawing.Point(413, 41);
            this.btnSave.Name = "btnSave";
            this.btnSave.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlS);
            this.btnSave.Size = new System.Drawing.Size(166, 23);
            this.btnSave.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnSave.TabIndex = 2;
            this.btnSave.Text = "Ctrl + S - Lưu phiếu nhập";
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // labelX4
            // 
            this.labelX4.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX4.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX4.Location = new System.Drawing.Point(24, 41);
            this.labelX4.Name = "labelX4";
            this.labelX4.Size = new System.Drawing.Size(75, 23);
            this.labelX4.TabIndex = 0;
            this.labelX4.Text = "Ghi chú";
            // 
            // labelX3
            // 
            this.labelX3.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX3.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX3.Location = new System.Drawing.Point(413, 3);
            this.labelX3.Name = "labelX3";
            this.labelX3.Size = new System.Drawing.Size(75, 23);
            this.labelX3.TabIndex = 0;
            this.labelX3.Text = "Số phiếu xuất";
            // 
            // labelX2
            // 
            this.labelX2.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX2.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX2.Location = new System.Drawing.Point(209, 3);
            this.labelX2.Name = "labelX2";
            this.labelX2.Size = new System.Drawing.Size(75, 23);
            this.labelX2.TabIndex = 0;
            this.labelX2.Text = "Số phiếu nhập";
            // 
            // labelX1
            // 
            this.labelX1.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX1.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX1.Location = new System.Drawing.Point(24, 3);
            this.labelX1.Name = "labelX1";
            this.labelX1.Size = new System.Drawing.Size(64, 23);
            this.labelX1.TabIndex = 0;
            this.labelX1.Text = "Ngày nhập";
            // 
            // dgvTemp
            // 
            this.dgvTemp.AllowUserToAddRows = false;
            this.dgvTemp.AllowUserToDeleteRows = false;
            this.dgvTemp.AllowUserToResizeRows = false;
            this.dgvTemp.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvTemp.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTemp.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1,
            this.Column2,
            this.Column4,
            this.Column5,
            this.Column6,
            this.Column7,
            this.CodeId,
            this.ProductCode,
            this.ProductName,
            this.Quantity});
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvTemp.DefaultCellStyle = dataGridViewCellStyle1;
            this.dgvTemp.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvTemp.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.dgvTemp.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(215)))), ((int)(((byte)(229)))));
            this.dgvTemp.Location = new System.Drawing.Point(0, 104);
            this.dgvTemp.MultiSelect = false;
            this.dgvTemp.Name = "dgvTemp";
            this.dgvTemp.RowHeadersVisible = false;
            this.dgvTemp.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            this.dgvTemp.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvTemp.Size = new System.Drawing.Size(979, 312);
            this.dgvTemp.TabIndex = 1;
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.lbBranch,
            this.lbCreateAt});
            this.statusStrip1.Location = new System.Drawing.Point(0, 394);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(979, 22);
            this.statusStrip1.TabIndex = 3;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // lbBranch
            // 
            this.lbBranch.BackColor = System.Drawing.Color.Transparent;
            this.lbBranch.Name = "lbBranch";
            this.lbBranch.Size = new System.Drawing.Size(87, 17);
            this.lbBranch.Text = "Chi nhánh xuất";
            // 
            // lbCreateAt
            // 
            this.lbCreateAt.BackColor = System.Drawing.Color.Transparent;
            this.lbCreateAt.Name = "lbCreateAt";
            this.lbCreateAt.Size = new System.Drawing.Size(60, 17);
            this.lbCreateAt.Text = "Ngày xuất";
            // 
            // Column1
            // 
            this.Column1.DataPropertyName = "Id";
            this.Column1.HeaderText = "IDStock";
            this.Column1.Name = "Column1";
            this.Column1.Visible = false;
            // 
            // Column2
            // 
            this.Column2.DataPropertyName = "Note";
            this.Column2.HeaderText = "Note";
            this.Column2.Name = "Column2";
            this.Column2.Visible = false;
            // 
            // Column4
            // 
            this.Column4.DataPropertyName = "CreateAt";
            this.Column4.HeaderText = "CreatedAt";
            this.Column4.Name = "Column4";
            this.Column4.Visible = false;
            // 
            // Column5
            // 
            this.Column5.DataPropertyName = "BranchId";
            this.Column5.HeaderText = "BranchId";
            this.Column5.Name = "Column5";
            this.Column5.Visible = false;
            // 
            // Column6
            // 
            this.Column6.DataPropertyName = "BranchName";
            this.Column6.HeaderText = "BranchName";
            this.Column6.Name = "Column6";
            this.Column6.Visible = false;
            // 
            // Column7
            // 
            this.Column7.DataPropertyName = "ProductId";
            this.Column7.HeaderText = "ProductId";
            this.Column7.Name = "Column7";
            this.Column7.Visible = false;
            // 
            // CodeId
            // 
            this.CodeId.DataPropertyName = "CodeId";
            this.CodeId.HeaderText = "Mã vạch";
            this.CodeId.Name = "CodeId";
            this.CodeId.ReadOnly = true;
            // 
            // ProductCode
            // 
            this.ProductCode.DataPropertyName = "ProductCode";
            this.ProductCode.HeaderText = "Mã sản phẩm";
            this.ProductCode.Name = "ProductCode";
            this.ProductCode.ReadOnly = true;
            // 
            // ProductName
            // 
            this.ProductName.DataPropertyName = "ProductName";
            this.ProductName.HeaderText = "Tên sản phẩm";
            this.ProductName.Name = "ProductName";
            this.ProductName.ReadOnly = true;
            // 
            // Quantity
            // 
            this.Quantity.DataPropertyName = "Quantity";
            this.Quantity.HeaderText = "Số lượng";
            this.Quantity.Name = "Quantity";
            this.Quantity.ReadOnly = true;
            // 
            // frmInputStock
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnCancel;
            this.ClientSize = new System.Drawing.Size(979, 416);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.dgvTemp);
            this.Controls.Add(this.grTTK);
            this.DoubleBuffered = true;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmInputStock";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Nhập điều chuyển";
            this.Load += new System.EventHandler(this.frmInputStock_Load);
            this.grTTK.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTemp)).EndInit();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevComponents.DotNetBar.Controls.GroupPanel grTTK;
        private DevComponents.DotNetBar.Controls.TextBoxX txtNote;
        private DevComponents.DotNetBar.Controls.TextBoxX txtStockOutputCode;
        private DevComponents.DotNetBar.Controls.TextBoxX txtStockInputCode;
        private DevComponents.DotNetBar.Controls.TextBoxX txtCreateDate;
        private DevComponents.DotNetBar.ButtonX btnCancel;
        private DevComponents.DotNetBar.ButtonX btnSave;
        private DevComponents.DotNetBar.LabelX labelX4;
        private DevComponents.DotNetBar.LabelX labelX3;
        private DevComponents.DotNetBar.LabelX labelX2;
        private DevComponents.DotNetBar.LabelX labelX1;
        private DevComponents.DotNetBar.Controls.DataGridViewX dgvTemp;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel lbBranch;
        private System.Windows.Forms.ToolStripStatusLabel lbCreateAt;
        private DevComponents.DotNetBar.ButtonX btnList;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column4;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column5;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column6;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column7;
        private System.Windows.Forms.DataGridViewTextBoxColumn CodeId;
        private System.Windows.Forms.DataGridViewTextBoxColumn ProductCode;
        private System.Windows.Forms.DataGridViewTextBoxColumn ProductName;
        private System.Windows.Forms.DataGridViewTextBoxColumn Quantity;
    }
}