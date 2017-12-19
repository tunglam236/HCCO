<%@ Page Title="" Language="C#" MasterPageFile="~/Child.master" AutoEventWireup="true"
    CodeFile="Search.aspx.cs" Inherits="Search" ResponseEncoding="utf-8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <div class="title-category">
        <div class="container">
            <div class="container-inner">
                <h2 class="category-name">
                    Từ khóa tìm kiếm: #<b><asp:Literal ID="lbKey1" runat="server"></asp:Literal></b></h2>
            </div>
        </div>
    </div>
    <div id="content" class="container layer-category">
        <div class="main-row full-width">
            <div class="container">
                <div class="row">
                    <div class="col-order">
                        <div id="content" class="col-sm-12">
                            <div id="ajax-login-block">
                            </div>
                            <div id="ajax-loader">
                                <img src="image/catalog/AjaxLoader.gif" alt="" />
                            </div>
                            <div class="opc-hidden">
                                <input type="hidden" id="input-opc-status" value="1" />
                            </div>
                            <div class="custom-category ">
                                <div class="link-compare">
                                    <a href="#" id="compare-total">Product Compare (0)</a></div>
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
                                        Kết quả tìm kiếm cho từ khóa: #<asp:Literal ID="lbKey2" runat="server"></asp:Literal>
                                        <%--<span>Showing 1 to 5 of 5 (1 Pages)</span>--%>
                                    </div>
                                    
                                </div>
                                <div class="custom-products quickview-add">
                                    <div class="row">
                                        <asp:Literal ID="lbProduct" runat="server"></asp:Literal>
                                    </div>
                                </div>
                                <div class="toolbar toolbar-products toolbar-bottom">
                                    <div class="toolbar-amount">
                                        <%--<span>Showing 1 to 5 of 5 (1 Pages)</span>--%>
                                    </div>
                                    <div class="pages">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                        alert(data.d._mess);

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
                    html += "<td class='text-center cart-close' style='margin-top:-12px;'><button type='button' title='Xóa' class='btn btn-danger btn-xs'><i class='fa fa-times'></i></button></td>";
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
                    html += "<td class='text-center cart-close' style='margin-top:-12px;'><button type='button' title='Xóa' class='btn btn-danger btn-xs'><i class='fa fa-times'></i></button></td>";
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
