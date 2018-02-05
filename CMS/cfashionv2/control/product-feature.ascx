<%@ Control Language="C#" AutoEventWireup="true" CodeFile="product-feature.ascx.cs"
    Inherits="control_product_feature" %>
<div class="main-row ">
    <div class="container">
        <div class="row">
            <div class="main-col col-sm-12 col-md-12">
                <div class="row sub-row">
                    <div class="sub-col col-sm-12 col-md-12">
                        <div class="featured-product-slider quickview-add module-style1">
                            <div class="group-title">
                                <h2>Sản phẩm nổi bật</h2>
                            </div>
                            <div class="owl-container">
                                <div class="featured_product_slider">
                                    <asp:Literal ID="lbFProduct" runat="server"></asp:Literal>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                            $(window).load(function () {
                                $(".featured_product_slider").owlCarousel({
                                    autoPlay: true,
                                    items: 6,
                                    slideSpeed: 1000,
                                    navigation: true,
                                    paginationNumbers: true,
                                    pagination: false,
                                    stopOnHover: false,
                                    itemsDesktop: [1599, 4],
                                    itemsDesktopSmall: [991, 3],
                                    itemsTablet: [767, 2],
                                    itemsMobile: [479, 1],
                                    addClassActive: true,
                                    scrollPerPage: false,
                                    afterAction: function () {
                                        $(".featured_product_slider .owl-wrapper .owl-item").removeClass('first');
                                        $(".featured_product_slider .owl-wrapper .owl-item").removeClass('last');
                                        $(".featured_product_slider .owl-wrapper .owl-item").removeClass('before-active');
                                        $(".featured_product_slider .owl-wrapper .owl-item.active:first").addClass('first');
                                        $(".featured_product_slider .owl-wrapper .owl-item.active:last").addClass('last');
                                        $('.featured_product_slider .owl-wrapper .owl-item.active:first').prev().addClass('before-active');
                                    }
                                });
                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
