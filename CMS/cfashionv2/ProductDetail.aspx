<%@ Page Title="" Language="C#" MasterPageFile="~/Child.master" AutoEventWireup="true"
    CodeFile="ProductDetail.aspx.cs" Inherits="ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .cSize {
            background-color: #428bca;
            color: white;
            margin: 0px 2px;
            padding: 3px;
            float: left;
        }

        .cColor {
            background-color: #5cb85c;
            color: white;
            margin: 0px 2px;
            padding: 3px;
            float: left;
        }

        label.btn span {
            font-size: 15px;
        }

        div[data-toggle="buttons"] label.active {
            color: #b0a04dc7;
            border:1px solid #ddd;
        }

        div[data-toggle="buttons"] label {
            display: inline-block;
            padding: 3px 10px;
            margin-bottom: 5px;
            font-size: 14px;
            font-weight: 600;
            line-height: 2em;
            text-align: left;
            white-space: nowrap;
            vertical-align: top;
            cursor: pointer;
            background-color: none;
            border: 0px solid #c8c8c8;
            border-radius: 3px;
            color: #b0a04dc7;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            -o-user-select: none;
            user-select: none;
        }

            div[data-toggle="buttons"] label:hover {
                color: #7AA3CC;
            }

            div[data-toggle="buttons"] label:active, div[data-toggle="buttons"] label.active {
                -webkit-box-shadow: none;
                box-shadow: none;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <div class="title-category">
        <div class="container">
            <div class="container-inner">
                <h2 class="category-name">Sản phẩm</h2>
                <ul class="breadcrumb">
                    <li><a href="/home">Trang chủ</a></li>
                    <li><a href="/product">Sản phẩm</a></li>
                    <li><a href="#">
                        <asp:Literal ID="lbLinkProduct" runat="server"></asp:Literal>
                    </a></li>
                </ul>
            </div>
        </div>
    </div>
    <div id="content" class="container layer-category">
        <div class="main-row full-width">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="ajax-login-block">
                        </div>
                        <div id="ajax-loader">
                            <img src="/image/catalog/AjaxLoader.gif" alt="" />
                        </div>
                        <div class="row">
                            <div class="col-1 col-xlg-4 col-sm-5">
                                <div class="thumbnails">
                                    <asp:Literal ID="lbImage" runat="server"></asp:Literal>
                                </div>
                                <div class="image-additional-container owl-style3">
                                    <div class="owl-container">
                                        <div class="image-additional" id="gallery_01">
                                            <asp:Literal ID="lbImageZoom" runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2 col-xlg-8 col-sm-7 product-info-main">
                                <p class="tags-product">
                                    Từ khóa:
                            <asp:Literal ID="lbTag" runat="server"></asp:Literal>
                                </p>
                                <h1 class="product-name" id="productname">
                                    <asp:Literal ID="lbProductName" runat="server"></asp:Literal></h1>
                                <%--<p class="tags-product" id="proSKU">
                                    Mã SKU: <asp:Literal ID="lbProductCodeId" runat="server"></asp:Literal>
                                </p>--%>
                                <div class="row">
                                    <div class="col-xs-12">
                                        Kích thước (Size):
                                        <div class="btn-group btn-group-horizontal" data-toggle="buttons">
                                             <asp:Literal ID="lbSize" runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        Màu sắc:
                                        <div class="btn-group btn-group-horizontal" data-toggle="buttons">
                                             <asp:Literal ID="lbColor" runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                                <p class="ratings">
                                    <div class="rating-box">
                                        <div class="rating5">
                                            rating
                                        </div>
                                    </div>
                                </p>
                                <div class="price-box box-special">
                                    <asp:Literal ID="lbPrice" runat="server"></asp:Literal>
                                </div>
                              <%--  <div class="box-info">
                                    <ul class="list-unstyled">
                                        <li>Mã sản phẩm: <span class="ex-text">
                                            <asp:Literal ID="lbProductCode" runat="server"></asp:Literal>
                                        </span></li>
                                        <li>Xuất xứ: <span class="ex-text">
                                            <asp:Literal ID="lbCountryName" runat="server"></asp:Literal></span></li>
                                        <li>Thương hiệu: <span class="ex-text">
                                            <asp:Literal ID="lbBrand" runat="server"></asp:Literal></span></li>
                                    </ul>
                                </div>--%>
                                <p class="short-des">
                                    <asp:Literal ID="lbDescription" runat="server"></asp:Literal>
                                </p>
                                <div class="form-group">
                                    <label class="control-label" for="txtquantity">
                                        Số lượng</label>
                                    <div class="quantity-box">
                                        <input type="button" id="minus" value="-" class="form-control" />
                                        <input type="text" name="quantity" maxlength="3" value="1" size="2" id="txtquantity"
                                            runat="server" class="form-control" onkeypress='return event.charCode >= 47 && event.charCode <= 57' />
                                        <input type="button" id="plus" value="&#43;" class="form-control" />
                                    </div>
                                    </div>
                                <div class="form-group">
                                    <div>
                                        <button id="orderCart" onclick="addCurrentCart(0);" class="btn btn-danger " type="button" data-toggle="tooltip" title="Đặt hàng luôn sản phẩm này">
                                            <span><i class="fa fa-newspaper-o"></i> Mua ngay</span>
                                        </button>
                                        <button id="addCart" onclick="addCurrentCart(1);" class="btn btn-success " type="button" data-toggle="tooltip" title="Thêm nhanh vào giỏ hàng">
                                            <span><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3 product-info-detailed">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab-description" data-toggle="tab">Thông tin sản phẩm</a></li>
                                <%--<li><a href="#tab-review" data-toggle="tab">Tư vấn sản phẩm</a></li>--%>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab-description">
                                    <p class="intro">
                                        <asp:Literal ID="lbInfoProduct" runat="server"></asp:Literal>
                                    </p>
                                </div>
                                <div class="tab-pane" id="tab-review">
                                    <div class="form-horizontal" id="form-review">
                                        <div id="review">
                                            <table class="table table-striped table-bordered">
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 50%;">
                                                            <strong>Hỗ trợ về sản phẩm</strong>
                                                        </td>
                                                        <td class="text-right"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="line-height: 30px;">
                                                            <p>
                                                                Mọi thông tin về sản phẩm, bạn có thể liên hệ để biết thêm thông tin chi tiết về sản phẩm<br />
                                                                Nhân viên hỗ trợ: Nguyễn Văn A<br />
                                                                Số điện thoại hỗ trợ: 0912 345 678
                                                            </p>
                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span><span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span><span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span><span class="fa fa-stack">
                                                                <i class="fa fa-star-o fa-stack-2x"></i></span>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div class="text-right">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-related">
                            <div class="related-product-container quickview-add module-style1">
                                <div class="group-title">
                                    <h2>
                                        <span>Sản phẩm gợi ý</span>
                                    </h2>
                                </div>
                                <div class="owl-container">
                                    <div class="related-product ">
                                        <asp:Literal ID="lbProduct" runat="server"></asp:Literal>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdProductTypeCode" runat="server" />
    <input type="hidden" id="hdProductName" runat="server" />
    <input type="hidden" id="hdProductId" runat="server" />
    <input type="hidden" id="hdProductIdChange" runat="server" />
    <input type="hidden" id="hdSale" runat="server" />
    <input type="hidden" id="hdColor" runat="server" />
    <input type="hidden" id="hdSize" runat="server" />
    <input type="hidden" id="hdColorName" runat="server" />
    <input type="hidden" id="hdSizeName" runat="server" />
    <input type="hidden" runat="server" id="hdImage" runat="server" />
    <input type="hidden" runat="server" id="hdPrice" runat="server" />
    <asp:Literal ID="liProductCode" Visible="false" runat="server"></asp:Literal>
    <asp:Literal ID="liImage" Visible="false" runat="server"></asp:Literal>
    <asp:Literal ID="liID" Visible="false" runat="server"></asp:Literal>
    <asp:Literal ID="liPrice" Visible="false" runat="server"></asp:Literal>
    <asp:Literal ID="liPriceSale" Visible="false" runat="server"></asp:Literal>
    <asp:Literal ID="liScore" Visible="false" runat="server"></asp:Literal>
    <script type="text/javascript">
        $('#review').delegate('.pagination a', 'click', function (e) {
            e.preventDefault();
            $('#review').fadeOut('slow');
            $('#review').load(this.href);
            $('#review').fadeIn('slow');
        });

        var minimum = 1;
        $("#cph_txtquantity").change(function () {
            if ($(this).val() < minimum) {
                alert("Số lượng nhỏ nhất là: " + minimum);
                $("#cph_txtquantity").val(minimum);

            }
        });
        // increase number of product
        function minus(minimum) {
            var currentval = parseInt($("#cph_txtquantity").val());
            $("#cph_txtquantity").val(currentval - 1);
            if ($("#cph_txtquantity").val() <= 0 || $("#cph_txtquantity").val() < minimum) {
                alert("Số lượng nhỏ nhất là: " + minimum);
                $("#cph_txtquantity").val(minimum);
            }
        };
        // decrease of product
        function plus() {
            var currentval = parseInt($("#cph_txtquantity").val());
            $("#cph_txtquantity").val(currentval + 1);
        };
        $('#minus').click(function () {
            minus(minimum);
        });
        $('#plus').click(function () {
            plus();
        });
        // zoom
        $(".thumbnails img").elevateZoom({
            zoomType: "window",
            cursor: "crosshair",
            gallery: 'gallery_01',
            galleryActiveClass: "active",
            imageCrossfade: true,
            responsive: true,
            zoomWindowOffetx: 0,
            zoomWindowOffety: 0,
        });
        // slider	 
        $(".image-additional").owlCarousel({
            navigation: true,
            pagination: false,
            slideSpeed: 500,
            lazyLoad: true,
            goToFirstSpeed: 1500,
            addClassActive: true,
            items: 4,
            itemsDesktop: [1199, 3],
            itemsDesktopSmall: [1024, 3],
            itemsTablet: [640, 3],
            itemsMobile: [480, 3],

            afterInit: function () {
                $('#gallery_01 .owl-wrapper .owl-item:first-child').addClass('active');
            },
            beforeInit: function () {
                $(".image-additional .thumbnail").show();
            }
        });
        $('#gallery_01 .owl-item .thumbnail:first').addClass('active2');
        $('#gallery_01 .owl-item .thumbnail').each(function () {
            $(this).click(function () {
                $('#gallery_01 .owl-item').removeClass('active2');
                $(this).parent().addClass('active2');
            });
        });
        // related products	 
        $(".related-product").owlCarousel({
            navigation: true,
            pagination: false,
            addClassActive: true,
            lazyLoad: true,
            slideSpeed: 500,
            goToFirstSpeed: 1500,
            items: 6,
            itemsDesktop: [1599, 4],
            itemsDesktopSmall: [991, 3],
            itemsTablet: [767, 2],
            itemsMobile: [479, 1],

            afterInit: function () {
                this.$owlItems.removeClass('first')
                this.$owlItems.removeClass('last')
                this.$owlItems.eq(this.currentItem).addClass('first');
                this.$owlItems.eq(this.currentItem + (this.owl.visibleItems.length - 1)).addClass('last');
            },
            afterAction: function (el) {
                this.$owlItems.removeClass('first')
                this.$owlItems.removeClass('last')
                this.$owlItems.eq(this.currentItem).addClass('first');
                this.$owlItems.eq(this.currentItem + (this.owl.visibleItems.length - 1)).addClass('last');
            },
        });

    </script>
    <script type="text/javascript">
        function setColor(id,name) {
            $('#cph_hdColor').val(id);
            $('#cph_hdColorName').val(name);
            setIdProductByColorSize();
            return false;
        }
        function setSize(id,name) {
            $('#cph_hdSize').val(id);
            $('#cph_hdSizeName').val(name);
            setIdProductByColorSize();
            return false;
        }
        function setIdProductByColorSize() {
            var type = $("#cph_hdProductTypeCode").val();
            var color = $('#cph_hdColor').val();
            var size = $("#cph_hdSize").val();
            $.ajax({
                type: 'POST',
                url: '/Query.aspx/getProductByColorSize',
                data: '{"proTypeCode":"' + type + '","colorId":"' + color + '","sizeId":"' + size + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    if (data.d.OK == '1') {
                        $('#cph_hdProductId').val(data.d.Id);
                        $('#productname').text(data.d.Name + ' - ' + data.d.ProTypeCode + data.d.ColorCode + data.d.SizeCode);
                        //$('#proSKU').text(data.d.BrandCode + data.d.ProType + '_' + data.d.ProTypeCode + data.d.ColorCode + data.d.SizeCode);
                        var img = data.d.Image;
                        if (img == '') img = '/image/image-coming-soon.png';
                        var imgZoom = data.d.ImageZoom;
                        if (imgZoom == '') imgZoom = '/image/image-coming-soon.png';
                        $('#cph_hdImage').val(img);

                        var t = img.split('#');
                        var z = imgZoom.split('#');
                        for (var k = 0; k < t.length; k++) {
                            if (k == 0) {
                                $('#img_product').attr("src", z[k]);
                                $('#img_product').attr("data-zoom-image", z[k]);
                            }
                            $('#im_thumb_' + k).attr("data-image", z[k]);
                            $('#im_thumb_' + k).attr("data-zoom-image", z[k]);
                            $('#iml_thumb_' + k).attr("src", z[k]);
                        }
                    }
                }
            });
        }
        function addCurrentCart(type) {
            var pro_quantity = document.getElementById("cph_txtquantity").value;
            var pro_name = document.getElementById("cph_hdProductName").value;
            var pro_id = document.getElementById("cph_hdProductId").value;
            var pro_image = document.getElementById("cph_hdImage").value;
            var pro_price = document.getElementById("cph_hdPrice").value;
            var sale = $("#cph_hdSale").val();
            var colorname = $("#cph_hdColorName").val();
            var sizename = $("#cph_hdSizeName").val();
            $.ajax({
                type: 'POST',
                url: '/Query.aspx/addToCartByProductId',
                data: '{"id":"' + pro_id + '","name":"' + pro_name + '","quantity":"' + pro_quantity + '","sale":"' + sale + '","colorname":"' + colorname + '","sizename":"' + sizename + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var totalquantity = document.getElementsByClassName("item-cart");
                    totalquantity[0].innerHTML = data.d._content;
                    additem(pro_name.replace(/ /g, '-'), pro_image, pro_id, pro_name, pro_quantity, pro_price);
                    if (type == 1)
                        showAlert(data.d._mess);
                    else
                        window.location.href = '/cart';
                }
            });
        }
        function addCart(id, name, quantity, img, price, sale) {
            $.ajax({
                type: 'POST',
                url: '/Query.aspx/addCartByProductId',
                data: '{"id":"' + id + '","name":"' + name + '","quantity":"' + quantity + '","sale":"' + sale + '"}',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var totalquantity = document.getElementsByClassName("item-cart");
                    totalquantity[0].innerHTML = data.d._content;
                    showAlert(data.d._mess);

                    additem(name.replace(/ /g, '-'), img, id, name, quantity, price);
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
</asp:Content>
