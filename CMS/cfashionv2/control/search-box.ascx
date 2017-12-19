<%@ Control Language="C#" AutoEventWireup="true" CodeFile="search-box.ascx.cs" Inherits="control_search_box" %>
<div class="box-options">
    <div class="top-search btn-group">
        <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
            <i class="icon ion-ios-search-strong"></i>
        </button>
        <div class="dropdown-menu">
            <div id="search-by-category">
                <div class="search-container">
                    <input type="text" name="search" id="text-search" value="" onkeypress="return runScript(event)" placeholder="Nhập từ khóa tìm kiếm"
                        class="" />
                </div>
                <div id="sp-btn-search" class="">
                    <a href="javascript:void(0);" id="btn-search-category" class="btn btn-default btn-lg" onclick="javascript:searchkeyword();">
                        Search
                    </a>
                </div>
                <div class="search-ajax">
                    <div class="ajax-loader-container" style="display: none;">
                        <img src="/image/catalog/AjaxLoader.gif" class="ajax-load-img" width="30" height="30"
                            alt="" />
                    </div>
                    <div class="ajax-result-container">
                        <!-- Content of search results -->
                    </div>
                </div>
                <input type="hidden" id="ajax-search-enable" value="1" />
            </div>
        </div>
    </div>
    <div class="setting btn-group">
        <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
            <i class="icon ion-person-stalker"></i>
        </button>
        <ul class="dropdown-menu">
            <li>
                <div class="box-content" id="top-links">
                    <ul class="ul-account list-unstyled">
                        <li><a id="ulregister" href="javascript:void(0);" onclick="ocajaxlogin.appendRegisterForm()">
                            <i class="ion-person-add"></i> Đăng kí</a></li>
                        <li><a id="ullogin" href="javascript:void(0);" onclick="ocajaxlogin.appendLoginForm()">
                            <i class="ion-locked"></i> Đăng nhập</a> </li>
                        <li><a id="uluser" href="/t/member/0" style="display: none;"><i class="ion-information-circled">
                        </i> Thông tin cá nhân</a> </li>
                        
                        <li><a id="ulorder" href="/t/member/2" style="display: none;"><i class="ion-android-checkbox-outline">
                        </i> Lịch sử đặt hàng</a> </li>
                        
                        <li><a id="ulbuy" href="/t/member/4" style="display: none;"><i class="fa fa-shopping-cart">
                        </i> Lịch sử mua hàng</a> </li>
                        
                        <li><a id="ulscore" href="/t/member/3" style="display: none;"><i class="ion-social-usd">
                        </i> Lịch sử tích điểm</a> </li>
                        <li><a id="ulchangepass" href="javascript:void(0);" style="display: none;" onclick="ocajaxlogin.appendChangePassForm()">
                            <i class="ion-android-refresh"></i> Đổi mật khẩu</a> </li>
                        <li><a id="ullogout" href="javascript:void(0);" style="display: none;" onclick="logout();">
                            <i class="ion-ios-unlocked"></i> Đăng xuất</a> </li>
                    </ul>
                </div>
            </li>
            <li class="currency">
                <form id="form-currency">
                </form>
            </li>
            <li class="language">
                <form id="form-language">
                </form>
            </li>
        </ul>
    </div>
    <%--<a href="#" id="wishlist-total" class="btn-group" title="Wish List"><i class="icon ion-heart"></i><span>0</span></a>--%>
    <div id="cart" class="btn-group btn-block">
        <button type="button" data-toggle="dropdown" data-loading-text="Loading..." class="btn btn-inverse btn-block btn-lg dropdown-toggle">
            <i class="icon ion-bag"></i><span id="cart-total"><span class="item-cart">0</span></span></button>
        <ul class="dropdown-menu pull-right" id="ulcart">
            <li class="has-scroll" runat="server" id="liCart">
                <asp:Literal ID="lbCart" runat="server"></asp:Literal>
            </li>
            <li runat="server" id="liEmpty">
                <p class="text-center cart-empty">
                    Không có sản phẩm nào trong giỏ hàng</p>
            </li>
            <li runat="server" id="sfooter">
                <div>
                    <table class="table">
                        <tr>
                            <td class="text-right">
                                <strong>Tổng tiền :</strong>
                            </td>
                            <td class="text-right" id="totalprice_cart">
                                <asp:Literal ID="lbTotal" runat="server"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </div>
                <p class="text-center cart-button">
                    <a href="/cart"><strong>Giỏ hàng <i class="fa fa-angle-right"></i></strong></a><a
                        href="/order"><strong>Thanh toán<i class="fa fa-angle-right"></i></strong></a></p>
            </li>
        </ul>
    </div>
    <div class="clearfix">
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        var flag = false;
        var ajax_search_enable = $('#ajax-search-enable').val();

        var current_cate_value = $('ul.cate-items li.selected').data('value');
        var current_cate_text = $('ul.cate-items li.selected').html();

        $('.cate-selected').attr('data-value', current_cate_value);
        $('.cate-selected').html(current_cate_text);

        $('.hover-cate p').click(function () {
            $(".cate-items").toggle("slow");
        });

        $('.ajax-result-container').hover(
                                            function () {
                                                flag = true;
                                            },
                                            function () {
                                                flag = false;
                                            }
                                        );

        $('.hover-cate').hover(
                                            function () {
                                                flag = true;
                                            },
                                            function () {
                                                flag = false;
                                            }
                                        );
    });    
</script>
 <script type="text/javascript">
     function runScript(e) {
         if (e.keyCode == 13) {
             searchkeyword();
         }
     }
     function searchkeyword() {
         var s = document.getElementById("text-search");
         if (s.value.length == 0) {
             showAlert('Nhập từ khóa tìm kiếm');
         }
         else {
             window.location.href = '/search/?k=' + encodeURI(s.value);
         }
     }
</script>
