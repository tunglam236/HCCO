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
         <input type="hidden" id="hdProductId" value="" />
    <input type="hidden" id="hdPrice" value="" />
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
        <script type="text/javascript">
            function showAddQuick(productId, proName, priceName, price) {
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
        <script type="text/javascript">
        $(document).ready(function () {
            $(".numbers").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
        });
    </script>
</asp:Content>
