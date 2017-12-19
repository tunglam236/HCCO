<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Ad_Slide.aspx.cs" Inherits="Ad_Slide" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<section class="footer-section-1">
             <div class="container">
        <div class="heading-style-1">
            <h3>
                Quản trị Slide</h3>
        </div>
        <div class="row">
            <div class="col-md-4 col-lg-4 col-sm-6">
                Hình ảnh Slide(<i>Size 1920 x 900</i>)<br />
                <asp:FileUpload ID="fuImage" runat="server" />
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                Tiêu đề 1 (*)<br />
                <asp:TextBox ID="txtCaption" MaxLength="30" runat="server" CssClass="form-control" Width="95%"></asp:TextBox>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                Định dạng (*)<br />
                <asp:TextBox ID="txtStyle1" runat="server" MaxLength="512" Text="font-family: Roboto Slab; font-size: 90px; color: #ffffff; font-weight:bold;" CssClass="form-control" Width="90%"></asp:TextBox>
            </div>
        </div>
        
         <div class="row">
            <div class="col-md-4 col-lg-4 col-sm-6">
                Tiêu đề 2<br />
                <asp:TextBox ID="txtContent" MaxLength="30" runat="server" CssClass="form-control" Width="98%"></asp:TextBox>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                Định dạng<br />
                <asp:TextBox ID="txtStyle2" runat="server" MaxLength="512" Text="font-family: Roboto Slab; font-size: 80px; color: #ffffff;" CssClass="form-control" Width="98%"></asp:TextBox>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6">
                <br />
                <asp:RadioButton ID="ckType1" runat="server" Checked="true" GroupName="Type" Text="Slide lớn"></asp:RadioButton>
                <asp:RadioButton ID="ckType2" runat="server" GroupName="Type" Text="Slide nhỏ"></asp:RadioButton>
                
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
                    <asp:CheckBox ID="ckActive" runat="server" Checked="true" Text="Hiển thị slide"></asp:CheckBox>
            </div>
        </div>
        <div class="row">
        <div style="margin: 10px 0px 5px 5px; ">
        <asp:GridView ID="gvSlide" Width="100%" runat="server" BackColor="White" BorderColor="#CCCCCC"
            AutoGenerateColumns="false" BorderStyle="None" BorderWidth="1px" CellPadding="3"
            EnableModelValidation="True" onrowcommand="gvSlide_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" Text='Xóa' CommandArgument='<%#Eval("Id")%>' OnClientClick="return confirm('Bạn chắc chắn muốn xóa ?')" 
                            CommandName="Del" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="10px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tiêu đề 1">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" Text='<%#Eval("Caption") %>' CommandArgument='<%#Eval("Id")%>'
                            CommandName="Select" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Định dạng 1" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lbStyle1" runat="server" Text='<%#Eval("Style1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Tiêu đề 2">
                    <ItemTemplate>
                         <asp:Label ID="lbContent" runat="server" Text='<%#Eval("Caption") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Định dạng 2" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lbStyle2" runat="server" Text='<%#Eval("Style2") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Loại Slide" HeaderStyle-Width="120px">
                    <ItemTemplate>
                        <asp:Label ID="lbType" runat="server" Text='<%#Eval("Type").ToString()=="True" ? "Slide lớn":"Slide nhỏ" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hình ảnh" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="80px">
                    <ItemTemplate>
                        <a href='#'><img src='<%#Eval("Image") %>' width="120" height="90" class="popimg" /></a>
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
          <div class="modal fade" id="imagemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">              
      <div class="modal-body">
      	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <img src="" class="imagepreview" style="width: 100%;" >
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
    $(function () {
        $('.popimg').on('click', function () {
            $('.imagepreview').attr('src', $(this).find('img').attr('src'));
            $('#imagemodal').modal('show');
        });
    });
</script>
</asp:Content>

