<%@ Page Title="Khách hàng" Language="C#" MasterPageFile="~/Child.master" AutoEventWireup="true"
    CodeFile="Member.aspx.cs" Inherits="Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .mb-rows
        {
            background-color: rgba(0, 0, 0, .05);
            min-height: 200px;
            padding: 12px;
            margin: 0px 12px;
            line-height: 30px;
        }
        .mb-rows p
        {
            font-weight: bold;
        }
        .fdisplay
        {
            display: block !important;
        }
        .hidden
        {
            display: none !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <div class="title-category">
        <div class="container">
            <div class="container-inner">
                <h2 class="category-name">
                    Khách hàng</h2>
                <ul class="breadcrumb">
                    <li><a href="/home">Trang chủ</a></li>
                    <li><a href="/member">Khách hàng</a></li>
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
                                <div class="row">
                                    <div class="col-order">
                                        <aside id="column-left" class="col-sm-12 col-md-3">
                                            <div class="layernavigation-module">
                                              <div class="panel panel-default">
                              
                              <div class="layered">
                                 <div class="list-group">
                                    
                                    <div class="filter-attribute-container filter-categories">
                                       <div class="layered-heading module-title" style="margin-bottom:5px; text-align:center;">
                                          <h2>Khách hàng</h2>
                                      </div>
                                       
                                    </div>
                                   
                                    <div class="filter-attribute-container filter-manufacturer">
                                       <div class="list-group-item">
                                          <div id="filter-group2">
                                             <a href="/t/member/0" name="12"><i class="fa fa-square-o"></i>Thông tin cá nhân</a>
                                             <a href="/t/member/2" name="12"><i class="fa fa-square-o"></i>Lịch sử đặt hàng</a>
                                             <a href="/t/member/4" name="12"><i class="fa fa-square-o"></i>Lịch sử mua hàng</a>
                                             <a href="/t/member/3" name="12"><i class="fa fa-square-o"></i>Lịch sử tích điểm</a>
                                             <a href="javascript:void(0)" onclick="mb_logout();"><i class="fa fa-square-o"></i>Đăng xuất</a>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                                        </div>
                                          </aside>
                                        <div class="col-md-9 col-sm-12" style="margin-top: -20px;">
                                            <div class="opc-hidden">
                                                <input type="hidden" id="input-opc-status" value="1" />
                                            </div>
                                            <asp:Literal ID="lbMess" runat="server"></asp:Literal>
                                            <asp:Panel ID="pnInfo" runat="server">
                                                <div class="custom-category ">
                                                    <h3>
                                                        THÔNG TIN TÀI KHOẢN</h3>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 mb-rows">
                                                        <p>
                                                            Thông tin cá nhân
                                                        </p>
                                                        <div>
                                                            Họ và tên:
                                                            <label id="l_name" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            Giới tính:
                                                            <label id="l_sex" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            Ngày sinh:
                                                            <label id="l_birth" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            Email:
                                                            <label id="l_email" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            Số điện thoại:
                                                            <label id="l_phone" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <i><a id="u_info">Chỉnh sửa</a></i></div>
                                                    </div>
                                                    <div class="col-md-4 mb-rows">
                                                        <p>
                                                            Địa chỉ nhận hàng</p>
                                                        <div>
                                                            Họ và tên:
                                                            <label id="l_r_name" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            Số điện thoại:
                                                            <label id="l_r_phone" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            Địa chỉ:
                                                            <label id="l_r_add" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            Quận, huyện:
                                                            <label id="l_r_district" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            Tỉnh, thành phố:
                                                            <label id="l_r_country" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <i><a id="u_receiver">Chỉnh sửa</a></i></div>
                                                    </div>
                                                    <div class="col-md-4 mb-rows">
                                                        <p>
                                                            Địa chỉ thanh toán</p>
                                                        <div>
                                                            Họ và tên:
                                                            <label id="l_p_name" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            Số điện thoại:
                                                            <label id="l_p_phone" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            Địa chỉ:
                                                            <label id="l_p_add" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            Quận, huyện:
                                                            <label id="l_p_district" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            Tỉnh, thành phố:
                                                            <label id="l_p_country" runat="server">
                                                            </label>
                                                        </div>
                                                        <div>
                                                            <i><a id="u_payment">Chỉnh sửa</a></i></div>
                                                    </div>
                                                </div>
                                                <fieldset id="fInfo">
                                                    <legend>Cập nhật thông tin cá nhân</legend>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Họ và tên<br />
                                                                <input type="text" id="m_name" runat="server" class="form-control" /></div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Giới tính<br />
                                                                <select id="dl_sex" runat="server" class="form-control">
                                                                    <option value="1">Nam</option>
                                                                    <option value="0">Nữ</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Ngày sinh<br />
                                                                <input type="text" id="m_birth" runat="server" onkeypress='return event.charCode >= 47 && event.charCode <= 57'
                                                                    class="datepicker2 form-control" /></div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Email<br />
                                                                <input type="text" id="m_email" runat="server" class="form-control" /></div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Số điện thoại<br />
                                                                <input type="text" id="m_phone" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
                                                                    runat="server" class="form-control" /></div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <br />
                                                                <button class="btn btn-default" onclick="updateInfoMember();">
                                                                    Cập nhật</button>
                                                                <button class="btn btn-default" onclick="closediv('fInfo');">
                                                                    Đóng</button></div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                <fieldset id="fReceiver">
                                                    <legend>Cập nhật địa chỉ nhận hàng</legend>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Họ và tên<br />
                                                                <input type="text" id="r_name" runat="server" class="form-control" /></div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Tỉnh, thành phố<br />
                                                                <select id="r_dlcountry" onchange="changeCountry2('r_dldistrict',$(this).val(),'')"
                                                                    runat="server" class="form-control">
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Quận, huyện<br />
                                                                <select id="r_dldistrict" runat="server" class="form-control">
                                                                </select></div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Số điện thoại<br />
                                                                <input type="text" id="r_phone" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
                                                                    runat="server" class="form-control" /></div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Địa chỉ<br />
                                                                <input type="text" id="r_add" runat="server" class="form-control" /></div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <br />
                                                                <button class="btn btn-default" onclick="updateReceiverPayment(1);">
                                                                    Cập nhật</button>
                                                                <button class="btn btn-default" onclick="closediv('fReceiver');">
                                                                    Đóng</button></div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                <fieldset id="fPayment">
                                                    <legend>Cập nhật địa chỉ thanh toán</legend>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Họ và tên<br />
                                                                <input type="text" id="p_name" runat="server" class="form-control" /></div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Tỉnh, thành phố<br />
                                                                <select id="p_dlcountry" onchange="changeCountry2('p_dldistrict',$(this).val(),'')"
                                                                    runat="server" class="form-control">
                                                                </select></div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Quận, huyện<br />
                                                                <select id="p_dldistrict" runat="server" class="form-control">
                                                                </select></div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Số điện thoại<br />
                                                                <input type="text" id="p_phone" onkeypress='return event.charCode >= 48 && event.charCode <= 57'
                                                                    runat="server" class="form-control" /></div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                Địa chỉ<br />
                                                                <input type="text" id="p_add" runat="server" class="form-control" /></div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <br />
                                                                <button class="btn btn-default" onclick="updateReceiverPayment(2);">
                                                                    Cập nhật</button>
                                                                <button class="btn btn-default" onclick="closediv('fPayment');">
                                                                    Đóng</button></div>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                <div class="custom-category ">
                                                    <h3>
                                                        Đơn đặt hàng gần đây</h3>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="table-responsive">
                                                            <table class="table table-bordered">
                                                                <thead>
                                                                    <tr>
                                                                        <td class="text-center">
                                                                            Mã đơn hàng
                                                                        </td>
                                                                        <td class="text-center">
                                                                            Ngày đặt hàng
                                                                        </td>
                                                                        <td class="text-center">
                                                                            Tổng tiền
                                                                        </td>
                                                                        <td class="text-center">
                                                                            Trạng thái đơn hàng
                                                                        </td>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <%=loadOrderRecent() %>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="pnOrder" runat="server">
                                                <div class="custom-category ">
                                                    <h3>
                                                        LỊCH SỬ ĐẶT HÀNG</h3>
                                                </div>
                                                <div class="row" style="margin-bottom: 5px;">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            Từ ngày<br />
                                                            <input type='text' onkeypress='return event.charCode >= 47 && event.charCode <= 57'
                                                                id="fromdate_order" class="datepicker2 form-control" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            Đến ngày<br />
                                                            <input type='text' onkeypress='return event.charCode >= 47 && event.charCode <= 57'
                                                                id="todate_order" class="datepicker2 form-control" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        Tình trạng đơn hàng<br />
                                                        <select id="dlstatus_order" class="form-control">
                                                            <option value="">Tất cả</option>
                                                            <option value="1">Đang chờ xử lý</option>
                                                            <option value="2">Đã xác nhận</option>
                                                            <option value="3">Đang giao hàng</option>
                                                            <option value="4">Đã giao hàng</option>
                                                            <option value="0">Đơn hàng bị hủy</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <a onclick="getOrder();" class="btn">Xem danh sách</a>
                                                    </div>
                                                </div>
                                                <div class="row" id="listorder" style="padding:20px;">
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="pnBuy" runat="server">
                                                <div class="custom-category ">
                                                    <h3>
                                                        LỊCH SỬ MUA HÀNG</h3>
                                                </div>
                                                <div class="row" style="margin-bottom: 5px;">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            Từ ngày<br />
                                                            <input type='text' onkeypress='return event.charCode >= 47 && event.charCode <= 57'
                                                                id="fromdate_buy" class="datepicker2 form-control" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            Đến ngày<br />
                                                            <input type='text' onkeypress='return event.charCode >= 47 && event.charCode <= 57'
                                                                id="todate_buy" class="datepicker2 form-control" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <a onclick="getBuy();" class="btn">Xem lịch sử</a>
                                                    </div>
                                                </div>
                                                <div class="row" id="listbuy" style="padding:20px;">
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="pnLike" runat="server">
                                                <div class="custom-category ">
                                                    <h3>
                                                        Sản phẩm ưa thích</h3>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="pnScore" runat="server">
                                                <div class="custom-category ">
                                                    <h3>
                                                        LỊCH SỬ TÍCH ĐIỂM</h3>
                                                </div>
                                                <div class="row" style="margin-bottom: 5px;">
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            Từ ngày<br />
                                                            <input type='text' onkeypress='return event.charCode >= 47 && event.charCode <= 57'
                                                                id="fromdate_ref" class="datepicker2 form-control" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            Đến ngày<br />
                                                            <input type='text' onkeypress='return event.charCode >= 47 && event.charCode <= 57'
                                                                id="todate_ref" class="datepicker2 form-control" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        Tình trạng đơn hàng<br />
                                                        <select id="dlstatus_ref" class="form-control">
                                                            <option value="">Tất cả</option>
                                                            <option value="1">Đang chờ xử lý</option>
                                                            <option value="2">Đã xác nhận</option>
                                                            <option value="3">Đang giao hàng</option>
                                                            <option value="4">Đã giao hàng</option>
                                                            <option value="0">Đơn hàng bị hủy</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <a onclick="getRef();" class="btn">Xem danh sách</a>
                                                    </div>
                                                </div>
                                                <div class="row" id="listscore" style="padding:20px;">
                                                </div>
                                            </asp:Panel>
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
    <asp:HiddenField ID="hd_r_countryId" runat="server" />
    <asp:HiddenField ID="hd_r_districtId" runat="server" />
    <asp:HiddenField ID="hd_p_countryId" runat="server" />
    <asp:HiddenField ID="hd_p_districtId" runat="server" />
    <script type="text/javascript">
        $(document).ready(function () {
            var c1 = document.getElementById('cph_r_dlcountry');
            var c2 = document.getElementById('cph_p_dlcountry');
            if (c1 && c2) {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/getCountry',
                    data: '{"type":"-1"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            var opt = document.createElement('option');
                            opt.value = data.d[i].Id;
                            opt.innerHTML = data.d[i].Name;
                            c1.appendChild(opt);
                        }

                        for (var i = 0; i < data.d.length; i++) {
                            var opt = document.createElement('option');
                            opt.value = data.d[i].Id;
                            opt.innerHTML = data.d[i].Name;
                            c2.appendChild(opt);
                        }
                        $('#cph_r_dldistrict').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
                        $('#cph_p_dldistrict').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');

                        var r_country = document.getElementById("cph_hd_r_countryId");
                        if (r_country) {
                            if (r_country.value != "") {
                                var v = '';
                                var r_dis = document.getElementById("cph_hd_r_districtId");
                                if (r_dis) v = r_dis.value;
                                changeCountry2('r_dldistrict', r_country.value, v);
                            }
                        }

                        var p_country = document.getElementById("cph_hd_p_countryId");
                        if (p_country) {
                            if (p_country.value != "") {
                                var v = '';
                                var p_dis = document.getElementById("cph_hd_p_districtId");
                                if (p_dis) v = p_dis.value;
                                changeCountry2('p_dldistrict', p_country.value, v);
                            }
                        }
                    }
                });
            }
        });
        
    </script>
    <script type="text/javascript">
        function updateReceiverPayment(type) {
            var name = document.getElementById("cph_r_name");
            var phone = document.getElementById("cph_r_phone");
            var add = document.getElementById("cph_r_add");
            var country = $('#cph_r_dlcountry').val();
            var countryname = $('#cph_r_dlcountry option:selected').text();
            var district = $('#cph_r_dldistrict').val();
            var districtname = $('#cph_r_dldistrict option:selected').text();

            if (type == 2) {
                name = document.getElementById("cph_p_name");
                phone = document.getElementById("cph_p_phone");
                add = document.getElementById("cph_p_add");
                country = $('#cph_p_dlcountry').val();
                countryname = $('#cph_p_dlcountry option:selected').text();
                district = $('#cph_p_dldistrict').val();
                districtname = $('#cph_p_dldistrict option:selected').text();
            }
            if (name.value.length == 0) showAlert('Nhập họ và tên');
            else if (add.value.length == 0) showAlert('Nhập địa chỉ nhận hàng');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/updateReceiverPayment',
                    data: '{"name":"' + name.value + '","phone":"' + phone.value + '","add":"' + add.value + '","countryid":"' + country + '","country":"' + countryname + '","districtid":"' + district + '","district":"' + districtname + '","type":"' + type + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (type == 1) {
                            var n = document.getElementById("cph_l_r_name");
                            var p = document.getElementById("cph_l_r_phone");
                            var a = document.getElementById("cph_l_r_add");
                            var d = document.getElementById("cph_l_r_district");
                            var c = document.getElementById("cph_l_r_country");
                            n.innerHTML = name.value; p.innerHTML = phone.value;
                            a.innerHTML = add.value; d.innerHTML = districtname;
                            c.innerHTML = countryname;

                        }
                        else {
                            if (type == 2) {
                                var n = document.getElementById("cph_l_p_name");
                                var p = document.getElementById("cph_l_p_phone");
                                var a = document.getElementById("cph_l_p_add");
                                var d = document.getElementById("cph_l_p_district");
                                var c = document.getElementById("cph_l_p_country");

                                n.innerHTML = name.value; p.innerHTML = phone.value;
                                a.innerHTML = add.value; d.innerHTML = districtname;
                                c.innerHTML = countryname;
                            }
                        }
                        showAlert(data.d._mess);
                    }
                });
            }
        }
        function updateInfoMember() {
            var name = document.getElementById("cph_m_name");
            var email = document.getElementById("cph_m_email");
            var phone = document.getElementById("cph_m_phone");
            var birth = document.getElementById("cph_m_birth");
            var sex = document.getElementById("cph_dl_sex");
            if (name.value.length == 0) showAlert('Nhập họ và tên');
            else if (email.value.length == 0) showAlert('Nhập địa chỉ email');
            else {

                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/updateInfoMember',
                    data: '{"name":"' + name.value + '","sex":"' + sex.value + '","phone":"' + phone.value + '","email":"' + email.value + '","birth":"' + birth.value + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var n = document.getElementById("cph_l_name");
                        var e = document.getElementById("cph_l_email");
                        var p = document.getElementById("cph_l_phone");
                        var b = document.getElementById("cph_l_birth");
                        var s = document.getElementById("cph_l_sex");
                        n.innerHTML = name.value;
                        e.innerHTML = email.value;
                        p.innerHTML = phone.value;
                        b.innerHTML = birth.value;
                        s.innerHTML = sex.value == 1 ? 'Nam' : 'Nữ';

                        showAlert(data.d._mess);
                    }
                });
            }
        }
        function changeCountry2(control, id, value) {
            $('#cph_' + control).find('option').remove().end();
            if (id != "") {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/getCountry',
                    data: '{"type":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var d = document.getElementById('cph_' + control);
                        if (d) {
                            $('#cph_' + control).find('option').remove().end();
                            for (var i = 0; i < data.d.length; i++) {
                                var opt = document.createElement('option');
                                opt.value = data.d[i].Id;
                                opt.innerHTML = data.d[i].Name;
                                if (data.d[i].Id == value)
                                    opt.setAttribute("selected", "selected");
                                d.appendChild(opt);
                            }
                        }
                    }
                });
            }
            else {
                $('#cph_' + control).find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
            }
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#fReceiver").css({ "display": "none" });
            $("#fPayment").css({ "display": "none" });
            $("#fInfo").css({ "display": "none" });

            $("#u_info").click(function () {
                $("#fReceiver").css({ "display": "none" });
                $("#fPayment").css({ "display": "none" });
                $("#fInfo").css({ "display": "none" });

                $("#fInfo").css({ "display": "block" });
            });
            $("#u_receiver").click(function () {
                $("#fReceiver").css({ "display": "none" });
                $("#fPayment").css({ "display": "none" });
                $("#fInfo").css({ "display": "none" });

                $("#fReceiver").css({ "display": "block" });

            });
            $("#u_payment").click(function () {
                $("#fReceiver").css({ "display": "none" });
                $("#fPayment").css({ "display": "none" });
                $("#fInfo").css({ "display": "none" });

                $("#fPayment").css({ "display": "block" });

            });
        });
    </script>
    <script type="text/javascript">
        function setDropDownSeletedValue(control, selectedValue) {
            var slt = document.getElementById('cph_' + control);
            slt.value = selectedValue;
            console.log(selectedValue);
        }
        function closediv(x) {
            var n = document.getElementById(x);
            n.style.display = "none";
        }
        function mb_logout() {
            logout();
            window.location.href = '/home';
        }
        function unorder(id, index) {
            if (confirm("Bạn chắc chắn muốn hủy đơn hàng này ?") == true) {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/Unorder',
                    data: '{"idOrder":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);
                        if (data.d._content == 'ok') {
                            document.getElementById("unorder" + index).style.display = 'none';
                            document.getElementById("order-status" + index).innerHTML = 'Đơn hàng bị hủy';
                            showAlert(data.d._mess);
                        }
                        else
                            showAlert(data.d._mess);
                    },
                    error: function (er) {
                        console.log(er);
                    }
                });
            }
        }
        function getRef() {
            var from = document.getElementById("fromdate_ref");
            var to = document.getElementById("todate_ref");
            var status = document.getElementById("dlstatus_ref");
            if (from.value.leng == 0 || to.value.length == 0)
                showAlert('Nhập khoảng thời gian cần xem');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/mb_getproduct',
                    data: '{"type":"2","from":"' + from.value + '","to":"' + to.value + '","status":"' + status.value + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        console.log(data.d);
                        if (data.d.length > 0) {
                            if (data.d[0].OK == true) {
                                var html = '';
                                var x = 1; count = 0; div = 0; close = 0;
                                var code = '';
                                var score = 0;
                                for (var t = 0; t < data.d.length; t++) {
                                    if (code != data.d[t].CodeOrder) {
                                        if (count > 0) {
                                            if (close == 0)
                                                html += "</div>";
                                            html += "</div>";
                                            html += "</div>";
                                            html += "<div class='panel-footer'>Tình trạng đơn hàng: " + data.d[t].Status + " - Tổng điểm: " + score + "</div>";
                                            html += "</div>";
                                        }
                                        html += "<div class='panel panel-default'><div class='panel-heading'>Đơn hàng #" + data.d[t].CodeOrder + " - Đặt ngày " + data.d[t].CreateAt + "</div>";
                                        html += "<div class='panel-body'>";
                                        html += "<div class='row'>";
                                        code = data.d[t].CodeOrder;
                                        score = 0; div = 0;
                                    }
                                    if (div == 0 || div % 2 == 0) {
                                        html += "<div class='row'>";
                                        close = 0;
                                    }
                                    html += "<div class='col-md-2 col-xs-12' style='text-align:center;'><a target='_blank' href='/detail/" + data.d[t].ID + "/" + data.d[t].Name.replace('?', '-').replace('-', '-') + ".html'><img src='" + data.d[t].Image + "' style='width:120px; height:120px;' /></a></div>";
                                    html += "<div class='col-md-4 col-xs-12' style='line-height:30px; margin-bottom:10px; font-size:13px; padding-left:30px;'>Mã: " + data.d[t].Code + "<br />Sản phẩm: <a target='_blank' href='/detail/" + data.d[t].ID + "/" + data.d[t].Name.replace(' ', '-').replace('?', '-') + ".html'>" + data.d[t].Name + "</a><br />Đơn giá: " + data.d[t].pPrice + "<br />Số lượng: " + data.d[t].Quantity + " - Điểm thưởng: " + data.d[t].Score + "<br />Xuất xứ: " + data.d[t].Brand + "</div>";
                                    if (div == 1 || div % 2 == 1) {
                                        html += "</div>"; close = 1;
                                    }
                                    score += parseFloat(data.d[t].Score);
                                    count++;
                                    if (div == 1 || div % 2 == 1) div = 0;
                                    else div++;

                                    if (count == data.d.length) {
                                        if (close == 0)
                                            html += "</div>";
                                        html += "</div>";
                                        html += "</div>";
                                        html += "<div class='panel-footer'>Tình trạng đơn hàng: " + data.d[t].Status + " - Tổng điểm: " + score + "</div>";
                                        html += "</div>";
                                    }
                                }
                                document.getElementById("listscore").innerHTML = html;
                            }
                            else {
                                document.getElementById("listscore").innerHTML = '';
                                showAlert(data.d[0].Mess);
                            }
                        }
                        else {
                            document.getElementById("listscore").innerHTML = '';
                            showAlert(data.d[0].Mess);
                        }
                    },
                    error: function (er) {
                        console.log(er);
                    }
                });
            }
        }
        function getOrder() {
            var from = document.getElementById("fromdate_order");
            var to = document.getElementById("todate_order");
            var status = document.getElementById("dlstatus_order");
            if (from.value.leng == 0 || to.value.length == 0)
                showAlert('Nhập khoảng thời gian cần xem');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/mb_getproduct',
                    data: '{"type":"1","from":"' + from.value + '","to":"' + to.value + '","status":"' + status.value + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        
                        if (data.d.length > 0) {
                            if (data.d[0].OK == true) {
                                var html = '', header = '', color = '';
                                color = 'default';
                                var x = 1; count = 0; div = 0; close = 0;
                                var code = '';
                                for (var t = 0; t < data.d.length; t++) {
                                    color = data.d[t].StatusId == '0' ? 'danger' : 'success ';
                                    if (code != data.d[t].CodeOrder) {
                                        if (count > 0) {
                                            if (close == 0)
                                                html += "</div>";
                                            html += "</div>";
                                            html += "</div>";
                                            html += "<div class='panel-footer'>Tình trạng đơn hàng: <span id='order-status" + t.toString() + "'>" +  data.d[t - 1].Status+ "</span>";
                                            
                                            if (data.d[t - 1].StatusId == '1')
                                                html += "<a id='unorder" + t.toString() + "' style='margin-left:10px; font-weight:bold' href='javscript:void(0)' onclick='unorder(" + data.d[t-1].OrderId + "," + t.toString() + ")'><i class='ion-power'> Hủy đơn hàng</i></a>";
                                            html += "</div></div>";
                                        }
                                        html += "<div class='panel panel-" + color + "'><div class='panel-heading'>Đơn hàng số #" + data.d[t].CodeOrder + " - Đặt ngày " + data.d[t].CreateAt + "</div>";
                                        html += "<div class='panel-body'>";
                                        html += "<div class='row'>";
                                        code = data.d[t].CodeOrder;
                                        div = 0;
                                    }
                                    if (div == 0 || div % 2 == 0) {
                                        html += "<div class='row'>";
                                        close = 0;
                                    }
                                    html += "<div class='col-md-2 col-xs-12' style='text-align:center;'><a target='_blank' href='/detail/" + data.d[t].ID + "/" + data.d[t].Mess + ".html'><img src='" + data.d[t].Image + "' style='width:120px; height:120px;' /></a></div>";
                                    html += "<div class='col-md-4 col-xs-12' style='line-height:30px; margin-bottom:10px; font-size:13px; padding-left:30px;'>Mã: " + data.d[t].Code + "<br />Sản phẩm: <a target='_blank' href='/detail/" + data.d[t].ID + "/" + data.d[t].Mess + ".html'>" + data.d[t].Name + "</a><br />Đơn giá: " + data.d[t].pPrice + "<br />Số lượng: " + data.d[t].Quantity + "<br />Xuất xứ: " + data.d[t].Brand + "</div>";
                                    if (div == 1 || div % 2 == 1) {
                                        html += "</div>"; close = 1; 
                                    }
                                    count++;

                                    if (div == 1 || div % 2 == 1) div = 0;
                                    else div++;

                                    if (count == data.d.length) {
                                        if (close == 0)
                                            html += "</div>";
                                        html += "</div>";
                                        html += "</div>";
                                        html += "<div class='panel-footer'>Tình trạng đơn hàng: <span id='order-status" + t.toString() + "'>" + data.d[t].Status + "</span>";
                                        
                                        if (data.d[t].StatusId == '1')
                                            html += "<a id='unorder" + t.toString() + "' style='margin-left:10px; font-weight:bold' href='javscript:void(0)' onclick='unorder(" + data.d[t].OrderId + "," + t.toString() + ")'><i class='ion-power'> Hủy đơn hàng</i></a>";
                                        html += "</div></div>";
                                    }
                                }
                                document.getElementById("listorder").innerHTML = html;
                            }
                            else {
                                document.getElementById("listorder").innerHTML = '';
                                showAlert(data.d[0].Mess);
                            }
                        }
                        else {
                            document.getElementById("listorder").innerHTML = '';
                            showAlert(data.d[0].Mess);

                        }
                    },
                    error: function (er) {
                        console.log(er);
                    }
                });
            }
        }
        function getBuy() {
            var from = document.getElementById("fromdate_buy");
            var to = document.getElementById("todate_buy");
            if (from.value.leng == 0 || to.value.length == 0)
                showAlert('Nhập khoảng thời gian cần xem');
            else {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/mb_getproductBuy',
                    data: '{"from":"' + from.value + '","to":"' + to.value + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d.length > 0) {
                            if (data.d[0].OK == true) {
                                var html = '', header = '', color = '';
                                color = 'default';
                                var x = 1; count = 0; div = 0; close = 0;
                                var code = '';
                                for (var t = 0; t < data.d.length; t++) {
                                    color = data.d[t].StatusId == '0' ? 'danger' : 'success ';

                                    if (code != data.d[t].CodeOrder) {
                                        if (count > 0) {
                                            if (close == 0)
                                                html += "</div>";
                                            html += "</div>";
                                            html += "</div>";
                                            html += "<div class='panel-footer'>Chi nhánh mua: <span id='order-status" + t.toString() + "'>" + data.d[t].BranchName + "</span>";
                                            html += "</div></div>";
                                        }
                                        html += "<div class='panel panel-" + color + "'><div class='panel-heading'>Mã đơn hàng #" + data.d[t].CodeOrder + " - Ngày mua " + data.d[t].CreateAt + " - Tổng tiền: " + data.d[t].TotalPrice + "</div>";
                                        html += "<div class='panel-body'>";
                                        html += "<div class='row'>";
                                        code = data.d[t].CodeOrder;
                                        div = 0;
                                    }
                                    if (div == 0 || div % 2 == 0) {
                                        html += "<div class='row'>";
                                        close = 0;
                                    }
                                    html += "<div class='col-md-2 col-xs-12' style='text-align:center;'><a target='_blank' href='/detail/" + data.d[t].ID + "/" + data.d[t].Status + ".html'><img src='" + data.d[t].Image + "' style='width:120px; height:120px;' /></a></div>";
                                    html += "<div class='col-md-4 col-xs-12' style='line-height:30px; margin-bottom:10px; font-size:13px; padding-left:30px;'>Mã: " + data.d[t].Code + "<br />Sản phẩm: <a target='_blank' href='/detail/" + data.d[t].ID + "/" + data.d[t].Status + ".html'>" + data.d[t].Name + "</a><br />Đơn giá: " + data.d[t].Price + "<br />Số lượng: " + data.d[t].Quantity + "<br />Xuất xứ: " + data.d[t].Brand + "</div>";
                                    if (div == 1 || div % 2 == 1) {
                                        html += "</div>"; close = 1;
                                    }
                                    count++;

                                    if (div == 1 || div % 2 == 1) div = 0;
                                    else div++;

                                    if (count == data.d.length) {
                                        if (close == 0)
                                            html += "</div>";
                                        html += "</div>";
                                        html += "</div>";
                                        html += "<div class='panel-footer'>Chi nhánh mua: <span id='order-status" + t.toString() + "'>" + data.d[t].BranchName + "</span></div>";
                                        html += "</div>";
                                    }
                                }
                                document.getElementById("listbuy").innerHTML = html;
                            }
                            else {
                                document.getElementById("listbuy").innerHTML = '';
                                showAlert(data.d[0].Mess);
                            }
                        }
                        else {
                            document.getElementById("listbuy").innerHTML = '';
                            showAlert(data.d[0].Mess);

                        }
                    },
                    error: function (er) {
                        console.log(er);
                    }
                });
            }
        }
    </script>
</asp:Content>
