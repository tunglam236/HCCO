<%@ Control Language="C#" AutoEventWireup="true" CodeFile="banner.ascx.cs" Inherits="control_banner" %>
<div class="ajax-body-login">
    <div class="account-login">
        <a href="javascript:void(0);" class="a-close-frm" onclick="ocajaxlogin.closeForm();">
            <span>X</span></a>
        <div class="ajax-content">
            <div class="ajax-container">
                <div class="login-form-content">
                    <h2>Đăng nhập</h2>
                    <div id="ajax-login-form">
                    <div class="form-group">
                        <label class="control-label" for="inputemail">
                            Tên truy cập hoặc số điện thoại</label>
                        <input type="text" name="email" runat="server" maxlength="64" placeholder="" id="inputemail"
                            class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="inputpassword">
                            Mật khẩu</label>
                        <input type="password" name="password" runat="server" maxlength="64" placeholder="" id="inputpassword"
                            class="form-control" />
                        <a class="forgotten" href="javascript:void(0)" onclick="ocajaxlogin.appendForgotPassForm()">Bạn quên mật khẩu</a>
                    </div>
                    <div class="action">
                    <button class="button" type="button" onclick="client_login()">
                            <span>Đăng nhập</span></button>
                        <button class="button" type="button" onclick="ocajaxlogin.appendRegisterForm()">
                            <span>Tạo tài khoản mới</span></button>
                    </div>
                    <div class="ajax-loader-container" style="display: none;">
                    <img src="/image/catalog/AjaxLoader.gif" class="ajax-load-img" width="30" height="30" alt="plazathemes.com" />
                </div>                    </div>
                </div>
            </div>
            
        </div>
    </div>
    <div class="account-register">
        <a href="javascript:void(0);" class="a-close-frm" onclick="ocajaxlogin.closeForm();">
            <span>X</span></a>
        <div class="ajax-content">
            <div class="ajax-container">
                <div class="register-form-content">
                    <h1>
                        Đăng kí thành viên</h1>
                    <p>
                        Nếu bạn đã có tài khoản, hãy click <a onclick="ocajaxlogin.appendLoginForm()"
                            href="javascript:void(0);">vào đây</a> để đăng nhập.</p>
                    <div id="ajax-register-form"
                    class="form-horizontal">
                    <fieldset>
                        <legend>Tài khoản</legend>
                        <div class="form-group required">
                            <label class="col-sm-4 control-label" for="username">
                                Tên đăng nhập</label>
                            <div class="col-sm-8">
                                <input type="text" name="username" runat="server" placeholder="Viết liền không dấu hoặc nhập số điện thoại" id="txtuser"
                                    class="form-control" />
                            </div>
                        </div> 
                        <div class="form-group required">
                            <label class="col-sm-4 control-label" for="txtemail">
                                E-mail</label>
                            <div class="col-sm-8">
                                <input type="text" name="email" runat="server" placeholder="Dùng để khôi phục mật khẩu" id="txtemail"
                                    class="form-control" />
                            </div>
                        </div>

                        <div class="form-group required">
                            <label class="col-sm-4 control-label" for="txtpassword">
                                Mật khẩu</label>
                            <div class="col-sm-8">
                                <input type="password" name="password" runat="server" placeholder="Mật khẩu ít nhất 6 kí tự" id="txtpassword"
                                    class="form-control" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-4 control-label" for="txtpassconfirm">
                                Nhập lại mật khẩu</label>
                            <div class="col-sm-8">
                                <input type="password" name="confirm" runat="server" placeholder="Xác nhận lại mật khẩu" id="txtpassconfirm"
                                    class="form-control" />
                            </div>
                        </div>
                    </fieldset>

                    <fieldset id="account">
                        <legend>Thông tin</legend>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="txtname">
                               * Họ và tên</label>
                            <div class="col-sm-8">
                                <input type="text" name="lastname" runat="server" placeholder="" id="txtname"
                                    class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="dlsex">
                                Giới tính</label>
                            <div class="col-sm-8">
                                <select name="txtsex" id="dlsex" runat="server" class="form-control">
                                    <option value="1" selected="selected">Nam</option>
                                    <option value="0">Nữ</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="txtbirth">
                                Ngày sinh</label>
                            <div class="col-sm-8">
                                <input type="text" name="input-birth" runat="server" placeholder="" id="txtbirth"
                                    class="form-control" />
                            </div>
                        </div>
                       
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="txttelephone">
                                * Điện thoại</label>
                            <div class="col-sm-8">
                                <input type="text" name="telephone" runat="server" placeholder="Số điện thoại dùng để đăng nhập" id="txttelephone"
                                    class="form-control" />
                            </div>
                        </div>
                    </fieldset>
                    <fieldset id="address">
                        <legend>Địa chỉ</legend>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="dlcountry">
                                Tỉnh, thành phố</label>
                            <div class="col-sm-8">
                                <select name="dlcountry" id="dlcountry_login" runat="server" class="form-control" onchange="changeCountry($(this).val())">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="dldistrict">
                                Quận, huyện</label>
                            <div class="col-sm-8">
                               <select name="dldistrict" id="dldistrict_login" runat="server" class="form-control">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" for="txtaddress">
                                Địa chỉ</label>
                            <div class="col-sm-8">
                                <input type="text" name="txtaddress" runat="server" placeholder="" id="txtaddress"
                                    class="form-control" />
                            </div>
                        </div>
                        
                    </fieldset>
                    
                    <div class="form-group">
                        <div class="col-sm-6 text-center">
                            <%--<label> <input type="checkbox" name="ckagree" id="ckagree" checked="checked" runat="server" value="1" />
                            Tôi đã đọc và hiểu các <a href="#"
                                class="agree"><b>Điều khoản dịch vụ và chính sách bảo mật</b></a>
                            </label>--%>
                        </div>
                        <div class="col-sm-6">
                            <button class="button" type="button" onclick="client_register()">
                            <span>Đăng kí</span></button>
                             <button class="button" type="button" onclick="ocajaxlogin.closeForm();">
                              <span>Đóng lại</span></button>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="alert alert-danger for-error error-warning">
                    <i class="fa fa-exclamation-circle"></i><span></span>
                </div>
            </div>
        </div>
    </div>
    <div class="account-forgotpass">
        <a href="javascript:void(0);" class="a-close-frm" onclick="ocajaxlogin.closeForm();">
            <span>X</span></a>
        <div class="ajax-content">
            <div class="ajax-container">
                <div class="login-form-content">
                    <h2>Khôi phục mật khẩu</h2>
                    <div id="ajax-changepass-form">
                    <div class="form-group">
                        <label class="control-label" for="inputemail">
                            Địa chỉ email</label>
                        <input type="text" name="email" maxlength="64" placeholder="" id="email-forgot"
                            class="form-control" />
                    </div>
                   
                    <div class="action" style="line-height:45px;">
                    <button class="button" type="button" onclick="forgotpassword();">
                            <span>Gửi lại mật khẩu</span></button>
                        &nbsp;&nbsp;<a href="javascript:void(0)" onclick="ocajaxlogin.appendLoginForm()">Bạn muốn đăng nhập ?</a>
                    </div>
                    <div class="ajax-loader-container" style="display: none;">
                    <img src="/image/catalog/AjaxLoader.gif" class="ajax-load-img" width="30" height="30" alt="plazathemes.com" />
                </div>                    </div>
                </div>
            </div>
            
        </div>
    </div>
    <div class="account-changepass">
            <a href="javascript:void(0);" class="a-close-frm" onclick="ocajaxlogin.closeForm();">
                <span>X</span></a>
            <div class="ajax-content">
                <div class="ajax-container">
                    <div class="login-form-content">
                        <h2>
                            Thay đổi mật khẩu</h2>
                        <div id="ajax-changepass-form">
                            <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label" for="emailforgot">
                                    Tên đăng nhập hoặc số điện thoại</label>
                                <input type="text" name="email" runat="server" maxlength="64" placeholder="" id="emailforgot"
                                    class="form-control" />
                                    </div>
                                <div class="col-md-6">
                                <label class="control-label" for="passwordold">
                                    Mật khẩu cũ</label>
                                <input type="password" name="passwordold" runat="server" maxlength="64" placeholder=""
                                    id="passwordold" class="form-control" />
                            </div>
                            </div>
                            <div class="form-group">
                            <div class="col-md-6">
                                <label class="control-label">
                                    Mật khẩu mới</label>
                                <input type="password" name="passwordnew" runat="server" maxlength="64" placeholder=""
                                    id="passwordnew" class="form-control" />
                            </div>
                            <div class="col-md-6">
                                <label class="control-label" for="passwordnew2">
                                    Xác nhận mật khẩu</label>
                                <input type="password" name="passwordnew2" runat="server" maxlength="64" placeholder=""
                                    id="passwordnew2" class="form-control" />
                            </div>
                            </div>
                            
                            <div class=" action" style="text-align:center;">
                                <button class="button" type="button" onclick="changepassword()" style="margin:10px;">
                                    <span>Thay đổi mật khẩu</span></button>
                            </div>
                            
                            <div class="ajax-loader-container" style="display: none;">
                                <img src="/image/catalog/AjaxLoader.gif" class="ajax-load-img" width="30" height="30"
                                    alt="plazathemes.com" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<div class="opc-hidden">
    <input type="hidden" id="input-opc-status" value="1" />
</div>
<div class="banner7">
    <div class="oc-banner7-container">
        <div class="flexslider oc-nivoslider">
            <div class="oc-loading">
            </div>
            <div id="oc-inivoslider" class="slides">
                <%--<a href="#">
                    <img style="display: none;" src="/upload/slider/slide3.png" alt="" title="#banner7-caption1" /></a> --%>
                <a href="/cfashion/16/Gioi-thieu-ve-C-Fashion.html">
                    <img style="display: none;" src="/upload/slider/slide4.png" alt="" title="#banner7-caption1" /></a>
                <a href="#">
                    <img style="display: none;" src="/upload/slider/Banner1-1.jpeg" alt="" title="#banner7-caption2" /></a> 
                <a href="#">
                    <img style="display: none;" src="/upload/slider/Banner2-2.jpeg" alt="" title="#banner7-caption3" /></a>
                <a href="#">
                    <img style="display: none;" src="/upload/slider/thu-do.jpeg" alt=""/></a>
                <a href="#">
                    <img style="display: none;" src="/upload/slider/89k.jpeg" alt="" /></a>
            </div>
            <div id="banner7-caption1" class="banner7-caption nivo-html-caption nivo-caption">
                <div class="timeloading">
                </div>
                <div class="banner7-content slider-2">
                    <div class="container" style="height: 100%;">
                        <div class="container-inner" style="height: 100%; width: 100%; position: relative;">
                            <div class="text-content">
                                <h1 class="title1">
                                    C'Fashion</h1>
                                <h2 class="sub-title">
                                   Mặc để thành công </h2>
                              
                                <div class="banner7-readmore">
                                    <a href="#" title="shop now">Giới thiệu về C'Fashion</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="banner7-caption2" class="banner7-caption nivo-html-caption nivo-caption">
                <div class="timeloading">
                </div>
                <div class="banner7-content slider-1">
                    <div class="container" style="height: 100%;">
                        <div class="container-inner" style="height: 100%; width: 100%; position: relative;">
                             <div class="text-content">
                                <h1 class="title1">
                                    BỘ <span>SƯU TẬP</span></h1>
                                  <h2 class="sub-title">
                                   SƠ MI + JUYP</h2>
                                <div class="banner7-readmore">
                                    <a href="#" title="shop now">SALE 70%</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="banner7-caption3" class="banner7-caption nivo-html-caption nivo-caption">
                <div class="timeloading">
                </div>
                <div class="banner7-content slider-3">
                    <div class="container" style="height: 100%;">
                        <div class="container-inner" style="height: 100%; width: 100%; position: relative;">
                             <div class="text-content">
                                <h1 class="title1">
                                    BỘ <span> SƯU TẬP</span></h1>
                                  <h2 class="sub-title">
                                   ĐẦM 2018</h2>
                                <div class="banner7-readmore">
                                    <a href="#" title="shop now">SALE 70%</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(window).load(function() {
    $('#oc-inivoslider').nivoSlider({
        effect: 'random',
        slices: 15,
        boxCols: 8,
        boxRows: 4,
        manualAdvance: false,
        animSpeed:500,
        pauseTime: '5000',
        startSlide: 0,
        controlNav:  true,
        directionNav:  true,
        controlNavThumbs: false,
        pauseOnHover:  true,
        prevText: '<i class="icon ion-ios-arrow-left"></i>',
        nextText: '<i class="icon ion-ios-arrow-right"></i>',
        afterLoad: function(){
            $('.timeloading').css('animation-duration','5000ms');
        },
    });
});
</script>

