<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Ad_Menu.aspx.cs" Inherits="Ad_Menu" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="pnanel" runat="server">
        <ContentTemplate>
            <section class="footer-section-1">
             <div class="container">
        <div class="heading-style-1">
            <h3>
                Quản trị menu</h3>
        </div>
        <div class="row">
            <div class="col-md-4 col-lg-4 col-sm-6">
                Menu cha (*)<br />
                <asp:DropDownList ID="dlParentMenu" runat="server" CssClass="form-control" Width="95%">
                </asp:DropDownList>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                Tên menu (*)<br />
                <asp:TextBox ID="txtName" runat="server" MaxLength="50" CssClass="form-control" Width="95%" required=""></asp:TextBox>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                Thứ tự hiển thị (*)<br />
                <asp:TextBox ID="txtPosition" runat="server" CssClass="form-control" Width="95%" required=""></asp:TextBox>
                 <cc1:FilteredTextBoxExtender ID="ft1" runat="server" FilterType="Custom,Numbers" TargetControlID="txtPosition" ValidChars="." />
            </div>
        </div>
        
         <div class="row">
            <div class="col-md-8 col-lg-8 col-sm-6" style="display:none;">
                Liên kết<br />
                <asp:TextBox ID="txtLink" runat="server" MaxLength="50" CssClass="form-control" Width="98%"></asp:TextBox>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                <br />
                <asp:CheckBox ID="ckActive" runat="server" Checked="true" Text="Hiển thị menu"></asp:CheckBox>
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
        <div style="margin: 10px 0px 5px 5px; ">
        <asp:GridView ID="gvMenu" Width="100%" runat="server" BackColor="White" BorderColor="#CCCCCC"
            AutoGenerateColumns="false" BorderStyle="None" BorderWidth="1px" CellPadding="3"
            EnableModelValidation="True" onrowcommand="gvMenu_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" Text='Xóa' CommandArgument='<%#Eval("Id")%>' OnClientClick="return confirm('Bạn chắc chắn muốn xóa ?')" 
                            CommandName="Del" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="10px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên menu">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" Text='<%#Eval("Name") %>' CommandArgument='<%#Eval("Id")%>'
                            CommandName="Select" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="rows" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Menu cha">
                    <ItemTemplate>
                        <asp:Label ID="lbParentMenu" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="rows" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Đường dẫn" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lbMenu" runat="server" Text='<%#Eval("Link") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="rows" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Thứ tự hiển thị" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lbMenu3" runat="server" Text='<%#Eval("Position") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="rows" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Trạng thái" HeaderStyle-Width="120px">
                    <ItemTemplate>
                        <asp:Label ID="lbMenu2" runat="server" Text='<%#Eval("IsActive").ToString()=="True"?"Hiển thị":"Ẩn" %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="rows" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#e4ffe4" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" BackColor="White" />
            <SelectedRowStyle BackColor="Lavender" Font-Bold="false" />
        </asp:GridView>
        <asp:HiddenField ID="hdIdMenu" runat="server" />
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

