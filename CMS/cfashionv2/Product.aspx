<%@ Page Title="Danh mục sản phẩm" Language="C#" MasterPageFile="~/Child.master"
    AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">
    .bg-active { background-color:rgba(150, 195, 201, 0.07);}
    .transition {
    -webkit-transform: scale(1.2); 
    -moz-transform: scale(1.2);
    -o-transform: scale(1.2);
    transform: scale(1.2);
    -webkit-transition: 0.5s ease-in-out;
    -moz-transition: 0.5s ease-in-out;
    -o-transition: 0.5s ease-in-out;
    transition: 0.5s ease-in-out;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <div class="title-category">
        <div class="container">
            <div class="container-inner">
             
                <ul class="breadcrumb">
                    <li><a href="/home">Trang chủ</a></li>
                    <li><a href="/product">Danh mục sản phẩm</a></li>
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
                                         <h2>Danh mục sản phẩm</h2>
                                      </div>
                                       <div class="list-group-item">
                                          <div id="filter-group3">
                                            <asp:Literal ID="lbCategories" runat="server"></asp:Literal>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="filter-attribute-container filter-attribute-remove-container">
                                    </div>
                                    <div class="filter-attribute-container filter-price">
                                       <label>Lọc theo khoảng giá</label>
                                       <div class="list-group-item">
                                          <div class="filter-price">
                                             <div id="slider-price"></div>
                                             <div class="slider-values">
                                                <input id="pricefrom" runat="server" disabled="disabled" class="input-price" type="text" value="100000" placeholder="Min" name="price-from"/><sup> đ</sup> - 
                                                <input id="priceto" runat="server" disabled="disabled" class="input-price" type="text" value="1000000" placeholder="Max" name="price-to" /><sup> đ</sup>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    
                                   
                                   <%-- <div class="filter-attribute-container filter-manufacturer">
                                       <label>Lọc theo thương hiệu</label>
                                       <div class="list-group-item">
                                          <div id="filter-group2">
                                                <div id="lbBrand"></div>
                                          </div>
                                       </div>
                                    </div>--%>
                                 </div>
                              </div>
                           </div>
                           
                        </div>
                        <div class="random-products-slider module-sidebar">
                           <div class="group-title">
                              <h2>Sản phẩm gợi ý </h2>
                           </div>
                           <div class="owl-container">
                              <div class="random_products_slider box-module">
                                 <asp:Literal ID="lbProductRandom" runat="server"></asp:Literal>                                
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
                                                    <asp:Literal ID="lbTitle" runat="server"></asp:Literal>
                                                </h2>
                                            </div>
                                            <div class="custom-category ">
                                                <div class="toolbar toolbar-products">
                                                    <div class="modes">
                                                        <div class="btn-group">
                                                            <button type="button" id="grid-view" class="btn" title="Hiển thị dạng lưới">
                                                                <i class="icon ion-android-apps"></i>
                                                            </button>
                                                            <button type="button" id="list-view" class="btn" title="Hiển thị dạng danh sách">
                                                                <i class="icon ion-navicon-round"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="toolbar-amount">
                                                        DANH MỤC SẢN PHẨM » <span style="font-weight: bold;">
                                                            <asp:Literal ID="lbSubTitle" Text="" runat="server"></asp:Literal></span>
                                                    </div>
                                                 
                                                </div>
                                                <div class="custom-products quickview-add">
                                                    <div class="row">
                                                        <asp:Literal ID="lbProduct" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="toolbar toolbar-products toolbar-bottom">
                                                    <div class="pages">
                                                        <asp:Literal ID="lbPage" runat="server"></asp:Literal>
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
    <div class="modal fade" id="addQuickModal" role="dialog">
        <div class="modal-dialog  modal-md">
            <div class="modal-content" style="font-size: 12px;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title center">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i> Gửi thông tin thử đồ</h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-6">
                            Sản phẩm<br />
                            <input type="text" id="ins_proName" disabled class="form-control" maxlength="30" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">
                            Số lượng<br />
                            <input type="text" id="ins_Quantity" class="numbers form-control" maxlength="5" value="1" style="width: 100%;" />
                        </div>
                        <div class="col-md-3">
                            Size<br />
                             <select id="dlSize" class="form-control select2" style="width: 100%;">
                                <option value="S" selected="selected">Size s</option>
                                <option value="M">Size M</option>
                                 <option value="L">Size L</option>
                                 <option value="XL">Size XL</option>
                                 <option value="XXL">Size XXL</option>
                            </select>
                            
                        </div>
                    </div>
                      <div class="row" style="padding: 5px;">
                        <div class="col-md-4">
                            Họ và tên<br />
                            <input type="text" id="ins_cusName" placeholder="Bắt buộc nhập" class="form-control" maxlength="30" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">
                            Điện thoại<br />
                            <input type="text" id="ins_Phone" placeholder="Bắt buộc nhập" class="numbers form-control" maxlength="15" value="" style="width: 100%;" />
                        </div>
                        <div class="col-md-4">
                            Địa chỉ<br />
                            <input type="text" id="ins_Add" class="form-control" maxlength="100" value="" style="width: 100%;" />
                        </div>
                          <div class="col-md-12">
                            Ghi chú<br />
                            <input type="text" id="ins_Note" class="form-control" maxlength="100" value="" style="width: 100%;" />
                        </div>
                    </div>
                     <div class="row" style="padding: 5px;">
                          <div class="col-md-12">
                            <i>Sau khi gửi đơn hàng, nhân viên tư vấn sẽ liên hệ lại với bạn trong thời gian sớm nhất qua số điện thoại của bạn</i>
                        </div>
                     </div>
                    <div class="row" style="padding: 5px;">
                        <div class="col-md-12 btn-group pull-right">
                            <button type="button" class="btn btn-success" onclick="addQuick();">
                                Gửi nhanh</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">
                                Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdpricefrom" value="100000" />
    <input type="hidden" id="hdpriceto" value="1000000" />
    <input type="hidden" id="hdProductId" value="" />
    <input type="hidden" id="hdPrice" value="" />

    <script type="text/javascript">
        function showAddQuick(productId,proName,priceName,price) {
            $('#ins_proName').val(proName + ' - ' + priceName);
            $('#hdProductId').val(productId);
            $('#hdPrice').val(price);

            $('#ins_cusName').val('');
            $('#ins_Phone').val('');
            $('#ins_Add').val('');
            $('#ins_Quantity').val('1');
            $('#ins_Note').val('');

        }
        function addQuick() {
            var name = $('#ins_cusName').val();
            var phone = $('#ins_Phone').val();
            var add = $('#ins_Add').val();
            var productId = $('#hdProductId').val();
            var size = $('#dlSize').val();
            var price = $('#hdPrice').val();
            var quantity = $('#ins_Quantity').val();
            var note = $('#ins_Note').val();

            if (price == '' || price.length < 5) price = '0';

            if (name == '' || phone == '') showAlert('Nhập họ tên và số điện thoại bắt buộc')
            else if (quantity == '') showAlert('Nhập số lượng cần đặt');
           else {
                    $.ajax({
                        type: 'POST',
                        url: '/Query.aspx/insertQuickOrder',
                        data: '{"name":"' + name + '","phone":"' + phone + '","add":"' + add + '","productId":"' + productId + '","size":"' + size + '","price":"' + price + '","quantity":"' + quantity + '","note":"' + note + '"}',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (data) {
                            if (data.d._content == '1') {
                                showAlert('Đã gửi đơn hàng thành công');
                                $('#addQuickModal').modal('hide');
                            }
                            else
                                showAlert(data.d._mess);
                        }
                    });
                }
        }
        function addCart(id, name, quantity, img, price, sale) {
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
    </script>
    <script type="text/javascript">
        var filter_url = '';
        var ids = [];
        var min_price = parseFloat(document.getElementById("hdpricefrom").value);
        var max_price = parseFloat(document.getElementById("hdpriceto").value);
        var current_min_price = parseFloat($('#cph_pricefrom').val());
        var current_max_price = parseFloat($('#cph_priceto').val());
        $('#slider-price').slider({
            range: true,
            step: 50000,
            min: min_price,
            max: max_price,
            values: [current_min_price, current_max_price],
            slide: function (event, ui) {

                $('#cph_pricefrom').val(ui.values[0]);
                $('#cph_priceto').val(ui.values[1]);
                current_min_price = ui.values[0];
                current_max_price = ui.values[1];
            },
            stop: function (event, ui) {
                //filter_url = $('.price-url').val();
                //var currentLocation = window.location;

                //filter_url = currentLocation + '&price-from=' + current_min_price + '&price-to=' + current_max_price;
                //alert(filter_url);
                //window.location.href = filter_url;
                //oclayerednavigationajax.filter(filter_url);
            }
        });


        $(document).ajaxComplete(function () {
            var current_min_price = parseFloat($('#cph_pricefrom').val());
            var current_max_price = parseFloat($('#cph_priceto').val());

            $('#slider-price').slider({
                range: true,
                min: min_price,
                max: max_price,
                values: [current_min_price, current_max_price],
                slide: function (event, ui) {
                    $('#cph_pricefrom').val(ui.values[0]);
                    $('#cph_priceto').val(ui.values[1]);
                    current_min_price = ui.values[0];
                    current_max_price = ui.values[1];
                },
                stop: function (event, ui) {
                    document.getElementById("hdpricefrom").value = current_min_price;
                    document.getElementById("hdpriceto").value = current_max_price;
                    filter_url = '/price/' + current_min_price + '/' + current_max_price;
                    window.location.href = filter_url;
                }
            });

        });
        $('.layered .filter-attribute-container label').click(function () {
            $(this).next().slideToggle();
        });
                              
    </script>
    <%--<script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                url: '/Query.aspx/getBrand',
                data: '',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var b = document.getElementById("lbBrand");
                    var html = '';
                    for (var i = 0; i < data.d.length; i++) {
                        html += "<a href='/brand/" + data.d[i]._content + ".html'><i class='fa fa-square-o'></i>" + data.d[i]._content + "</a>";
                    }
                    b.innerHTML = html;
                }
            });
        });
    </script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".numbers").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
            $('.imgzoom').hover(function () {
                $(this).addClass('transition');
            }, function () {
                $(this).removeClass('transition');
            });

            $(".random_products_slider").owlCarousel({
                autoPlay: true,
                items: 1,
                slideSpeed: 1000,
                navigation: false,
                paginationNumbers: true,
                pagination: false,
                stopOnHover: false,
                lazyLoad: true,
                itemsDesktop: [1199, 1],
                itemsDesktopSmall: [991, 2],
                itemsTablet: [767, 2],
                itemsMobile: [479, 1],
                addClassActive: true,
                scrollPerPage: false,
                afterAction: function () {
                    $(".random_products_slider .owl-wrapper .owl-item").removeClass('first');
                    $(".random_products_slider .owl-wrapper .owl-item").removeClass('last');
                    $(".random_products_slider .owl-wrapper .owl-item").removeClass('before-active');
                    $(".random_products_slider .owl-wrapper .owl-item.active:first").addClass('first');
                    $(".random_products_slider .owl-wrapper .owl-item.active:last").addClass('last');
                    $('.random_products_slider .owl-wrapper .owl-item.active:first').prev().addClass('before-active');
                }

            });
        });
    </script>
</asp:Content>
