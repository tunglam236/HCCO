<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="pnanel" runat="server">
        <ContentTemplate>
            <div id="banner">
                <div id="inner-banner">
                    <h1>
                        Đăng nhập hệ thống
                    </h1>
                    <div class="breadcrumb-area">
                        <ul class="breadcrumb">
                            <li class=""><a href="/home">Trang chủ</a> </li>
                            <li class="current">Đăng nhập hệ thống</li></ul>
                    </div>
                </div>
            </div>
            <div class="">
                <div class="main-content margin-top-bottom-cp">
                    <div class="page_content">
                        <div class="container">
                            <div class="row">
                                <div id="block_content_first" class="col-md-12">
                                    <div class="container-res">
                                        <div class="row">
                                            <div class="">
                                                <div id="post-430" class="post-430 page type-page status-publish hentry">
                                                    <a href="http://architecture.crunchpress.com/login/"></a>
                                                    <div class="entry-content-cp">
                                                        <section class="cp-login padding-tb-60">
                                    <div class="container">
                                       <div class="holder">
                                          <div class="row" style="margin-top:-78px;">
                                             <div class="col-md-12">
                                                <section class="register-section">
                                                   <div class="container">
                                                      <div class="holder">
                                                      <img width="155px" height="106px" src="wp-content/uploads/2017/02/Logo - 175x120px-01.jpg" />
                                                            <p class="login-username">
                                                               <label for="user_login"></label>
                                                               <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" required="" placeholder="Tên truy cập"></asp:TextBox>
                                                            </p>
                                                            <p class="login-password">
                                                               <label for="user_pass"></label>
                                                               <asp:TextBox ID="txtPass" TextMode="Password" runat="server" required="" CssClass="form-control" placeholder="Mật khẩu"></asp:TextBox>
                                                            </p>
                                                            
                                                            <p class="login-submit">
                                                            <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" 
                                                                    CssClass="btn btn-primary" onclick="btnLogin_Click" />
                                                            </p>
                                                         <strong>Bạn quên mật khẩu ? <a href="#">Liên hệ Admin</a></strong>
                                                      </div>
                                                   </div>
                                                </section>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </section>
                                                    </div>
                                                </div>
                                                <div class="comment-box">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
         <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnLogin" EventName="Click" />
            </Triggers>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="pro" runat="server" AssociatedUpdatePanelID="pnanel">
    </asp:UpdateProgress>
</asp:Content>

