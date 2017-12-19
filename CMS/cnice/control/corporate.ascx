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
                                                    FREE SHIPPING &amp; DELIVERY</h3>
                                                <p>
                                                    We’re one of the few furniture online retailers, who offer free of charge delivery</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col ">
                                        <div class="block-wrapper wrapper2">
                                            <div class="text-des">
                                                <h3>
                                                    365-DAY HOME TRIAL</h3>
                                                <p>
                                                    Our unique return policy will allow you to return furniture for almost a year</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col ">
                                        <div class="block-wrapper wrapper3">
                                            <div class="text-des">
                                                <h3>
                                                    LIFETIME WARRANTY</h3>
                                                <p>
                                                    Purchasing furniture with us comes with warranty longer, than anyone else offers!</p>
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
