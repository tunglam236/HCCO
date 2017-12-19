<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true"
    CodeFile="Ad_Category.aspx.cs" Inherits="Ad_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .width
        {
            min-width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <section class="footer-section-1">
             <div class="container">
        <div class="heading-style-1">
            <h3>
                Quản trị lĩnh vực hoạt động</h3>
        </div>
        <div class="row">
            
            <div class="col-md-4 col-lg-4 col-sm-6">
                Tên lĩnh vực (*)<br />
                <asp:TextBox ID="txtName" runat="server" MaxLength="50" CssClass="form-control" Width="95%" required=""></asp:TextBox>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                Icon (<i>Size 69 x 64</i>*)<br />
                <asp:FileUpload ID="fuIcon" runat="server" />
            </div>
             <div class="col-md-4 col-lg-4 col-sm-6">
                Hình ảnh (<i>Size 356 x 320</i>*)<br />
                <asp:FileUpload ID="fuImage" runat="server" />
            </div>
        </div>
        
         <div class="row">
            <div class="col-md-8 col-lg-8 col-sm-6">
                Mô tả<br />
                <asp:TextBox ID="txtContent" TextMode="MultiLine" MaxLength="1024" Rows="6" runat="server" CssClass="form-control" Width="98%"></asp:TextBox>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                <br />
                <asp:CheckBox ID="ckActive" runat="server" Checked="true" Text="Hiển thị lĩnh vực"></asp:CheckBox>
            </div>
       </div>
       <div class="row">
            <div class="col-md-12 ">
            <br />
                <asp:Button ID="btnSave" runat="server" Text="Lưu" CssClass="btn btn-primary" 
                    onclick="btnSave_Click" />
                     <asp:Button ID="btnUpdate" runat="server" Visible="false" Text="Cập nhật" CssClass="btn btn-primary" 
                    onclick="btnUpdate_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Hủy" CssClass="btn btn-success" 
                    onclick="btnCancel_Click" />
            </div>
        </div>
        <div class="row">
        <div style="margin: 10px 0px 5px 5px;">
        <asp:GridView ID="gvCat" Width="100%" runat="server" BackColor="White" BorderColor="#CCCCCC"
            AutoGenerateColumns="false" BorderStyle="None" BorderWidth="1px" CellPadding="3"
            EnableModelValidation="True" onrowcommand="gvCat_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" Text='Xóa' CommandArgument='<%#Eval("Id")%>' OnClientClick="return confirm('Bạn chắc chắn muốn xóa ?')" 
                            CommandName="Del" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="10px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên lĩnh vực">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" Text='<%#Eval("Caption") %>' CommandArgument='<%#Eval("Id")%>'
                            CommandName="Select" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="width" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mô tả">
                    <ItemTemplate>
                        <asp:Label ID="lbContent" runat="server" Text='<%#Eval("Content") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Icon" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                    <ItemTemplate>
                        <img src='<%#Eval("Icon") %>' width="80" height="80" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hình ảnh" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                    <ItemTemplate>
                        <img src='<%#Eval("Image") %>' width="80" height="80" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Trạng thái" HeaderStyle-Width="120px">
                    <ItemTemplate>
                        <asp:Label ID="lbIsActive" runat="server" Text='<%#Eval("IsActive").ToString()=="True" ? "Hiển thị":"Ẩn" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#e4ffe4" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" BackColor="White" />
            <SelectedRowStyle BackColor="Lavender" Font-Bold="false" />
        </asp:GridView>
        <asp:HiddenField ID="hdId" runat="server" />
    </div>
        </div>
    </div>
          </section>
</asp:Content>
