<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu.ascx.cs" Inherits="control_menu" %>
<div class="hoz-menu">
    <div class="hozmenu-container">
        <div class="ma-nav-mobile-container">
            <div id="navbar-inner" class="navbar-inner navbar-inactive">
                <div class="menu-mobile">
                    <a class="btn btn-navbar navbar-toggle"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a><span class="brand navbar-brand">C'Fashion</span>
                </div>
                <ul id="ma-mobilemenu" class="mobilemenu nav-collapse collapse">
                    <li><span class="button-view1 collapse1"><a href="/home">C'Fashion</a></span>
                         <ul class="level2">
                            <li><span class=""><a href="/cfashion/16/Gioi-thieu-ve-C-Fashion.html">Giới thiệu về C'Fashion</a></span></li>
                            <li><span class=""><a href="/cfashion/17/Chinh-sach-khach-hang-than-thiet.html">Chính sách khách hàng thân thiết</a></span></li>
                            <li><span class=""><a href="/cfashion/18/Huong-dan-chon-Size-C-Fashion.html">Hướng dẫn chọn size</a></span></li>
                            <li><span class=""><a href="/cfashion/19/Huong-dan-mua-hang.html">Hướng dẫn mua hàng</a></span></li>
                             <li><span class=""><a href="/cfashion/20/Hinh-thuc-thanh-toan.html">Hình thức thanh toán</a></span></li>
                             <li><span class=""><a href="/cfashion/21/Huong-dan-giao-nhan-hang.html">Hướng dẫn giao hàng</a></span></li>
                             <li><span class=""><a href="/cfashion/22/Chinh-sach-doi-tra.html">Chính sách đổi trả</a></span></li>
                        </ul>
                    </li>
                    <li><span class=" button-view1 collapse1"><a href="/product">Sản phẩm</a></span>
                        <ul class="level2">
                            <asp:Literal ID="lbMenuMobile" runat="server"></asp:Literal>
                        </ul>
                    </li>
                    <li><span class=" button-view1 collapse1"><a href="/news">Tin tức</a></span>
                        <ul class="level2">
                            <li><span class="">
                                <a href="/news">Tin khuyến mại</a></span></li>
                            <li><span class=""><a href="/trend">Xu hướng</a>
                                </span></li>
                            <li><span class=""><a href="#">Lookbook</a>
                                </span></li>
                        </ul>
                    </li>
                    <%--<li><span class=""><a href="/sale">Khuyến mại</a></span></li>
                    <li><span class=""><a href="/trend">Xu hướng</a></span></li>--%>
                    <li><span class=""><a href="/showroom">Showroom</a></span></li>
                </ul>
            </div>
        </div>
        <div class="nav-container visible-lg visible-md">
            <div class="nav1">
                <div class="nav2">
                    <div id="pt_custommenu" class="pt_custommenu">

                        <div id="pt_menu255" class="pt_menu nav-1 pt_menu_had_child">
                            <div class="parentMenu">
                                <a href="/home"><span>C'Fashion</span> </a>
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
                                    <div class="block1">
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
                                                            <img src="/image/catalog/cmsblock/product01.jpg" alt="image"></a>
                                                    </div>
                                                </div>
                                                <div class="col col-sm-4">
                                                    <div class="image">
                                                        <a href="#">
                                                            <img src="/image/catalog/cmsblock/product04.jpg" alt="image"></a>
                                                    </div>
                                                </div>
                                                <div class="col col-sm-4">
                                                    <div class="image">
                                                        <a href="#">
                                                            <img src="/image/catalog/cmsblock/3-1.jpg" alt="image"></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="clearBoth">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--<div id="pt_menu_link68" class="pt_menu">
                            <div class="parentMenu">
                                <a href="/sale"><span>Khuyến mại</span></a>
                            </div>
                        </div>--%>

                        <div id="pt_menu_link30" class="pt_menu nav-1 pt_menu_had_child">
                            <div class="parentMenu">
                                <a href="#"><span>Tin tức </span></a>
                            </div>
		      	    <div id="popup251" class="popup" style="display: none;">
                                <div class="inner-popup">
                                        <div class="block1">
                                            <div class="inner-popup">
                                                <div class="block1" id="block1254">
                                                    <div class="column">
                                                        <div class="itemMenu level1" style="padding-bottom:20px;"><a class="itemMenuName level0 actParent" href="#"><span>Tin tức C'Fashion</span></a></div>
                                                        <div class="itemMenu level1" style="padding-bottom:20px;"><a class="itemMenuName level0 actParent" href="#"><span>Xu hướng</span></a></div>
                                                        <div class="itemMenu level1" style="padding-bottom:20px;"><a class="itemMenuName level0 actParent" href="#"><span>Lookbook</span></a></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearBoth">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="pt_menu_link31" class="pt_menu">
                                <div class="parentMenu">
                                    <a href="/showroom"><span>Showroom</span></a>
                                </div>
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
