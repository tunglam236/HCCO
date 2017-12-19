<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Ad_Feedback.aspx.cs" Inherits="Ad_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
    .width{ min-width:200px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <section class="footer-section-1">
             <div class="container">
        <div class="heading-style-1">
            <h3>
                Quản trị feedback</h3>
        </div>
        <div class="row">
            
            <div class="col-md-4 col-lg-4 col-sm-6">
                Tên (*)<br />
                <asp:TextBox ID="txtName" runat="server" MaxLength="50" CssClass="form-control" Width="95%" required=""></asp:TextBox>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                Chức vụ<br />
                <asp:TextBox ID="txtPosition" runat="server" MaxLength="50" CssClass="form-control" Width="95%" required=""></asp:TextBox>
            </div>
             <div class="col-md-4 col-lg-4 col-sm-6">
                Hình ảnh (<i>Size 243 x 320</i>*)<br />
                <asp:FileUpload ID="fuImage" runat="server" />
            </div>
        </div>
        
         <div class="row">
            <div class="col-md-8 col-lg-8 col-sm-6">
                Nội dung<br />
                <asp:TextBox ID="txtContent" TextMode="MultiLine" MaxLength="512" Rows="6" runat="server" CssClass="form-control" Width="98%"></asp:TextBox>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                <br />
                <asp:CheckBox ID="ckActive" runat="server" Checked="true" Text="Hiển thị"></asp:CheckBox>
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
        <asp:GridView ID="gvFeedback" Width="100%" runat="server" BackColor="White" BorderColor="#CCCCCC"
            AutoGenerateColumns="false" BorderStyle="None" BorderWidth="1px" CellPadding="3"
            EnableModelValidation="True" onrowcommand="gvFeedback_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" Text='Xóa' CommandArgument='<%#Eval("Id")%>' OnClientClick="return confirm('Bạn chắc chắn muốn xóa ?')" 
                            CommandName="Del" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="10px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Họ tên">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" Text='<%#Eval("Name") %>' CommandArgument='<%#Eval("Id")%>'
                            CommandName="Select" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="width" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Chức vụ">
                    <ItemTemplate>
                        <asp:Label ID="Label1" Text='<%#Eval("Position") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="width" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nội dung">
                    <ItemTemplate>
                        <asp:Label ID="lbContent" runat="server" Text='<%#Eval("Content") %>'></asp:Label>
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

