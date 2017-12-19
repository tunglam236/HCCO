<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu.ascx.cs" Inherits="control_menu" %>
<div class="hoz-menu">
    <div class="hozmenu-container">
        <div class="ma-nav-mobile-container">
            <div id="navbar-inner" class="navbar-inner navbar-inactive">
                <div class="menu-mobile">
                    <a class="btn btn-navbar navbar-toggle"><span class="icon-bar"></span><span class="icon-bar">
                    </span><span class="icon-bar"></span></a><span class="brand navbar-brand">C'NICE - Shop of Nature</span>
                </div>
                <ul id="ma-mobilemenu" class="mobilemenu nav-collapse collapse">
                    <li><span class=""><a href="/home">Trang chủ</a></span></li>
                    <li><span class=" button-view1 collapse1"><a href="/product">Sản phẩm</a></span>
                        <ul class="level2">
                            <asp:Literal ID="lbMenuMobile" runat="server"></asp:Literal>
                        </ul>
                    </li>
                    <li><span class=""><a href="/sale">Khuyến mại</a></span></li>
                    <li><span class=""><a href="/news">Tin tức</a></span></li>
                    <li><span class=""><a href="/showroom">Showroom</a></span></li>
                </ul>
            </div>
        </div>
        <div class="nav-container visible-lg visible-md">
            <div class="nav1">
                <div class="nav2">
                    <div id="pt_custommenu" class="pt_custommenu">
                        <%--<div id="pt_menu_home" class="pt_menu">
                            <div class="parentMenu">
                                <a href="/home"><span style="color:#333;">Trang chủ</span></a></div>
                        </div>--%>
                         <div id="pt_menu255" class="pt_menu nav-1 pt_menu_had_child">
                            <div class="parentMenu">
                                <a href="/home"><span>C'Nice</span> </a>
                            </div>
                            <div id="popup259" class="popup" style="display: none; width: 1228px;">
                                <div class="inner-popup">
                                    <div class="block1">
                                        <asp:Literal ID="lbCF" runat="server"></asp:Literal>
                                    <div class="clearBoth">
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="pt_menu254" class="pt_menu nav-1 pt_menu_had_child">
                            <div class="parentMenu">
                                <a href="/product"><span>Sản phẩm</span> </a>
                            </div>
                            <div id="popup254" class="popup" style="display: none; width: 1228px;">
                                <div class="inner-popup">
                                    <div class="block1" id="block1254">
                                    <asp:Literal ID="lbMenu" runat="server"></asp:Literal>
                                    <div class="clearBoth">
                                    </div>
                                    </div>
                                    <div class="block2" id="block2254">
                                        <div class="banner-static static-menu">
                                            <div class="row">
                                                <div class="col col-sm-4">
                                                    <div class="image">
                                                        <a href="#">
                                                            <img src="/image/catalog/cmsblock/img1-menu.jpg" alt="image"></a></div>
                                                </div>
                                                <div class="col col-sm-4">
                                                    <div class="image">
                                                        <a href="#">
                                                            <img src="/image/catalog/cmsblock/img2-menu.jpg" alt="image"></a></div>
                                                </div>
                                                <div class="col col-sm-4">
                                                    <div class="image">
                                                        <a href="#">
                                                            <img src="/image/catalog/cmsblock/img3-menu.jpg" alt="image"></a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="pt_menu_link68" class="pt_menu">
                            <div class="parentMenu">
                                <a href="/sale"><span>Khuyến mại</span></a></div>
                        </div>
                       
                        <div id="pt_menu_link30" class="pt_menu">
                            <div class="parentMenu">
                                <a href="/news"><span>Tin tức</span></a></div>
                        </div>
                        <div id="pt_menu_link31" class="pt_menu">
                            <div class="parentMenu">
                                <a href="/showroom"><span>Showroom</span></a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var body_class = $('body').attr('class');
        if (body_class.search('common-home') != -1) {
            $('#pt_menu_home').addClass('act');
        }
        var CUSTOMMENU_POPUP_EFFECT = 0;
        var CUSTOMMENU_POPUP_TOP_OFFSET = 70
    </script>
</div>
