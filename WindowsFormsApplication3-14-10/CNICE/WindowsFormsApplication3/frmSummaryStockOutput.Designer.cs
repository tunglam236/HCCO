namespace WindowsFormsApplication3
{
    partial class frmSummaryStockOutput
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmSummaryStockOutput));
            this.labelX1 = new DevComponents.DotNetBar.LabelX();
            this.labelX2 = new DevComponents.DotNetBar.LabelX();
            this.btnSearch = new DevComponents.DotNetBar.ButtonX();
            this.groupPanel1 = new DevComponents.DotNetBar.Controls.GroupPanel();
            this.txtMember = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtBillCode = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtToDate = new DevComponents.Editors.DateTimeAdv.DateTimeInput();
            this.txtFromDate = new DevComponents.Editors.DateTimeAdv.DateTimeInput();
            this.btnPrint = new DevComponents.DotNetBar.ButtonX();
            this.labelX4 = new DevComponents.DotNetBar.LabelX();
            this.labelX3 = new DevComponents.DotNetBar.LabelX();
            this.dgvGrid = new DevComponents.DotNetBar.Controls.DataGridViewX();
            this.InputType = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.StockCode = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.BranchName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.OutputType = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.MemberName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Total = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Discount1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TotalPrice = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Status = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Note1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CreateAt = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CreateBy = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.labelX5 = new DevComponents.DotNetBar.LabelX();
            this.cbPaymentType = new DevComponents.DotNetBar.Controls.ComboBoxEx();
            this.groupPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.txtToDate)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtFromDate)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // labelX1
            // 
            this.labelX1.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX1.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX1.Location = new System.Drawing.Point(12, 15);
            this.labelX1.Name = "labelX1";
            this.labelX1.SingleLineColor = System.Drawing.Color.Transparent;
            this.labelX1.Size = new System.Drawing.Size(47, 23);
            this.labelX1.TabIndex = 0;
            this.labelX1.Text = "Từ ngày";
            // 
            // labelX2
            // 
            this.labelX2.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX2.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX2.Location = new System.Drawing.Point(159, 15);
            this.labelX2.Name = "labelX2";
            this.labelX2.Size = new System.Drawing.Size(51, 23);
            this.labelX2.TabIndex = 0;
            this.labelX2.Text = "Đến ngày";
            // 
            // btnSearch
            // 
            this.btnSearch.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnSearch.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnSearch.Image = global::WindowsFormsApplication3.Properties.Resources.Search;
            this.btnSearch.Location = new System.Drawing.Point(868, 15);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(113, 23);
            this.btnSearch.TabIndex = 2;
            this.btnSearch.Text = "Xem danh sách";
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // groupPanel1
            // 
            this.groupPanel1.CanvasColor = System.Drawing.SystemColors.Control;
            this.groupPanel1.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007;
            this.groupPanel1.Controls.Add(this.cbPaymentType);
            this.groupPanel1.Controls.Add(this.txtMember);
            this.groupPanel1.Controls.Add(this.txtBillCode);
            this.groupPanel1.Controls.Add(this.txtToDate);
            this.groupPanel1.Controls.Add(this.txtFromDate);
            this.groupPanel1.Controls.Add(this.btnPrint);
            this.groupPanel1.Controls.Add(this.btnSearch);
            this.groupPanel1.Controls.Add(this.labelX1);
            this.groupPanel1.Controls.Add(this.labelX5);
            this.groupPanel1.Controls.Add(this.labelX4);
            this.groupPanel1.Controls.Add(this.labelX3);
            this.groupPanel1.Controls.Add(this.labelX2);
            this.groupPanel1.DisabledBackColor = System.Drawing.Color.Empty;
            this.groupPanel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupPanel1.Location = new System.Drawing.Point(0, 0);
            this.groupPanel1.Name = "groupPanel1";
            this.groupPanel1.Size = new System.Drawing.Size(1159, 73);
            // 
            // 
            // 
            this.groupPanel1.Style.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2;
            this.groupPanel1.Style.BackColorGradientAngle = 90;
            this.groupPanel1.Style.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground;
            this.groupPanel1.Style.BorderBottom = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.groupPanel1.Style.BorderBottomWidth = 1;
            this.groupPanel1.Style.BorderColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder;
            this.groupPanel1.Style.BorderLeft = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.groupPanel1.Style.BorderLeftWidth = 1;
            this.groupPanel1.Style.BorderRight = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.groupPanel1.Style.BorderRightWidth = 1;
            this.groupPanel1.Style.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.groupPanel1.Style.BorderTopWidth = 1;
            this.groupPanel1.Style.CornerDiameter = 4;
            this.groupPanel1.Style.CornerType = DevComponents.DotNetBar.eCornerType.Rounded;
            this.groupPanel1.Style.TextAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Center;
            this.groupPanel1.Style.TextColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelText;
            this.groupPanel1.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near;
            // 
            // 
            // 
            this.groupPanel1.StyleMouseDown.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            // 
            // 
            // 
            this.groupPanel1.StyleMouseOver.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.groupPanel1.TabIndex = 4;
            this.groupPanel1.Text = "Danh sách hóa đơn xuất hàng";
            // 
            // txtMember
            // 
            // 
            // 
            // 
            this.txtMember.Border.Class = "TextBoxBorder";
            this.txtMember.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtMember.Location = new System.Drawing.Point(512, 16);
            this.txtMember.Name = "txtMember";
            this.txtMember.PreventEnterBeep = true;
            this.txtMember.Size = new System.Drawing.Size(120, 20);
            this.txtMember.TabIndex = 3;
            // 
            // txtBillCode
            // 
            // 
            // 
            // 
            this.txtBillCode.Border.Class = "TextBoxBorder";
            this.txtBillCode.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtBillCode.Location = new System.Drawing.Point(359, 16);
            this.txtBillCode.Name = "txtBillCode";
            this.txtBillCode.PreventEnterBeep = true;
            this.txtBillCode.Size = new System.Drawing.Size(75, 20);
            this.txtBillCode.TabIndex = 3;
            // 
            // txtToDate
            // 
            // 
            // 
            // 
            this.txtToDate.BackgroundStyle.Class = "DateTimeInputBackground";
            this.txtToDate.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtToDate.ButtonDropDown.Visible = true;
            this.txtToDate.CustomFormat = "dd/MM/yyyy";
            this.txtToDate.Format = DevComponents.Editors.eDateTimePickerFormat.Custom;
            this.txtToDate.IsPopupCalendarOpen = false;
            this.txtToDate.Location = new System.Drawing.Point(216, 16);
            // 
            // 
            // 
            // 
            // 
            // 
            this.txtToDate.MonthCalendar.BackgroundStyle.BackColor = System.Drawing.SystemColors.Window;
            this.txtToDate.MonthCalendar.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtToDate.MonthCalendar.ClearButtonVisible = true;
            // 
            // 
            // 
            this.txtToDate.MonthCalendar.CommandsBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground2;
            this.txtToDate.MonthCalendar.CommandsBackgroundStyle.BackColorGradientAngle = 90;
            this.txtToDate.MonthCalendar.CommandsBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground;
            this.txtToDate.MonthCalendar.CommandsBackgroundStyle.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.txtToDate.MonthCalendar.CommandsBackgroundStyle.BorderTopColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarDockedBorder;
            this.txtToDate.MonthCalendar.CommandsBackgroundStyle.BorderTopWidth = 1;
            this.txtToDate.MonthCalendar.CommandsBackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtToDate.MonthCalendar.DisplayMonth = new System.DateTime(2017, 10, 1, 0, 0, 0, 0);
            // 
            // 
            // 
            this.txtToDate.MonthCalendar.NavigationBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2;
            this.txtToDate.MonthCalendar.NavigationBackgroundStyle.BackColorGradientAngle = 90;
            this.txtToDate.MonthCalendar.NavigationBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground;
            this.txtToDate.MonthCalendar.NavigationBackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtToDate.MonthCalendar.TodayButtonVisible = true;
            this.txtToDate.Name = "txtToDate";
            this.txtToDate.Size = new System.Drawing.Size(85, 20);
            this.txtToDate.TabIndex = 1;
            // 
            // txtFromDate
            // 
            // 
            // 
            // 
            this.txtFromDate.BackgroundStyle.Class = "DateTimeInputBackground";
            this.txtFromDate.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtFromDate.ButtonDropDown.Visible = true;
            this.txtFromDate.CustomFormat = "dd/MM/yyyy";
            this.txtFromDate.Format = DevComponents.Editors.eDateTimePickerFormat.Custom;
            this.txtFromDate.IsPopupCalendarOpen = false;
            this.txtFromDate.Location = new System.Drawing.Point(65, 16);
            this.txtFromDate.MinDate = new System.DateTime(1990, 1, 1, 0, 0, 0, 0);
            // 
            // 
            // 
            // 
            // 
            // 
            this.txtFromDate.MonthCalendar.BackgroundStyle.BackColor = System.Drawing.SystemColors.Window;
            this.txtFromDate.MonthCalendar.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtFromDate.MonthCalendar.ClearButtonVisible = true;
            // 
            // 
            // 
            this.txtFromDate.MonthCalendar.CommandsBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground2;
            this.txtFromDate.MonthCalendar.CommandsBackgroundStyle.BackColorGradientAngle = 90;
            this.txtFromDate.MonthCalendar.CommandsBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground;
            this.txtFromDate.MonthCalendar.CommandsBackgroundStyle.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid;
            this.txtFromDate.MonthCalendar.CommandsBackgroundStyle.BorderTopColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarDockedBorder;
            this.txtFromDate.MonthCalendar.CommandsBackgroundStyle.BorderTopWidth = 1;
            this.txtFromDate.MonthCalendar.CommandsBackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtFromDate.MonthCalendar.DisplayMonth = new System.DateTime(2017, 10, 1, 0, 0, 0, 0);
            // 
            // 
            // 
            this.txtFromDate.MonthCalendar.NavigationBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2;
            this.txtFromDate.MonthCalendar.NavigationBackgroundStyle.BackColorGradientAngle = 90;
            this.txtFromDate.MonthCalendar.NavigationBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground;
            this.txtFromDate.MonthCalendar.NavigationBackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtFromDate.MonthCalendar.TodayButtonVisible = true;
            this.txtFromDate.Name = "txtFromDate";
            this.txtFromDate.Size = new System.Drawing.Size(89, 20);
            this.txtFromDate.TabIndex = 0;
            // 
            // btnPrint
            // 
            this.btnPrint.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnPrint.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnPrint.Image = global::WindowsFormsApplication3.Properties.Resources.save;
            this.btnPrint.Location = new System.Drawing.Point(987, 15);
            this.btnPrint.Name = "btnPrint";
            this.btnPrint.Size = new System.Drawing.Size(109, 23);
            this.btnPrint.TabIndex = 2;
            this.btnPrint.Text = "In phiếu xuất";
            this.btnPrint.Click += new System.EventHandler(this.btnPrint_Click);
            // 
            // labelX4
            // 
            this.labelX4.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX4.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX4.Location = new System.Drawing.Point(443, 16);
            this.labelX4.Name = "labelX4";
            this.labelX4.Size = new System.Drawing.Size(63, 23);
            this.labelX4.TabIndex = 0;
            this.labelX4.Text = "Khách hàng";
            // 
            // labelX3
            // 
            this.labelX3.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX3.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX3.Location = new System.Drawing.Point(307, 16);
            this.labelX3.Name = "labelX3";
            this.labelX3.Size = new System.Drawing.Size(51, 23);
            this.labelX3.TabIndex = 0;
            this.labelX3.Text = "Số phiếu";
            // 
            // dgvGrid
            // 
            this.dgvGrid.AllowUserToAddRows = false;
            this.dgvGrid.AllowUserToDeleteRows = false;
            this.dgvGrid.AllowUserToResizeRows = false;
            this.dgvGrid.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvGrid.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.InputType,
            this.StockCode,
            this.BranchName,
            this.OutputType,
            this.MemberName,
            this.Total,
            this.Discount1,
            this.TotalPrice,
            this.Status,
            this.Note1,
            this.CreateAt,
            this.CreateBy});
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle5.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle5.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle5.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle5.SelectionForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle5.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvGrid.DefaultCellStyle = dataGridViewCellStyle5;
            this.dgvGrid.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvGrid.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(215)))), ((int)(((byte)(229)))));
            this.dgvGrid.Location = new System.Drawing.Point(0, 73);
            this.dgvGrid.MinimumSize = new System.Drawing.Size(729, 335);
            this.dgvGrid.Name = "dgvGrid";
            this.dgvGrid.ReadOnly = true;
            this.dgvGrid.RowHeadersVisible = false;
            this.dgvGrid.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            this.dgvGrid.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvGrid.Size = new System.Drawing.Size(1159, 431);
            this.dgvGrid.TabIndex = 0;
            this.dgvGrid.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvGrid_CellClick);
            this.dgvGrid.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvGrid_CellDoubleClick);
            // 
            // InputType
            // 
            this.InputType.DataPropertyName = "InputType";
            this.InputType.HeaderText = "InputType";
            this.InputType.Name = "InputType";
            this.InputType.ReadOnly = true;
            this.InputType.Visible = false;
            // 
            // StockCode
            // 
            this.StockCode.DataPropertyName = "StockCode";
            this.StockCode.HeaderText = "Số phiếu xuất";
            this.StockCode.Name = "StockCode";
            this.StockCode.ReadOnly = true;
            // 
            // BranchName
            // 
            this.BranchName.DataPropertyName = "BranchName";
            this.BranchName.HeaderText = "Chi nhánh";
            this.BranchName.Name = "BranchName";
            this.BranchName.ReadOnly = true;
            // 
            // OutputType
            // 
            this.OutputType.DataPropertyName = "OutputType";
            this.OutputType.HeaderText = "Loại phiếu xuất";
            this.OutputType.Name = "OutputType";
            this.OutputType.ReadOnly = true;
            // 
            // MemberName
            // 
            this.MemberName.DataPropertyName = "MemberName";
            this.MemberName.HeaderText = "Khách hàng";
            this.MemberName.Name = "MemberName";
            this.MemberName.ReadOnly = true;
            // 
            // Total
            // 
            this.Total.DataPropertyName = "Total";
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            dataGridViewCellStyle1.Format = "N0";
            this.Total.DefaultCellStyle = dataGridViewCellStyle1;
            this.Total.HeaderText = "Tổng tiền";
            this.Total.Name = "Total";
            this.Total.ReadOnly = true;
            // 
            // Discount1
            // 
            this.Discount1.DataPropertyName = "Discount";
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            dataGridViewCellStyle2.Format = "N0";
            this.Discount1.DefaultCellStyle = dataGridViewCellStyle2;
            this.Discount1.HeaderText = "Chiết khấu";
            this.Discount1.Name = "Discount1";
            this.Discount1.ReadOnly = true;
            // 
            // TotalPrice
            // 
            this.TotalPrice.DataPropertyName = "TotalPrice";
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight;
            dataGridViewCellStyle3.Format = "N0";
            this.TotalPrice.DefaultCellStyle = dataGridViewCellStyle3;
            this.TotalPrice.HeaderText = "Thành tiền";
            this.TotalPrice.Name = "TotalPrice";
            this.TotalPrice.ReadOnly = true;
            // 
            // Status
            // 
            this.Status.DataPropertyName = "Status";
            this.Status.HeaderText = "Trạng thái";
            this.Status.Name = "Status";
            this.Status.ReadOnly = true;
            this.Status.Visible = false;
            // 
            // Note1
            // 
            this.Note1.DataPropertyName = "Note";
            this.Note1.HeaderText = "Ghi chú";
            this.Note1.Name = "Note1";
            this.Note1.ReadOnly = true;
            // 
            // CreateAt
            // 
            this.CreateAt.DataPropertyName = "CreateAt";
            dataGridViewCellStyle4.Format = "dd/MM/yyyy";
            this.CreateAt.DefaultCellStyle = dataGridViewCellStyle4;
            this.CreateAt.HeaderText = "Ngày xuất";
            this.CreateAt.Name = "CreateAt";
            this.CreateAt.ReadOnly = true;
            // 
            // CreateBy
            // 
            this.CreateBy.DataPropertyName = "CreateBy";
            this.CreateBy.HeaderText = "Người xuất";
            this.CreateBy.Name = "CreateBy";
            this.CreateBy.ReadOnly = true;
            // 
            // labelX5
            // 
            this.labelX5.BackColor = System.Drawing.Color.Transparent;
            // 
            // 
            // 
            this.labelX5.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX5.Location = new System.Drawing.Point(638, 16);
            this.labelX5.Name = "labelX5";
            this.labelX5.Size = new System.Drawing.Size(63, 23);
            this.labelX5.TabIndex = 0;
            this.labelX5.Text = "Nguồn tiền";
            // 
            // cbPaymentType
            // 
            this.cbPaymentType.DisplayMember = "Text";
            this.cbPaymentType.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cbPaymentType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbPaymentType.FormattingEnabled = true;
            this.cbPaymentType.ItemHeight = 15;
            this.cbPaymentType.Location = new System.Drawing.Point(697, 16);
            this.cbPaymentType.Name = "cbPaymentType";
            this.cbPaymentType.Size = new System.Drawing.Size(158, 21);
            this.cbPaymentType.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.cbPaymentType.TabIndex = 4;
            // 
            // frmSummaryStockOutput
            // 
            this.AcceptButton = this.btnSearch;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1159, 504);
            this.Controls.Add(this.dgvGrid);
            this.Controls.Add(this.groupPanel1);
            this.DoubleBuffered = true;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmSummaryStockOutput";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Danh sách xuất hàng";
            this.Load += new System.EventHandler(this.frmSummaryStockOutput_Load);
            this.groupPanel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.txtToDate)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.txtFromDate)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvGrid)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevComponents.DotNetBar.LabelX labelX1;
        private DevComponents.DotNetBar.LabelX labelX2;
        private DevComponents.DotNetBar.ButtonX btnSearch;
        private DevComponents.DotNetBar.Controls.GroupPanel groupPanel1;
        private DevComponents.Editors.DateTimeAdv.DateTimeInput txtToDate;
        private DevComponents.Editors.DateTimeAdv.DateTimeInput txtFromDate;
        private DevComponents.DotNetBar.ButtonX btnPrint;
        private DevComponents.DotNetBar.Controls.DataGridViewX dgvGrid;
        private System.Windows.Forms.DataGridViewTextBoxColumn InputType;
        private System.Windows.Forms.DataGridViewTextBoxColumn StockCode;
        private System.Windows.Forms.DataGridViewTextBoxColumn BranchName;
        private System.Windows.Forms.DataGridViewTextBoxColumn OutputType;
        private System.Windows.Forms.DataGridViewTextBoxColumn MemberName;
        private System.Windows.Forms.DataGridViewTextBoxColumn Total;
        private System.Windows.Forms.DataGridViewTextBoxColumn Discount1;
        private System.Windows.Forms.DataGridViewTextBoxColumn TotalPrice;
        private System.Windows.Forms.DataGridViewTextBoxColumn Status;
        private System.Windows.Forms.DataGridViewTextBoxColumn Note1;
        private System.Windows.Forms.DataGridViewTextBoxColumn CreateAt;
        private System.Windows.Forms.DataGridViewTextBoxColumn CreateBy;
        private DevComponents.DotNetBar.Controls.TextBoxX txtMember;
        private DevComponents.DotNetBar.Controls.TextBoxX txtBillCode;
        private DevComponents.DotNetBar.LabelX labelX4;
        private DevComponents.DotNetBar.LabelX labelX3;
        private DevComponents.DotNetBar.Controls.ComboBoxEx cbPaymentType;
        private DevComponents.DotNetBar.LabelX labelX5;
    }
}