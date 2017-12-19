<%@ Page Title="Showroom" Language="C#" MasterPageFile="~/Child.master" AutoEventWireup="true"
    CodeFile="Showroom.aspx.cs" Inherits="Showroom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .pl { padding-left:15px !important;}
        .bg-active { background-color:#FFF8DC;}
        .mb
        {
            margin-bottom: 10px;
            border: 1px solid #eee;
            padding: 10px;
            margin: 5px;
        }
        .margin-bottom
        {
            margin-bottom: 10px;
        }
        .mb b
        {
            line-height: 30px;
        }
        .br
        {
            border-right: 1px solid #eee;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <div class="title-category">
        <div class="container">
            <div class="container-inner">
                <ul class="breadcrumb">
                    <li><a href="/home">Trang chủ</a></li>
                    <li><a href="/showroom">Địa chỉ cửa hàng</a></li>
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
                                       <div class="layered-heading module-title">
                                         <h2>Chi nhánh</h2>
                                      </div>
                                       <div class="list-group-item">
                                          <div id="filter-group3">
                                          <asp:Literal ID="lbBranch" runat="server"></asp:Literal>
                                          </div>
                                       </div>
                                    </div>
                                   
                                 </div>
                              </div>
                           </div>
                           
                        </div>
                      
                     </aside>
                                        <div class="col-md-9 col-sm-12">
                                            <div class="opc-hidden">
                                                <input type="hidden" id="input-opc-status" value="1" />
                                            </div>
                                            <div class="category-info">
                                                <h2 class="category-name">
                                                    Chi nhánh
                                                </h2>
                                            </div>
                                            <div class="custom-category ">
                                                <div class="row">
                                                    <div class="col-md-3 col-sm-3 col-xs-12 margin-bottom">
                                                        <select id="slCountry" class="form-control" onchange="changeCountry_br($(this).val())">
                                                        </select>
                                                    </div>
                                                    <div class="col-md-3 col-sm-3 col-xs-12 margin-bottom">
                                                        <select id="slDistrict" class="form-control" onchange="changeDistrict($(this).val())">
                                                        </select>
                                                    </div>
                                                    <div class="col-md-3 col-sm-3 col-xs-12 margin-bottom">
                                                        <select id="slBranch" class="form-control">
                                                            <option>Chọn chi nhánh</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-3 col-sm-3 col-xs-12 margin-bottom">
                                                        <button id="btnmap" class="btn btn-default" onclick="getBranch();">
                                                            Tìm kiếm</button>
                                                    </div>
                                                </div>
                                                <div class="toolbar toolbar-products" style="margin: 10px;">
                                                    <div class="toolbar-amount">
                                                        CHI NHÁNH » <span style="font-weight: bold;">
                                                            <label id="lbBranchName" runat="server" style="font-weight:bold;">CN 73 Cầu Giấy - Hà Nội</label>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="custom-products quickview-add">
                                                    <div class="row mb">
                                                        <div class="col-md-3 col-sm-3 col-xs-12 br">
                                                            <i class="ion-home"></i><b> Địa chỉ</b>
                                                        </div>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <label id="lbAdd" runat="server">73 Cầu Giấy - Hà Nội</label>
                                                        </div>
                                                    </div>
                                                    <div class="row mb">
                                                        <div class="col-md-3 col-sm-3 col-xs-12 br">
                                                            <i class="ion-clock"></i><b> Giờ làm việc</b>
                                                        </div>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <label id="lbTime" runat="server"> 08:00 AM - 22:00 PM (Các ngày trong tuần)</label>
                                                        </div>
                                                    </div>
                                                    <div class="row mb">
                                                        <div class="col-md-3 col-sm-3 col-xs-12 br">
                                                            <i class="ion-android-call"></i><b>  Số điện thoại</b>
                                                        </div>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <label id="lbPhone" runat="server">024 22 15 73 73 </label>
                                                        </div>
                                                    </div>
                                                    <div class="row mb">
                                                        <div class="col-md-3 col-sm-3 col-xs-12 br">
                                                            <i class="ion-ios-printer-outline"></i><b> Fax</b>
                                                        </div>
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <label id="lbFax" runat="server">024 22 15 73 73 </label>
                                                        </div>
                                                    </div>
                                                    <div class="row mb">
                                                        <div id="map" style="width:100%; height:600px;"></div>
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
    <input type="hidden" runat="server" id="hdId" />
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhZSbjoqxmvY8Q-YH78ZWnRPkGE2q7-4o"
  type="text/javascript"></script>
  <script>
      $(window).load(function loadmap() {
          loadMapDefault();
      });
  </script>
    <script type="text/javascript">
        function getBranch() {
            var districtId = $("#slDistrict").val();
            var branchId = $("#slBranch").val();
            initMap(districtId, branchId);
        }
        function initMap(districtId, branchId) {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 18,
                center: new google.maps.LatLng(21.0319705, 105.7989867)
            });

            $.ajax({
                type: 'POST',
                url: '/Query.aspx/getBranch2',
                data: '{"districtId":"' + districtId + '","branchId":"' + branchId + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var name = document.getElementById("cph_lbBranchName");
                    var add = document.getElementById("cph_lbAdd");
                    var time = document.getElementById("cph_lbTime");
                    var phone = document.getElementById("cph_lbPhone");
                    var fax = document.getElementById("cph_lbFax");

                    for (var i = 0; i < data.d.length; i++) {
                        if (i == 0) {
                            name.innerHTML = data.d[i].CountryName + ' » ' + data.d[i].Name;
                            add.innerHTML = data.d[i].Add + ' - ' + data.d[i].DistrictName + ' - ' + data.d[i].CountryName;
                            time.innerHTML = data.d[i].Time;
                            phone.innerHTML = data.d[i].Phone;
                            fax.innerHTML = data.d[i].Fax;
                        }
                        map.setCenter(new google.maps.LatLng(data.d[i].Longitude, data.d[i].Latitude));
                        var marker = new google.maps.Marker({
                            position: new google.maps.LatLng(data.d[i].Longitude, data.d[i].Latitude),
                            icon: 'pill.png',
                            map: map,
                            animation: google.maps.Animation.BOUNCE
                        });
                        var infoWindow = new google.maps.InfoWindow();
                        infoWindow.setPosition(new google.maps.LatLng(data.d[i].Longitude, data.d[i].Latitude));
                        infoWindow.setContent('Địa chỉ: ' + data.d[i].Add + ' - ' + data.d[i].DistrictName + ' - ' + data.d[i].CountryName + '<br />Số điện thoại: ' + data.d[i].Phone + '<br />Thời gian mở cửa: ' + data.d[i].Time);
                        infoWindow.open(map, marker);
                    }
                }
            });
    }
</script>
<script type="text/javascript">
    function loadMapDefault() {
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 18,
            center: new google.maps.LatLng(21.0316045, 105.7987827)
        });

        $.ajax({
            type: 'POST',
            url: '/Query.aspx/getBranch2',
            data: '{"districtId":"7","branchId":"6"}',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (data) {
                var name = document.getElementById("cph_lbBranchName");
                var add = document.getElementById("cph_lbAdd");
                var time = document.getElementById("cph_lbTime");
                var phone = document.getElementById("cph_lbPhone");
                var fax = document.getElementById("cph_lbFax");
                var i = 0;
                name.innerHTML = data.d[i].CountryName + ' » ' + data.d[i].Name;
                add.innerHTML = data.d[i].Add + ' - ' + data.d[i].DistrictName + ' - ' + data.d[i].CountryName;
                time.innerHTML = data.d[i].Time;
                phone.innerHTML = data.d[i].Phone;
                fax.innerHTML = data.d[i].Fax;
                map.setCenter(new google.maps.LatLng(data.d[i].Longitude, data.d[i].Latitude));
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(data.d[i].Longitude, data.d[i].Latitude),
                    icon: 'pill.png',
                    map: map,
                    animation: google.maps.Animation.BOUNCE
                });
                var infoWindow = new google.maps.InfoWindow();
                infoWindow.setPosition(new google.maps.LatLng(data.d[i].Longitude, data.d[i].Latitude));
                infoWindow.setContent('Địa chỉ: ' + data.d[i].Add + ' - ' + data.d[i].DistrictName + ' - ' + data.d[i].CountryName + '<br />Số điện thoại: ' + data.d[i].Phone + '<br />Thời gian mở cửa: ' + data.d[i].Time);
                infoWindow.open(map, marker);
            }
        });
    }
</script>
<script type="text/javascript">
        var map;
        var infoWindow;
        var markersArray = [];
        function initialize(cap,slat, slng) {
            infoWindow = new google.maps.InfoWindow();
            var latlng = new google.maps.LatLng(slat, slng);
            var myOptions = {
                zoom: 18,
                center: latlng
            };
            map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
            placeMarker(cap, latlng);
        }
        function clearOverlays() {
            if (markersArray) {
                for (i in markersArray) {
                    markersArray[i].setMap(null);
                }
            }
        }
        function placeMarker(cap,location) {
            clearOverlays();
            var marker = new google.maps.Marker({
                position: location,
                map: map,
                draggable: false,
                icon: 'pill.png',
                animation: google.maps.Animation.BOUNCE
            });
            
            infoWindow.setPosition(location);
            infoWindow.setContent(cap);
            infoWindow.open(map, marker);
            markersArray.push(marker);
        }
        
    </script>
<script type="text/javascript">
        $(document).ready(function () {
            var c1 = document.getElementById('slCountry');
            if (c1) {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/getCountryBranch',
                    data: '{"countryId":""}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            var opt = document.createElement('option');
                            opt.value = data.d[i].Id;
                            opt.innerHTML = data.d[i].Name;
                            c1.appendChild(opt);
                        }
                        $('#slDistrict').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
                    }
                });
            }
        });
        
    </script>
<script type="text/javascript">
        function changeCountry_br(id) {
            $('#slDistrict').find('option').remove().end();
            $('#slBranch').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
            if (id != "") {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/getCountryBranch',
                    data: '{"countryId":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var d = document.getElementById('slDistrict');
                        $('#slDistrict').find('option').remove().end();
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
                $('#slDistrict').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
            }
        }
        function changeDistrict(id) {
            $('#slBranch').find('option').remove().end();

            if (id != "") {
                $.ajax({
                    type: 'POST',
                    url: '/Query.aspx/getBranch',
                    data: '{"districtId":"' + id + '"}',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        var d = document.getElementById('slBranch');
                        $('#slBranch').find('option').remove().end();
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
                $('#slBranch').find('option').remove().end().append('<option value="">Vui lòng chọn</option>').val('');
            }
        }
    </script>
</asp:Content>
