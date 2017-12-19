<%@ Page Title="Thông tin giỏ hàng" Language="C#" MasterPageFile="~/Child.master"
    AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .show-checkout
        {
            display: block !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <div class="title-category">
        <div class="container">
            <div class="container-inner">
            <h2 class="category-name">Giỏ hàng</h2>
                <ul class="breadcrumb">
                    <li><a href="/home">Trang chủ</a></li>
                    <li><a href="/cart">Giỏ hàng</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div id="content" class="container layer-category">
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
                                <div class="row" style="padding:20px;">
                                    <div class="main-col col-sm-12 col-md-12">
                                        <div class="row sub-row">
                                            <div class="sub-col col-sm-12 col-md-12">
                                                <div class="">
                                                    <div class="group-title" style="margin-top: 0px;">
                                                        <p>
                                                            Thông tin giỏ hàng</p>
                                                        <h2>
                                                            Giỏ hàng</h2>
                                                    </div>
                                                    <div class="owl-container">
                                                        <div class="table-responsive">
                                                            <table class="table table-bordered">
                                                                <thead>
                                                                    <tr>
                                                                        <td class="text-center">
                                                                            Hình ảnh
                                                                        </td>
                                                                        <td class="text-center">
                                                                            Sản phẩm
                                                                        </td>
                                                                        <td class="text-center">
                                                                            Xuất xứ
                                                                        </td>
                                                                        <td class="text-center">
                                                                            Thương hiệu
                                                                        </td>
                                                                        <td class="text-center">
                                                                            Số lượng
                                                                        </td>
                                                                        <td class="text-center">
                                                                            Đơn giá
                                                                        </td>
                                                                        <td class="text-center">
                                                                            Thành tiền
                                                                        </td>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <% for (int i = 0; i < loadCart().Rows.Count; i++)
                                                                           
                                                                       {%>
                                                                       <%if (loadCart().Rows[i]["IsSale"].ToString().ToLower() == "false") 
                                                                               hdPriceNotSale.Value = (double.Parse(hdPriceNotSale.Value.Trim()) + double.Parse(loadCart().Rows[i]["TotalPrice"].ToString())).ToString();
                                                                            %>
                                                                    <tr id="cartrows<%=i %>">
                                                                        <td class="text-center" style="width: 120px;">
                                                                            <a href='/<%=getRefMember() %>detail/<% =loadCart().Rows[i]["ID"].ToString() %>/<%=loadCart().Rows[i]["ProductName"].ToString().Replace(" ","-").Replace("?","-") %>.html'>
                                                                                <img src='<% =loadCart().Rows[i]["Image"].ToString() %>' width="100px" height="118px"
                                                                                    alt='<%=loadCart().Rows[i]["ProductName"].ToString() %>' title='<%=loadCart().Rows[i]["ProductName"].ToString() %>'
                                                                                    class="img-thumbnail" /></a>
                                                                        </td>
                                                                        <td class="text-left" style="line-height: 30px;">
                                                                            <span>Mã sản phẩm:
                                                                                <%=loadCart().Rows[i]["ProductCode"].ToString() %></span>
                                                                                <%if (loadCart().Rows[i]["IsSale"].ToString().ToLower() == "true")
                                                                                  { %>
                                                                                <img src="image/catalog/sale.gif" />
                                                                                <%} %>
                                                                                <br />
                                                                            <a href='/<%=getRefMember() %>detail/<% =loadCart().Rows[i]["ID"].ToString()%>/<%=loadCart().Rows[i]["ProductName"].ToString().Replace(" ","-").Replace("?","-") %>.html'>
                                                                                <%=loadCart().Rows[i]["ProductName"].ToString() %></a>
                                                                            
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <%=loadCart().Rows[i]["CountryName"].ToString() %>
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <%=loadCart().Rows[i]["Brand"].ToString() %>
                                                                        </td>
                                                                        <td class="text-left" style="width: 141px;">
                                                                            <div class="input-group btn-block" style="max-width: 123px;">
                                                                                <input type="hidden" name="idrows" id="rows<%=i %>" value='<%=loadCart().Rows[i]["ID"].ToString() %>' />
                                                                                <input type="text" name="quantity<%=i %>" maxlength="3" value='<%=loadCart().Rows[i]["Quantity"].ToString() %>'
                                                                                    size="1" class="form-control" onkeypress='return event.charCode >= 47 && event.charCode <= 57' />
                                                                                <span class="input-group-btn">
                                                                                    <button type="submit" data-toggle="tooltip" title="Cập nhật" class="btn btn-primary"
                                                                                        style="height: 33px;" onclick="updateCurrentCart(<%=loadCart().Rows[i]["ID"].ToString() %>,'<%=loadCart().Rows[i]["ProductName"].ToString() %>',<%=i %>);">
                                                                                        <i class="fa fa-refresh"></i>
                                                                                    </button>
                                                                                    <button type="button" data-toggle="tooltip" title="Xóa" class="btn btn-danger" style="height: 33px;"
                                                                                        onclick="removeCurrentCart(<%=loadCart().Rows[i]["ID"].ToString() %>,'<%=loadCart().Rows[i]["ProductName"].ToString() %>',<%=i %>);">
                                                                                        <i class="fa fa-times-circle"></i>
                                                                                    </button>
                                                                                </span>
                                                                            </div>
                                                                        </td>
                                                                        <td class="text-right" style="width: 90px;">
                                                                            <%=string.Format("{0:0,0}",loadCart().Rows[i]["Price"]) %>
                                                                        </td>
                                                                        <td class="text-right" style="width: 120px;">
                                                                            <span id='sprice<%=i %>'>
                                                                                <%=string.Format("{0:0,0}", loadCart().Rows[i]["TotalPrice"])%></span>
                                                                        </td>
                                                                    </tr>
                                                                    <%} %>
                                                                    <tr id="rowstotal" style='display: <%=loadCart().Rows.Count> 0 ? "contents": "none" %>'>
                                                                        <td colspan="4" class="text-right">
                                                                            <b>Tổng cộng</b>
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <b id="totalquantity">
                                                                                <%=loadCart().Compute("SUM(Quantity)", "")%></b>
                                                                        </td>
                                                                        <td class="text-center">
                                                                        </td>
                                                                        <td class="text-center">
                                                                            <b id="totalprice">
                                                                                <%=string.Format("{0:0,0}",loadCart().Compute("SUM(TotalPrice)", ""))%></b>
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="discount" style="display:none;">
                                                                        <td colspan="4" class="text-right">
                                                                            Mã giảm giá: <span id="discountcode">xdHY79k</span>
                                                                        </td>
                                                                        <td class="text-center">
                                                                            Chiết khấu
                                                                        </td>
                                                                        <td></td>
                                                                        <td class="text-center"><span id="discountvalue">500,000</span></td>
                                                                    </tr>
                                                                    <tr class="discount" style="display:none;">
                                                                        <td colspan="4" class="text-right"><b>Thành tiền</b></td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td class="text-center"><b id="subtotal">4,500,000</b></td>
                                                                    </tr>
                                                                    <tr id="rowsfunc" style='display: <%=loadCart().Rows.Count> 0 ? "contents": "none" %>'>
                                                                        <td colspan="7" class="text-right">
                                                                            <button class="btn btn-default" type="button" onclick="removeAllCart()" data-toggle="tooltip"
                                                                                title="Xóa giỏ hàng">
                                                                                <span>Xóa giỏ hàng</span>
                                                                            </button>
                                                                            <a href="/product" style="color:#333;">
                                                                                <button class="btn btn-default" type="button" data-toggle="tooltip" title="Xóa giỏ hàng">
                                                                                    <span>Tiếp tục mua hàng</span></a> </button>
                                                                            <button id="checkout" class="btn btn-default" type="button" data-toggle="tooltip"
                                                                                title="Thanh toán đơn hàng">
                                                                                <span>Gửi đơn hàng</span>
                                                                            </button>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="rowsempty" style='display: <%=loadCart().Rows.Count> 0 ? "none": "contents" %>'>
                                                                        <td colspan="7" class="text-center">
                                                                            <p>
                                                                                Không có sản phẩm nào trong giỏ hàng, click <a href="/product">vào đây</a>
                                                                                để lựa chọn sản phẩm</p>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="panel-group" style="display: none;" id="accordion">
                                                            <div class="panel panel-default">
                                                                <div class="panel-heading">
                                                                    <h4 class="panel-title">
                                                                        <a href="#collapse-coupon" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
                                                                            aria-expanded="true">Bước 1 - Mã giảm giá <i class="fa fa-caret-down"></i></a>
                                                                    </h4>
                                                                </div>
                                                                <div id="collapse-coupon" class="panel-collapse collapse in" aria-expanded="true"
                                                                    style="">
                                                                    <div class="panel-body">
                                                                        <div class="form-horizontal">
                                                                            <div class="form-group">
                                                                                <div class="col-sm-4">
                                                                                    <input type="text" onchange="getDiscount($(this).val())" name="coupon" value="" placeholder="Nhập mã giảm giá (nếu có)"
                                                                                        id="input-coupon" class="form-control">
                                                                                </div>
                                                                                <div class="col-sm-8">
                                                                                    <label class="control-label" id="lbdiscount">
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <i style="font-size:13px; padding-left:10px;">Lưu ý: Giá trị mã giảm giá chỉ áp dụng cho các sản phẩm không có khuyến mại !</i>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="panel panel-default">
                                                                <div class="panel-heading">
                                                                    <h4 class="panel-title">
                                                                        <a href="#collapse-deliver" class="accordion-toggle collapsed" data-toggle="collapse"
                                                                            data-parent="#accordion" aria-expanded="false">Bước 2 - Thông tin địa chỉ giao hàng <i class="fa fa-caret-down">
                                                                            </i></a>
                                                                    </h4>
                                                                </div>
                                                                <div id="collapse-deliver" class="panel-collapse collapse" aria-expanded="false"
                                                                    style="height: 0px;">
                                                                    <div class="panel-body">
                                                                        <p>
                                                                            Nhập đầy đủ thông tin người nhận hàng</p>
                                                                        <div class="form-horizontal">
                                                                            <div class="form-group">
                                                                                <label class="col-sm-2 control-label">
                                                                                    Họ và tên (*)</label>
                                                                                <div class="col-sm-2">
                                                                                    <input type="text" maxlength="64" name="name" value="" placeholder="Họ và tên" id="name" class="form-control">
                                                                                </div>
                                                                                <label class="col-sm-2 control-label">
                                                                                    Email</label>
                                                                                <div class="col-sm-2">
                                                                                    <input type="text" name="name" maxlength="64" value="" placeholder="Email" id="email" class="form-control">
                                                                                </div>
                                                                                <label class="col-sm-2 control-label">
                                                                                    Số điện thoại (*)</label>
                                                                                <div class="col-sm-2">
                                                                                    <input type="text" name="name" maxlength="12" value="" onkeypress='return event.charCode >= 48 && event.charCode <= 57' placeholder="Số điện thoại" id="phone" class="form-control"/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group required">
                                                                                <label class="col-sm-2 control-label">
                                                                                    Tỉnh, thành phố</label>
                                                                                <div class="col-sm-2">
                                                                                    <select name="country_id" id="input-country" onchange="changeCountry_cart($(this).val())"
                                                                                        class="form-control">
                                                                                    </select>
                                                                                </div>
                                                                                <label class="col-sm-2 control-label">
                                                                                    Quận, huyện</label>
                                                                                <div class="col-sm-2">
                                                                                    <select name="district_id" id="input-district" class="form-control">
                                                                                    </select>
                                                                                </div>
                                                                                <label class="col-sm-2 control-label">
                                                                                    Địa chỉ</label>
                                                                                <div class="col-sm-2">
                                                                                    <input type="text" value="" maxlength="128" placeholder="Nhập địa chỉ cụ thể" id="add"
                                                                                        class="form-control"/>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="panel panel-default">
                                                                <div class="panel-heading">
                                                                    <h4 class="panel-title">
                                                                        <a href="#collapse-payment" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle collapsed"
                                                                            aria-expanded="false">Bước 3 - Thông tin người thanh toán <i class="fa fa-caret-down"></i>
                                                                        </a>
                                                                    </h4>
                                                                </div>
                                                                <div id="collapse-payment" class="panel-collapse collapse" aria-expanded="false">
                                                                    <div class="panel-body">
                                                                        <label>
                                                                            <input type="checkbox" id="ck_payment" onchange="changeCheck();" checked value="1" />Thông tin thanh toán trùng với địa chỉ giao hàng</label>
                                                                        <p>
                                                                            Nhập đầy đủ thông tin người thanh toán</p>
                                                                        <div class="form-horizontal">
                                                                            <div class="form-group">
                                                                                <label class="col-sm-2 control-label">
                                                                                    Họ và tên (*)</label>
                                                                                <div class="col-sm-2">
                                                                                    <input type="text" name="name" maxlength="64" disabled value="" placeholder="Họ và tên" id="p_name" class="form-control">
                                                                                </div>
                                                                                <label class="col-sm-2 control-label">
                                                                                    Email</label>
                                                                                <div class="col-sm-2">
                                                                                    <input type="text" name="name" disabled maxlength="64" disabled value="" placeholder="Email" id="p_email" class="form-control">
                                                                                </div>
                                                                                <label class="col-sm-2 control-label">
                                                                                    Số điện thoại (*)</label>
                                                                                <div class="col-sm-2">
                                                                                    <input type="text" name="name" disabled maxlength="12" onkeypress='return event.charCode >= 48 && event.charCode <= 57' value="" placeholder="Số điện thoại" id="p_phone" class="form-control">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group required">
                                                                                <label class="col-sm-2 control-label">
                                                                                    Tỉnh, thành phố</label>
                                                                                <div class="col-sm-2">
                                                                                    <select name="country_id" disabled id="input-country2" onchange="changeCountry2($(this).val())"
                                                                                        class="form-control">
                                                                                    </select>
                                                                                </div>
                                                                                <label class="col-sm-2 control-label">
                                                                                    Quận, huyện</label>
                                                                                <div class="col-sm-2">
                                                                                    <select name="district_id" disabled id="input-district2" class="form-control">
                                                                                    </select>
                                                                                </div>
                                                                                <label class="col-sm-2 control-label">
                                                                                    Địa chỉ</label>
                                                                                <div class="col-sm-2">
                                                                                    <input type="text" name="postcode" disabled value="" placeholder="Nhập địa chỉ cụ thể" id="p_add"
                                                                                        class="form-control">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="panel panel-default">
                                                                <div class="panel-heading">
                                                                    <h4 class="panel-title">
                                                                        <a href="#collapse-paymenttype" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle collapsed"
                                                                            aria-expanded="false">Bước 4 - Hình thức thanh toán <i class="fa fa-caret-down"></i></a>
                                                                    </h4>
                                                                </div>
                                                                <div id="collapse-paymenttype" class="panel-collapse collapse" aria-expanded="false">
                                                                    <div class="panel-body">
                                                                        <div class="form-horizontal">
                                                                            <div class="form-group">
                                                                                <div class="col-sm-4">
                                                                                    <label>
                                                                                        <input type="radio" checked="checked" id="payment1" value="1" name="paymenttype" />
                                                                                        Thanh toán khi nhận hàng
                                                                                    </label>
                                                                                </div>
                                                                                <div class="col-sm-4">
                                                                                    <label>
                                                                                        <input type="radio" id="payment2" name="paymenttype" value="0" />
                                                                                        Thanh toán tại cửa hàng
                                                                                    </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="panel panel-default">
                                                                <div class="panel-heading">
                                                                    <h4 class="panel-title">
                                                                        <a href="#collapse-note" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle collapsed"
                                                                            aria-expanded="false">Bước 5 - Ghi chú <i class="fa fa-caret-down"></i></a>
                                                                    </h4>
                                                                </div>
                                                                <div id="collapse-note" class="panel-collapse collapse" aria-expanded="false">
                                                                    <div class="panel-body">
                                                                        <div class="form-horizontal">
                                                                            <div class="form-group">
                                                                                <label class="col-sm-2 control-label">
                                                                                    Ghi chú khi gửi hàng</label>
                                                                                <div class="col-sm-10">
                                                                                    <input type="text" id="note" maxlength="128" name="name" class="form-control">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="panel panel-default">
                                                                <div class="panel-heading">
                                                                    <h4 class="panel-title">
                                                                        <a href="#collapse-confirm" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle collapsed"
                                                                            aria-expanded="false">Bước 6 - Xác nhận đơn hàng <i class="fa fa-caret-down"></i></a>
                                                                    </h4>
                                                                </div>
                                                                <div id="collapse-confirm" class="panel-collapse collapse" aria-expanded="false">
                                                                    <div class="panel-body">
                                                                        <div class="col-sm-10">
                                                                            Hãy kiểm tra lại thông tin đơn hàng trước khi gửi
                                                                            <input type="button" value="Gửi đơn hàng" id="btnsend" onclick="sendorder()" class="btn btn-default">      
                                                                        </div>
                                                                        <div class="col-sm-2">
                                                                              <input type="hidden" value="" id="hdDiscountId" />
                                                                              <input type="hidden" runat="server" id="hdPriceNotSale" value="0" />
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function changeCheck() {
            var c = document.getElementById("ck_payment");
            var p_email = document.getElementById("p_email");
            var p_phone = document.getElementById("p_phone");
            var p_address = document.getElementById("p_add");
            var p_name = document.getElementById("p_name");
            var p_country = document.getElementById("input-country2");
            var p_district = document.getElementById("input-district2"); 

            if (c.checked) {
                p_email.value = ''; p_phone.value = ''; p_address.value = ''; p_name.value = '';
                p_email.disabled = true; p_phone.disabled = true; p_address.disabled = true; p_name.disabled = true;
                p_country.disabled = true; p_district.disabled = true;
                $('#input-district2').val(''); $('#input-country2').val('');
            }
            else {
                p_email.disabled = false; p_phone.disabled = false; p_address.disabled = false; p_name.disabled = false;
                p_country.disabled = false; p_district.disabled = false;
            }
        }
        function sendorder() {
            var discount = document.getElementById("input-coupon").value;
            var discountId = document.getElementById("hdDiscountId").value;
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var phone = document.getElementById("phone").value;
            var address = document.getElementById("add").value;
            var note = document.getElementById("note").value;
            var check = $('#ck_payment').is(":checked");
            
            var country = $('#input-country').val();
            var countryname = $('#input-country option:selected').text();
            var district = $('#input-district').val();
            var districtname = $('#input-district option:selected').text();

            var p_country = $('#input-country2').val();
            var p_countryname = $('#input-country2 option:selected').text();
            var p_district = $('#input-district2').val();
            var p_districtname = $('#input-district2 option:selected').text();
            var p_email = document.getElementById("p_email").value;
            var p_phone = document.getElementById("p_phone").value;
            var p_address = document.getElementById("p_add").value;
            var p_name = document.getElementById("p_name").value;

            if (check == true) {
                p_name = name; p_address = address; p_phone = phone; p_email = email;
                p_countryname = countryname; p_country = country;
                p_district = district;p_districtname = districtname;
            }

            var paymenttype = $('#payment1:checked').val();
            if (name == '' || phone == '' || address == '' || country == '' || district == '')
                showAlert('Nhập đầy đủ thông tin yêu cầu (*)');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/sendOrder',
                    data: '{"name":"' + name + '","phone":"' + phone + '","email":"' + email + '","countryid":"' + country + '","districtid":"' + district + '","add":"' + address + '","paymenttype":"' + paymenttype + '","note":"' + note + '","cname":"' + countryname + '","dname":"' + districtname + '","discountid":"' + discountId + '","p_name":"' + p_name + '","p_phone":"' + p_phone + '", "p_email":"' + p_email + '","p_add":"' + p_address + '","p_country":"' + p_country + '","p_countryname":"' + p_countryname + '","p_district":"' + p_district + '","p_districtname":"' + p_districtname + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        alert(data.d._mess);
                        window.location.href = "/cart";
                    },
                    error: function (er) {
                        console.log(er);
                    }
                });
            }
        }
        function updateCurrentCart(id, name, idrows) {
            var quantity = document.getElementsByName("quantity" + idrows);
            $.ajax({
                type: 'POST',
                url: '/Query.aspx/updateCurrentCart',
                data: '{"id":"' + id + '","name":"' + name + '","quantity":"' + quantity[0].value + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if (quantity[0].value <= 0) {
                        var p = document.getElementById('cartrows' + idrows);
                        p.style.display = "none";
                    }
                    var totalquantity = document.getElementById("totalquantity");
                    totalquantity.innerHTML = data.d._total_quantity;

                    var totalprice = document.getElementById("totalprice");
                    totalprice.innerHTML = data.d._total_price;

                    var sprice = document.getElementById("sprice" + idrows);
                    sprice.innerHTML = data.d._price;

                    var totalquantity = document.getElementsByClassName("item-cart");
                    totalquantity[0].innerHTML = data.d._total_quantity;

                    if (data.d._total_quantity < 1)
                        sethidden();

                    showAlert(data.d._mess);
                }
            });
        }
        function removeCurrentCart(id, name, idrows) {
            if (confirm("Bạn chắc chắn muốn xóa sản phẩm " + name + " ?") == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/updateCurrentCart',
                    data: '{"id":"' + id + '","name":"' + name + '","quantity":"0"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var x = document.getElementById('cartrows' + idrows);
                        x.style.display = "none";

                        var totalquantity = document.getElementById("totalquantity");
                        totalquantity.innerHTML = data.d._total_quantity;

                        var totalprice = document.getElementById("totalprice");
                        totalprice.innerHTML = data.d._total_price;

                        var totalquantity = document.getElementsByClassName("item-cart");
                        totalquantity[0].innerHTML = data.d._total_quantity;

                        if (data.d._total_quantity < 1)
                            sethidden();
                        showAlert(data.d._mess);
                    }
                });
            }
        }
        function removeAllCart() {
            if (confirm("Bạn chắc chắn muốn xóa giỏ hàng ?") == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/removeAllCart',
                    data: '',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var x = document.getElementsByName("idrows").length;
                        for (var k = 0; k < x; k++) {

                            var p = document.getElementById('cartrows' + k);
                            p.style.display = "none";

                            sethidden();

                            var totalquantity = document.getElementById("totalquantity");
                            totalquantity.innerHTML = "";

                            var totalprice = document.getElementById("totalprice");
                            totalprice.innerHTML = "";

                            var totalquantity = document.getElementsByClassName("item-cart");
                            totalquantity[0].innerHTML = "0";

                        }
                        showAlert(data.d._mess);
                    }
                });
            }
        }
        function sethidden() {
            var t = document.getElementById('rowstotal');
            t.style.display = "none";

            var f = document.getElementById('rowsfunc');
            f.style.display = "none";

            var e = document.getElementById('rowsempty');
            e.style.display = "contents !important";
        }
        function numberWithCommas(x) {
            x = x.toString();
            var pattern = /(-?\d+)(\d{3})/;
            while (pattern.test(x))
                x = x.replace(pattern, "$1,$2");
            return x;
        }
        function getDiscount(code) {
            $.ajax({
                type: 'POST',
                url: '/Query.aspx/getDiscount',
                data: '{"code":"' + code + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var x = document.getElementById('lbdiscount');
                    if (data.d.Isusing) {
                        document.getElementById("hdDiscountId").value = "";
                        x.innerHTML = "Mã giảm giá này không đúng hoặc không còn giá trị,hoặc không trong thời gian áp dụng";
                        $(".discount").hide();
                    }
                    else {

                        if (parseFloat(data.d.MinOrder) <= parseFloat($("#cph_hdPriceNotSale").val())) {
                            $(".discount").show();
                            document.getElementById("hdDiscountId").value = data.d.ID;
                            var dis_type = '', value = '';
                            if (data.d.isType == 2) {
                                dis_type = 'Phần trăm'; value = '%';
                                x.innerHTML = "Mã giảm giá: " + data.d.isValue + " " + value;
                                $("#discountcode").text(code + ' - ' + data.d.isValue + " " + value);
                                $("#discountvalue").text(numberWithCommas((parseFloat($("#cph_hdPriceNotSale").val().replace(/,/g, '')) * data.d.isValue) / 100));
                                $("#subtotal").text(numberWithCommas(parseFloat($("#cph_hdPriceNotSale").val().replace(/,/g, '')) - parseFloat($("#discountvalue").text().replace(/,/g, ''))));
                            } else if (data.d.isType == 1) {
                                dis_type = 'Giảm giá tiền'; value = 'đ';
                                x.innerHTML = "Mã giảm giá: " + numberWithCommas(data.d.isValue) + " " + value;
                                $("#discountcode").text(code);
                                $("#discountvalue").text(numberWithCommas(data.d.isValue));
                                $("#subtotal").text(numberWithCommas(parseFloat($("#totalprice").text().replace(/,/g, '')) - parseFloat($("#discountvalue").text().replace(/,/g, ''))));
                            }
                        }
                        else {
                            x.innerHTML = "Giá trị đơn hàng tối thiểu áp dụng cho giảm giá là: " + numberWithCommas(parseFloat(data.d.MinOrder));
                        }
                    }
                }
            });
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                url: '/Query.aspx/getCountry',
                data: '{"type":"-1"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var c1 = document.getElementById('input-country');
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i].Id;
                        opt.innerHTML = data.d[i].Name;
                        c1.appendChild(opt);
                    }
                    var c2 = document.getElementById('input-country2');
                    for (var i = 0; i < data.d.length; i++) {
                        var opt = document.createElement('option');
                        opt.value = data.d[i].Id;
                        opt.innerHTML = data.d[i].Name;
                        c2.appendChild(opt);
                    }
                    $('#input-district').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
                    $('#input-district2').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
                }
            });
        });
        
    </script>
    <script type="text/javascript">
        function changeCountry_cart(id) {
            $('#input-district').find('option').remove().end();
            if (id != "") {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/getCountry',
                    data: '{"type":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var d = document.getElementById('input-district');
                        $('#input-district').find('option').remove().end();
                        for (var i = 0; i < data.d.length; i++) {
                            var opt = document.createElement('option');
                            opt.value = data.d[i].Id;
                            opt.innerHTML = data.d[i].Name;
                            d.appendChild(opt);

                        }
                    }
                });
            }
            else {
                $('#input-district').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
            }
        }
        function changeCountry2(id) {
            $('#input-district2').find('option').remove().end();

            if (id != "") {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/getCountry',
                    data: '{"type":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var d = document.getElementById('input-district2');
                        $('#input-district2').find('option').remove().end();
                        for (var i = 0; i < data.d.length; i++) {
                            var opt = document.createElement('option');
                            opt.value = data.d[i].Id;
                            opt.innerHTML = data.d[i].Name;
                            d.appendChild(opt);
                        }
                    }
                });
            }
            else {
                $('#input-district2').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
            }
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                url: '/Query.aspx/getInfoMember',
                data: '',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if (data.d.Status == 'ok') {
                        $("#name").val(data.d.Name);
                        $("#email").val(data.d.Email);
                        $("#phone").val(data.d.Phone);
                        $("#add").val(data.d.Address);

                        $("#p_name").val(data.d.P_name);
                        $("#p_email").val(data.d.Email);
                        $("#p_phone").val(data.d.P_phone);
                        $("#p_add").val(data.d.P_add);

                        $("#input-country").val(data.d.Country);
                        $("#input-country2").val(data.d.P_country);
                        var dis = data.d.District;
                        var p_dis = data.d.P_district;
                        $('#input-district').find('option').remove().end();
                        if (data.d.Country != "") {
                            $.ajax({
                                type: 'POST',
                                url: '/Query.aspx/getCountry',
                                data: '{"type":"' + data.d.Country + '"}',
                                contentType: 'application/json; charset=utf-8',
                                dataType: 'json',
                                success: function (data) {
                                    var d = document.getElementById('input-district');
                                    $('#input-district').find('option').remove().end();
                                    for (var i = 0; i < data.d.length; i++) {
                                        var opt = document.createElement('option');
                                        opt.value = data.d[i].Id;
                                        opt.innerHTML = data.d[i].Name;
                                        d.appendChild(opt);
                                    }
                                    $("#input-district").val(dis);
                                }
                            });
                        }
                        else {
                            $('#input-district').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
                        }

                        $('#input-district2').find('option').remove().end();
                        if (data.d.Country != "") {
                            $.ajax({
                                type: 'POST',
                                url: '/Query.aspx/getCountry',
                                data: '{"type":"' + data.d.P_country + '"}',
                                contentType: 'application/json; charset=utf-8',
                                dataType: 'json',
                                success: function (data) {
                                    var d = document.getElementById('input-district2');
                                    $('#input-district2').find('option').remove().end();
                                    for (var i = 0; i < data.d.length; i++) {
                                        var opt = document.createElement('option');
                                        opt.value = data.d[i].Id;
                                        opt.innerHTML = data.d[i].Name;
                                        d.appendChild(opt);
                                    }
                                    $("#input-district2").val(p_dis);
                                }
                            });
                        }
                        else {
                            $('#input-district2').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
                        }
                    }
                }
            });
        });
</script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#checkout").click(function () {
                $("#accordion").fadeToggle(500);
                $("#accordion").toggleClass("show-checkout");

            });
        });
    </script>
</asp:Content>
