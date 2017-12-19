<%@ Control Language="C#" AutoEventWireup="true" CodeFile="product.ascx.cs" Inherits="control_product" %>
<div class="main-row ">
    <div class="container">
        <div class="row">
            <div class="main-col col-sm-12 col-md-12">
                <div class="row sub-row">
                    <div class="sub-col col-sm-12 col-md-12">
                        <script type="text/javascript">
                            $(window).load(function () {
                                $(".tab_content").hide();
                                $(".tab_content:first").show();

                                $("ul.tabs li").click(function () {
                                    $("ul.tabs li").removeClass("active");
                                    $(this).addClass("active");
                                    $(".tab_content").hide();
                                    $(".tab_content").removeClass("animate1 wiggle");
                                    var activeTab = $(this).attr("rel");
                                    $("#" + activeTab).addClass("animate1 wiggle");
                                    $("#" + activeTab).fadeIn();
                                });
                            });
                                    
                        </script>
                        <div class="product-tabs-container-slider module-nav2 quickview-add module-style1">
                            <div class="title-product-tabs group-title">
                                <h2>
                                    Product Tabs</h2>
                                <ul class="tabs">
                                <asp:Literal ID="lbTab" runat="server"></asp:Literal>
                                </ul>
                            </div>
                            <div class="owl-container">
                                <div class="tab_container">
                                    <asp:Literal ID="lbProduct" runat="server"></asp:Literal>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                            $(window).load(function () {
                                $(".product-tabs-container-slider .tabs li:first").addClass("active");
                                $(".owl-demo-tabproduct").owlCarousel({
                                    items: 6,
                                    autoPlay: false,
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
                                        $(".owl-demo-tabproduct .owl-wrapper .owl-item").removeClass('first');
                                        $(".owl-demo-tabproduct .owl-wrapper .owl-item").removeClass('last');
                                        $(".owl-demo-tabproduct .owl-item").removeClass('before-active');
                                        $(".owl-demo-tabproduct .owl-wrapper .owl-item.active:first").addClass('first');
                                        $(".owl-demo-tabproduct .owl-wrapper .owl-item.active:last").addClass('last');
                                        $('.owl-demo-tabproduct .owl-wrapper .owl-item.active:first').prev().addClass('before-active');
                                    }
                                });

                            });
                        </script>
                       
                    </div>
                    <!-- sub-col -->
                </div>
            </div>
        </div>
    </div>
</div>
