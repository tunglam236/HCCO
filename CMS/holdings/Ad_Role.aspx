<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true"
    CodeFile="Ad_Role.aspx.cs" Inherits="Ad_Role" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .user
        {
            cursor: pointer;
            padding-bottom: 10px;
        }
    </style>
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
                Phân quyền người dùng</h3>
        </div>
            <div>
                <div style="margin: 10px 0px 5px 5px;">
                    <div class="row" style="margin-bottom: 5px;">
                        <div class="col-md-3 col-lg-3 col-sm-6">
                            Chọn người dùng
                            <asp:DropDownList ID="dlUser" AutoPostBack="true" runat="server" 
                                CssClass="form-control" 
                                onselectedindexchanged="dlUser_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-9 col-lg-9 col-sm-6">
                            <br />
                            <asp:Button ID="btnSave" runat="server" Text="Cập nhật" 
                                CssClass="btn btn-primary" onclick="btnSave_Click" />
                        </div>
                    </div>
                    <asp:GridView ID="gvRole" Width="100%" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        AutoGenerateColumns="false" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                        EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lbId" Text='<%#Eval("ID")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Module">
                                <ItemTemplate>
                                    <asp:Label ID="lbCode" Text='<%#Eval("ModuleCode")%>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Xem" ItemStyle-Width="130px">
                                <ItemTemplate>
                                    <asp:CheckBox ID="ckView" runat="server" Checked='<%#Eval("sView") %>'></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Thêm" ItemStyle-Width="130px">
                                <ItemTemplate>
                                    <asp:CheckBox ID="ckInsert" runat="server" Checked='<%#Eval("sInsert") %>'></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sửa" ItemStyle-Width="130px">
                                <ItemTemplate>
                                    <asp:CheckBox ID="ckModifie" runat="server" Checked='<%#Eval("sModifie") %>'></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Xóa" ItemStyle-Width="130px">
                                <ItemTemplate>
                                    <asp:CheckBox ID="ckDel" runat="server" Checked='<%#Eval("sDel") %>'></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#e4ffe4" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" BackColor="White" />
                        <SelectedRowStyle BackColor="Lavender" Font-Bold="false" />
                    </asp:GridView>
                    <asp:HiddenField ID="hdUser" runat="server" />
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
