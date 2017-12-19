<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Ad_News.aspx.cs" Inherits="Ad_News" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<section class="footer-section-1">
    <div class="container">
        <div class="heading-style-1">
            <h3>
                Quản trị tin tức</h3>
        </div>
        <div class="row">
            <div class="col-md-4 col-lg-4 col-sm-6">
                Menu (*)<br />
                <asp:DropDownList ID="dlMenu" runat="server" CssClass="form-control" Width="99%">
                </asp:DropDownList>
            </div>
            <div class="col-md-8 col-lg-8 col-sm-6">
                Tiêu đề (*)<br />
                <asp:TextBox ID="txtTitle" runat="server" MaxLength="128" CssClass="form-control" Width="99%" required=""></asp:TextBox>
            </div>
            
        </div>
        <div class="row">
            <div class="col-md-12 ">
            Tóm tắt (*)<br />
                <asp:TextBox ID="txtDescription" runat="server" MaxLength="1024" CssClass="form-control" Width="99%" required=""></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 ">
                Nội dung (*)<br />
                <FCKeditorV2:FCKeditor ID="fckContent" Height="400px" SkinPath="skins/office2003/" ToolbarSet="Default" 
                runat="server" BasePath="~/fckeditor/" ></FCKeditorV2:FCKeditor>
            </div>
        </div>
         <div class="row">
            <div class="col-md-4 col-lg-4 col-sm-6">
                Hình ảnh (*)<br />
                <asp:FileUpload ID="fileImage" runat="server" />
                
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                Từ khóa<br />
                <asp:TextBox ID="txtTag" MaxLength="128" runat="server" CssClass="form-control" Width="98%"></asp:TextBox>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                <br />
                <asp:CheckBox ID="ckActive" runat="server" Checked="true" Text="Hiển thị bài viết"></asp:CheckBox>
            </div>
       </div>
       <div class="row">
            <div class="col-md-12 ">
            <br />
                <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" Text="Lưu bài viết" CssClass="btn btn-primary" />
                <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" runat="server" Visible="false" Text="Cập nhật bài viết" CssClass="btn btn-primary" />
                <asp:Button ID="btnCancel" OnClick="btnCancel_Click" runat="server" Text="Hủy bài viết" CssClass="btn btn-success" />
            </div>
        </div>
        
        <div class="row">
        
        <div style="margin: 10px 0px 5px 5px; max-height:500px; overflow-y:auto;">
        <asp:GridView ID="gvNews" Width="100%" runat="server" BackColor="White" BorderColor="#CCCCCC"
            AutoGenerateColumns="false" BorderStyle="None" BorderWidth="1px" CellPadding="3"
            EnableModelValidation="True" onrowcommand="gvNews_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" Text='Xóa' CommandArgument='<%#Eval("Id")%>' OnClientClick="return confirm('Bạn chắc chắn muốn xóa ?')" 
                            CommandName="Del" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="10px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tiêu đề bài viết">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" Text='<%#Eval("Title") %>' CommandArgument='<%#Eval("Id")%>'
                            CommandName="Select" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="width" />
                </asp:TemplateField>
                <asp:BoundField HeaderText="Ngày đăng" DataField="CreateAt" DataFormatString="{0:dd/MM/yyyy}" />
                
                <asp:TemplateField HeaderText="Menu" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label ID="lbMenu" runat="server" Text='<%#Eval("MenuName") %>'></asp:Label>
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
        <asp:HiddenField ID="hdMenuId" runat="server" />
    </div>
        </div>
    </div>
    </section>
</asp:Content>


