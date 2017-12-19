<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Ad_ChangePass.aspx.cs" Inherits="Ad_ChangePass" %>

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
                Thay đổi mật khẩu</h3>
        </div>
        <div class="row">
            
            <div class="col-md-12 ">
                Tên đăng nhập (*)<br />
                <asp:TextBox ID="txtAccount" runat="server" MaxLength="50" ReadOnly="true" CssClass="form-control" Width="99%" required=""></asp:TextBox>
            </div>
           <div class="col-md-12 ">
                Mật khẩu cũ<br />
                <asp:TextBox ID="txtpw" TextMode="Password" MaxLength="50" runat="server" CssClass="form-control" Width="99%" required=""></asp:TextBox>
            </div>
            <div class="col-md-12 ">
                Mật khẩu mới<br />
                <asp:TextBox ID="txtPass1" TextMode="Password" MaxLength="50" runat="server" CssClass="form-control" Width="99%" required=""></asp:TextBox>
            </div>
            <div class="col-md-12 ">
                Nhập lại mật khẩu mới<br />
                <asp:TextBox ID="txtPass2" TextMode="Password" MaxLength="50" runat="server" CssClass="form-control" Width="99%" required=""></asp:TextBox>
            </div>
        </div>
       <div class="row">
            <div class="col-md-12 ">
            <br />
                <asp:Button ID="btnSave" runat="server" Text="Thay đổi mật khẩu" CssClass="btn btn-primary" 
                    onclick="btnSave_Click" />
            </div>
        </div>
    </div>
          </section>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="pro" runat="server" AssociatedUpdatePanelID="pnanel">
    </asp:UpdateProgress>
</asp:Content>

