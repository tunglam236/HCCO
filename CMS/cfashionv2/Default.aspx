<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register TagPrefix="urow1" TagName="Row1" Src="/control/below-banner.ascx" %>
<%@ Register TagPrefix="urow2" TagName="Row2" Src="/control/product-feature.ascx" %>
<%@ Register TagPrefix="uRow3" TagName="Row3" Src="/control/below-product.ascx" %>
<%@ Register TagPrefix="ucorporate" TagName="Corporate" Src="/control/corporate.ascx" %>
<%@ Register TagPrefix="uproducts" TagName="Products" Src="/control/product.ascx" %>
<%@ Register TagPrefix="unews" TagName="News" Src="/control/news.ascx" %>
<%@ Register TagPrefix="ubanner" TagName="Banner" Src="/control/banner.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="hp" runat="Server">
    <div class="main-row full-width">
        <div class="container">
            <div class="row">
                <div class="main-col col-sm-12 col-md-12">
                    <div class="row sub-row">
                        <div class="sub-col col-sm-12 col-md-12">
                            <div id="ajax-login-block">
                            </div>
                            <div id="ajax-loader">
                                <img src="/image/catalog/AjaxLoader.gif" alt="" />
                            </div>
                            <ubanner:Banner ID="ubanner" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <urow1:Row1 ID="urows1" runat="server" />
    <urow2:Row2 ID="uRow2" runat="server" />
    <uRow3:Row3 ID="uRow3" runat="server" />
    <ucorporate:Corporate ID="ucorporate" runat="server" />
    <uproducts:Products ID="Products" runat="server" />
    <div class="banner-static static-bottom-melani1" style="padding:10px;">
         <div class="row">
            <div class="col-lg-2 col-sm-3 col-xs-12" style="padding:0px; margin-left:15px; margin-right:25px;">
                <div class="image">
                    <a href="#">
                        <img src="image/catalog/frame3/F3 1.jpg" alt="image">
                    </a>
                </div>
            </div>
            <div class="col-lg-2 col-sm-3 col-xs-12" style="padding:0px;margin-left:15px;margin-right:25px;">
                <div class="image">
                    <a href="#">
                        <img src="image/catalog/frame3/F3 2.jpg" alt="image">
                    </a>
                </div>
            </div>
            <div class="col-lg-2 col-sm-3 col-xs-12" style="padding:0px;margin-left:15px;margin-right:25px;">
                <div class="image">
                    <a href="#">
                        <img src="image/catalog/frame3/F3 3.jpg" alt="image">
                    </a>
                </div>
            </div>
            <div class="col-lg-2 col-sm-3 col-xs-12" style="padding:0px;margin-left:15px;margin-right:25px;">
                <div class="image">
                    <a href="#">
                        <img src="image/catalog/frame3/F3 4.jpg" alt="image">
                    </a>
                </div>
            </div>
              <div class="col-lg-2 col-sm-3 col-xs-12" style="padding:0px;margin-left:15px;margin-right:25px;">
                <div class="image">
                    <a href="#">
                        <img src="image/catalog/frame3/F3 5.jpg" alt="image">
                    </a>
                </div>
            </div>
             
        </div>
    </div>
    <unews:News ID="uNews" runat="server" />
     <script type="text/javascript">
         $(document).ready(function () {
             $.ajax({
                 type: 'POST',
                 url: '/Query.aspx/check_logined',
                 data: '',
                 contentType: 'application/json; charset=utf-8',
                 dataType: 'json',
                 success: function (data) {
                     if (data.d) {
                         var u6 = document.getElementById("uluser");
                         var u5 = document.getElementById("ulorder");
                         var u4 = document.getElementById("ullogout");
                         var u7 = document.getElementById("ulscore");
                         var u71 = document.getElementById("ulbuy");
                         var u8 = document.getElementById("ulchangepass");

                         var u1 = document.getElementById("ulregister");
                         var u2 = document.getElementById("ullogin");
                         u1.style.display = "none";
                         u2.style.display = "none";
                         u4.style.display = "block";
                         u5.style.display = "block";
                         u6.style.display = "block";
                         u7.style.display = "block";
                         u71.style.display = "block";
                         u8.style.display = "block";
                     }
                     else {
                         var u8 = document.getElementById("ulchangepass");
                         var u7 = document.getElementById("ulscore");
                         var u71 = document.getElementById("ulbuy");
                         var u6 = document.getElementById("uluser");
                         var u5 = document.getElementById("ulorder");
                         var u4 = document.getElementById("ullogout");

                         var u1 = document.getElementById("ulregister");
                         var u2 = document.getElementById("ullogin");
                         u1.style.display = "block";
                         u2.style.display = "block";

                         u4.style.display = "none";
                         u5.style.display = "none";
                         u6.style.display = "none";
                         u7.style.display = "none";
                         u71.style.display = "none";
                         u8.style.display = "none";
                     }
                     
                 }
             });
         });
    </script>
    <script type="text/javascript">
        function addCart(id, name, quantity, img,price,sale) {
            $.ajax({
                type: 'POST',
                url: '/Query.aspx/addCartByProductId',

                data: '{"id":"' + id + '","name":"' + name + '","quantity":"' + quantity + '","sale":"'+sale+'"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {

                    var totalquantity = document.getElementsByClassName("item-cart");
                    totalquantity[0].innerHTML = data.d._content;
                    showAlert(data.d._mess);

                    additem(name.replace(' ', '-'), img, id, name, quantity, price);
                }
            });
        }
        function additem(code, img, id, name, quantity, price) {
            var c = document.getElementById("usearch_liCart");
            if (c) {
                var html = "";
                html += "<tr>";
                html += "<td class='text-center'><a href='/detail/" + id + "/" + code + ".html'><img src='" + img + "' alt='" + name + "' width='100px' height='100px' title='" + name + "'></a></td>";
                html += "<td class='text-left info-item'>";
                html += "<a class='cart-name' href='/detail/" + id + "/" + code + ".html'>" + name + "</a>";
                html += "<p class='cart-quantity'>" + quantity + " x </p>";
                html += "<p class='cart-price'> " + price + "</p>";
                html += "</td>";
                html += "</tr>";
                $("#usearch_liCart table tbody").append(html);
            }
            else {
                var h = document.getElementById("usearch_liEmpty");
                if (h)
                    h.style.display = "none";

                var html = "";
                html += "<table class='table'>";
                html += "<tbody>";
                html += "<tr>";
                html += "<td class='text-center'><a href='/detail/" + id + "/" + code + ".html'><img src='" + img + "' alt='" + name + "' width='100px' height='100px' title='" + name + "'></a></td>";
                html += "<td class='text-left info-item'>";
                html += "<a class='cart-name' href='/detail/" + id + "/" + code + ".html'>" + name + "</a>";
                html += "<p class='cart-quantity'>" + quantity + " x </p>";
                html += "<p class='cart-price'> " + price + "</p>";
                html += "</td>";
                html += "</tr>";
                html += " </tbody>";
                html += "</table>";
                $("#ulcart").append("<li id='usearch_liCart' class='has-scroll'>" + html + "</li>");

                var total = "";
                total += "<li id='usearch_sfooter'><div></div>";
                total += "<p class='text-center cart-button'><a href='/cart'><strong>Giỏ hàng <i class='fa fa-angle-right'></i></strong>";
                total += "</a><a href='/order'><strong>Thanh toán<i class='fa fa-angle-right'></i></strong></a></p></li>";

                $("#ulcart").append(total);
            }
        }
        function logout() {
            $.ajax({
                type: 'POST',
                url: '/Query.aspx/logout',
                data: '',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    setuserinfo(false);
                }
            });
        }
        function changepassword() {
            var email = document.getElementById("hp_ubanner_emailforgot");
            var pwold = document.getElementById("hp_ubanner_passwordold");
            var pw1 = document.getElementById("hp_ubanner_passwordnew");
            var pw2 = document.getElementById("hp_ubanner_passwordnew2");
            if (email.value.length == 0 || pwold.value.length == 0 || pw1.value.length == 0 || pw2.value.length == 0)
                alert('Nhập đầy đủ thông tin đăng nhập và mật khẩu');
            else if (pw1.value != pw2.value)
                alert('Mật khẩu xác nhận không trùng khớp');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/changePassword',
                    data: '{"email":"' + email.value + '","passold":"' + pwold.value + '","passnew":"' + pw1.value + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        email.value = '';
                        pwold.value = '';
                        pw1.value = '';
                        pw2.value = '';
                        alert(data.d._mess);
                    }
                });
            }
        }
        function forgotpassword() {
            var email = document.getElementById("email-forgot");
            if (email.value.length == 0)
                alert('Nhập địa chỉ email của bạn để khôi phục mật khẩu');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/resetPassword',
                    data: '{"email":"' + email.value + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        email.value = '';
                        alert(data.d._mess);
                    }
                });
            }
        }
        function setuserinfo(signed) {
            if (signed) {
                var u6 = document.getElementById("uluser");
                var u5 = document.getElementById("ulorder");
                var u4 = document.getElementById("ullogout");
                var u7 = document.getElementById("ulscore");
                var u71 = document.getElementById("ulbuy");
                var u8 = document.getElementById("ulchangepass");

                var u1 = document.getElementById("ulregister");
                var u2 = document.getElementById("ullogin");
                u1.style.display = "none";
                u2.style.display = "none";
                u4.style.display = "block";
                u5.style.display = "block";
                u6.style.display = "block";
                u7.style.display = "block";
                u71.style.display = "block";
                u8.style.display = "block";
            }
            else {
                var u8 = document.getElementById("ulchangepass");
                var u7 = document.getElementById("ulscore");
                var u71 = document.getElementById("ulbuy");
                var u6 = document.getElementById("uluser");
                var u5 = document.getElementById("ulorder");
                var u4 = document.getElementById("ullogout");

                var u1 = document.getElementById("ulregister");
                var u2 = document.getElementById("ullogin");
                u1.style.display = "block";
                u2.style.display = "block";

                u4.style.display = "none";
                u5.style.display = "none";
                u6.style.display = "none";
                u7.style.display = "none";
                u71.style.display = "none";
                u8.style.display = "none";
            }
        }
        function client_login() {
            var email = document.getElementById("hp_ubanner_inputemail");
            var pw = document.getElementById("hp_ubanner_inputpassword");
            if (email.value.length == 0 || pw.value.length == 0) {
                alert('Nhập thông tin đăng nhập và mật khẩu');
                return false;
            }
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/check_login',
                    data: '{"us":"' + email.value + '","pw":"' + pw.value + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d.Ok) {
                            setuserinfo(true);
                            alert(data.d.Mess);
                            email.value = '';
                            pw.value = '';
                            ocajaxlogin.closeForm();
                        }
                        else alert(data.d.Mess);
                    }
                });
            }
        }
        function client_register() {
            var user  = document.getElementById("hp_ubanner_txtuser");
            var email = document.getElementById("hp_ubanner_txtemail");
            var pw = document.getElementById("hp_ubanner_txtpassword");
            var pwc = document.getElementById("hp_ubanner_txtpassconfirm");
            var name = document.getElementById("hp_ubanner_txtname");
            var sex = document.getElementById("hp_ubanner_dlsex");
            var birth = document.getElementById("hp_ubanner_txtbirth");
            var phone = document.getElementById("hp_ubanner_txttelephone");
            var country = document.getElementById("hp_ubanner_dlcountry_login");
            var district = document.getElementById("hp_ubanner_dldistrict_login");
            var add = document.getElementById("hp_ubanner_txtaddress");

            var sexid = $("#hp_ubanner_dlsex").val();
            var cid = $("#hp_ubanner_dlcountry_login").val();
            var cname = $('#hp_ubanner_dlcountry_login option:selected').text()

            var did = $("#hp_ubanner_dldistrict_login").val();
            var dname = $('#hp_ubanner_dldistrict_login option:selected').text()

            if (email.value.length == 0 || pw.value.length == 0 || pwc.value.length == 0 || name.value.length == 0) {
                alert('Nhập đầy đủ các trường yêu cầu (*)');
                return false;
            }
            else if (pw.value != pwc.value) {
                alert('Mật khẩu xác nhận không trùng khớp'); 
                return false;
            }
            else if (pw.value.length < 6 || pwc.value.length < 6) {
                alert('Nhập mật khẩu trên 6 kí tự');
                return false;
            }
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/check_register',
                    data: '{"user":"' + user.value + '","name":"' + name.value + '","email":"' + email.value + '","pw":"' + pw.value + '","sex":"' + sexid + '","phone":"' + phone.value + '","birth":"' + birth.value + '","add":"' + add.value + '","country":"' + cid + '","countryname":"' + cname + '","district":"' + did + '","districtname":"' + dname + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d._content == 'ok') {
                            $("#hp_ubanner_txtuser").val("");
                            $("#hp_ubanner_txtemail").val("");
                            $("#hp_ubanner_txtpassword").val("");
                            $("#hp_ubanner_txtpassconfirm").val("");
                            $("#hp_ubanner_txtname").val("");
                            $("#hp_ubanner_txtbirth").val("");
                            $("#hp_ubanner_txttelephone").val("");
                            $("#hp_ubanner_txtaddress").val("");
                            alert(data.d._mess);
                            ocajaxlogin.closeForm();
                        }
                        else alert(data.d._mess);
                    }
                });
            }
        }
    </script>
</asp:Content>
