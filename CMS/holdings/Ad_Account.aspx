<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true"
    CodeFile="Ad_Account.aspx.cs" Inherits="Ad_Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="pnanel" runat="server">
        <ContentTemplate>
            <section class="footer-section-1">
             <div class="container">
        <div class="heading-style-1">
            <h3>
                Quản trị người dùng</h3>
        </div>
        <div class="row">
            
            <div class="col-md-4 col-lg-4 col-sm-6">
                Tên đăng nhập (*)<br />
                <asp:TextBox ID="txtAccount" runat="server" MaxLength="50" CssClass="form-control" Width="99%" required=""></asp:TextBox>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                Tên người dùng (*)<br />
                <asp:TextBox ID="txtName" runat="server" MaxLength="50" CssClass="form-control" Width="99%" required=""></asp:TextBox>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                Mật khẩu<br />
                <asp:TextBox ID="txtPass" TextMode="Password" MaxLength="50" runat="server" CssClass="form-control" Width="99%" required=""></asp:TextBox>
            </div>
             
        </div>
        
         <div class="row">
            <div class="col-md-12 ">
                <br />
                <asp:CheckBox ID="ckActive" runat="server" Checked="true" Text="Kích hoạt tài khoản"></asp:CheckBox>
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
        <asp:GridView ID="gvAccount" Width="100%" runat="server" BackColor="White" BorderColor="#CCCCCC"
            AutoGenerateColumns="false" BorderStyle="None" BorderWidth="1px" CellPadding="3"
            EnableModelValidation="True" onrowcommand="gvAccount_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" Text='Xóa' CommandArgument='<%#Eval("Id")%>' OnClientClick="return confirm('Bạn chắc chắn muốn xóa ?')" 
                            CommandName="Del" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="10px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên tài khoản">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" Text='<%#Eval("Username") %>' CommandArgument='<%#Eval("Id")%>'
                            CommandName="Select" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="width" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên người dùng">
                    <ItemTemplate>
                        <asp:Label ID="lbName" runat="server" Text='<%#Eval("FullName") %>'></asp:Label>
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
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="pro" runat="server" AssociatedUpdatePanelID="pnanel">
    </asp:UpdateProgress>
</asp:Content>
