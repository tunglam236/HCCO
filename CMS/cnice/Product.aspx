<%@ Page Title="Danh mục sản phẩm" Language="C#" MasterPageFile="~/Child.master"
    AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">
    .bg-active { background-color:rgba(150, 195, 201, 0.07);}
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
                                    
                                   
                                    <div class="filter-attribute-container filter-manufacturer">
                                       <label>Lọc theo nhãn hiệu</label>
                                       <div class="list-group-item">
                                          <div id="filter-group2">
                                                <div id="lbBrand"></div>
                                          </div>
                                       </div>
                                    </div>
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
                                                    <%--<div class="sorter">
                                                        <label>
                                                            Sắp xếp theo:</label>
                                                        <select id="input-sort" class="form-control" onchange="oclayerednavigationajax.filter(this.value)">
                                                            <option value="#" selected="selected">Mặc định</option>
                                                            <option value="#">Giá từ thấp đến cao</option>
                                                            <option value="#">Giá từ cao xuống thấp</option>
                                                        </select>
                                                    </div>
                                                    <div class="limiter">
                                                        <label>
                                                            Hiển thị:
                                                        </label>
                                                        <select id="input-limit" class="form-control" onchange="oclayerednavigationajax.filter(this.value)">
                                                            <option value="#" selected="selected">12</option>
                                                            <option value="#">25</option>
                                                            <option value="#">50</option>
                                                            <option value="#">75</option>
                                                            <option value="#">100</option>
                                                        </select>
                                                    </div>--%>
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
    <input type="hidden" id="hdpricefrom" value="100000" />
    <input type="hidden" id="hdpriceto" value="1000000" />
    <script type="text/javascript">
        function addCart(id, name, quantity, img, price,sale) {
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
    <script type="text/javascript">
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
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
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
