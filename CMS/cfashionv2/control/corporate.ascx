<%@ Control Language="C#" AutoEventWireup="true" CodeFile="corporate.ascx.cs" Inherits="control_corporate" %>
<div class="main-row corporate-full">
    <div class="container">
        <div class="row">
            <div class="main-col col-sm-12 col-md-12">
                <div class="row sub-row">
                    <div class="sub-col col-sm-12 col-md-12">
                        <div class="ma-corporate-about">
                            <div class="owl-container">
                                <div id="corporate">
                                    <div class="col ">
                                        <div class="block-wrapper wrapper1">
                                            <div class="text-des">
                                                <h3>
                                                    Giao hàng toàn quốc</h3>
                                                <p>
                                                    Nhận giao hàng khắp 63 tỉnh thành trong cả nước với nhiều lựa chọn đa dạng; nhanh chóng và thuận tiện để nâng cao chất lượng dịch vụ chăm sóc khách hàng. </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col ">
                                        <div class="block-wrapper wrapper2">
                                            <div class="text-des">
                                                <h3>Thanh toán nhanh chóng</h3>
                                                <p>Đa dạng hình thức thanh toán như tiền mặt, thẻ thanh toán nội địa, thẻ thanh toán quốc tế, chuyển khoản, …  giúp khách hàng thực hiện dễ dàng, tiện lợi nhất. </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col ">
                                        <div class="block-wrapper wrapper3">
                                            <div class="text-des">
                                                <h3>Chính sách khách hàng hấp dẫn</h3>
                                                <p>Nỗ lực hoàn thiện sản phẩm và dịch vụ hơn mỗi ngày đi kèm với nhiều ưu đãi hấp dẫn, quà tặng ý nghĩa và giá cả hợp lí dành cho mọi khách hàng </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- sub-col -->
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {

        $("#corporate").owlCarousel({
            autoPlay: false,
            slideSpeed: 1000,
            navigation: false,
            stopOnHover: true,
            pagination: true,
            items: 3,
            itemsDesktop: [1199, 3],
            itemsDesktopSmall: [991, 2],
            itemsTablet: [767, 2],
            itemsMobile: [479, 1],
            addClassActive: true,
            scrollPerPage: false,
            afterAction: function () {
                $(".ma-corporate-about .owl-wrapper .owl-item").removeClass('last');
                $(".ma-corporate-about .owl-wrapper .owl-item").removeClass('first');
                $(".ma-corporate-about .owl-wrapper .owl-item").removeClass('before-active');
                $(".ma-corporate-about .owl-wrapper .owl-item.active:first").addClass('first');
                $(".ma-corporate-about .owl-wrapper .owl-item.active:last").addClass('last');
                $('.ma-corporate-about .owl-wrapper .owl-item.active:first').prev().addClass('before-active');
            }
        });
    });
</script>
