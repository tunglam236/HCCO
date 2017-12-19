<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .response-category
        {
            width: 20% !important;
        }
        @media (max-width:992px)
        {
            .response-category
            {
                width: 95% !important;
                margin-bottom: 10px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="banner-layer">
        <script data-cfasync="false" type="text/javascript">var lsjQuery = jQuery;</script>
        <script data-cfasync="false" type="text/javascript">
            lsjQuery(document).ready(function () {
                if (typeof lsjQuery.fn.layerSlider == "undefined") {
                    if (window._layerSlider && window._layerSlider.showNotice) {
                        window._layerSlider.showNotice('layerslider_2', 'jquery');
                    }
                } else {
                    lsjQuery("#layerslider_2").layerSlider({ sliderVersion: '6.0.5', responsiveUnder: 0, maxRatio: 1, slideBGSize: 'auto', hideUnder: 0, hideOver: 100000, skin: 'outline', navStartStop: true, thumbnailNavigation: 'disabled', skinsPath: '/wp-content/plugins/LayerSlider/static/layerslider/skins/' });
                }
            });
        </script>
        <div id="layerslider_2" class="ls-/wp-container fitvidsignore" style="width: 1920px;
            height: 900px; margin: 0 auto; margin-bottom: 0px;">
            <asp:Literal ID="lbSlide" runat="server"></asp:Literal>
        </div>
    </div>
    <div class="content">
        <!--BREADCRUMS END-->
        <div class="">
            <!--MAIN CONTANT ARTICLE START-->
            <div class="main-content margin-top-bottom-cp">
                <div class="page_content">
                    <div class="container">
                        <div class="row">
                            <div id="block_content_first" class="col-md-12">
                                <div class="container-res">
                                    <div class="row">
                                        <div class="">
                                            <div id="post-10" class="post-10 page type-page status-publish hentry">
                                                <a href="/"></a>
                                                <div class="entry-content-cp">
                                                    <div data-vc-full-width="true" data-vc-full-width-init="true" data-vc-stretch-content="true" class="vc_row wpb_row vc_row-fluid vc_row-no-padding">
                                                        <div class="wpb_column vc_column_container vc_col-sm-12">
                                                            <div class="vc_column-inner ">
                                                                <div class="wpb_wrapper">
                                                                    <section class="welcome-section">
                                                                            <div class="container-fluid">
                                                                                <div class="col-md-6 col-sm-6">
                                                                                    <div class="left-box">
                                                                                        <div class="holder">
                                                                                            <div class="heading-style-1" style="text-align:center;">
                                                                                                <h2><b><asp:Literal ID="lbIntro1" runat="server"></asp:Literal> </b></h2>
                                                                                            </div>
                                                                                            <h3><asp:Literal ID="lbIntro2" runat="server"></asp:Literal> </h3>
                                                                                            <p style="text-align:justify;"><asp:Literal ID="lbIntro3" runat="server"></asp:Literal></p>
                                                                                            <a href="#" class="more">Xem thêm</a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-6 col-sm-6">
                                                                                    <div>
                                                                                    <video src="/wp-content/uploads/2017/08/001.mp4" id="myvideo" controls="" onclick="playVid();"
                                                                                    class="video-js embed-responsive-item video-frame" poster="/wp-content/uploads/2017/08/logointro-01.jpg"></video>
                                                                                    </div>
                                                                                    <script type="text/javascript">
                                                                                        var myvid = document.getElementById("myvideo");
                                                                                        var myvids = ["/wp-content/uploads/2017/08/001.mp4", "/wp-content/uploads/2017/08/003.mp4", "/wp-content/uploads/2017/08/002.mp4"];
                                                                                        var activeVideo = 0;
                                                                                        myvid.addEventListener('ended', function (e) {
                                                                                            activeVideo = (++activeVideo) % myvids.length;
                                                                                            myvid.src = myvids[activeVideo];
                                                                                            myvid.play();
                                                                                        });
                                                                                        function playVid() {
                                                                                            myvid.play();
                                                                                        }

                                                                                        function pauseVid() {
                                                                                            myvid.pause();
                                                                                        }
                                                                                     </script>
                                                                                    <div class="welcome-slider">
                                                                                        <div id="welcome-banner" class="owl-carousel owl-theme">
                                                                                        <asp:Literal ID="lbSlideThumd" runat="server"></asp:Literal>                                                                                            
                                                                                        </div>
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                        </section>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="vc_row-full-width vc_clearfix">
                                                    </div>
                                                    <div data-vc-full-width="true" data-vc-full-width-init="true" data-vc-stretch-content="true" class="vc_row wpb_row vc_row-fluid vc_custom_1477915087078 vc_row-has-fill vc_row-no-padding">
                                                        <div class="wpb_column vc_column_container vc_col-sm-12">
                                                            <div class="vc_column-inner ">
                                                                <div class="wpb_wrapper">
                                                                    <section class="featured-work">
                                                                            <div class="container">
                                                                                <div class="heading-style-1">
                                                                                    <h2><b><asp:Literal ID="lbCompany1" runat="server"></asp:Literal></b>
                                                                                    </h2>
                                                                                </div>
                                                                                <div class="text-holder">
                                                                                    <h3><asp:Literal ID="lbCompany2" runat="server"></asp:Literal></h3>
                                                                                    <p><em><asp:Literal ID="lbCompany3" runat="server"></asp:Literal></em></p>
                                                                                </div>
                                                                            </div>
                                                                            <div class="container-fluid">
                                                                                <asp:Literal ID="lbThanhVien" runat="server"></asp:Literal>
                                                                            </div>
                                                                        </section>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="vc_row-full-width vc_clearfix">
                                                    </div>
                                                    <div class="vc_row wpb_row vc_row-fluid">
                                                        <div class="wpb_column vc_column_container vc_col-sm-12">
                                                            <div class="vc_column-inner ">
                                                                <div class="wpb_wrapper">
                                                                    <section class="services-style-1">
                                                                            <div class="container">
                                                                                <div class="heading-style-1">
                                                                                    <h2><b><asp:Literal ID="lbCategory1" runat="server"></asp:Literal></b></h2>
                                                                                </div>
                                                                                <h3><asp:Literal ID="lbCategory2" runat="server"></asp:Literal></h3>
                                                                                <div class="text-holder">
                                                                                    <p><em><asp:Literal ID="lbCategory3" runat="server"></asp:Literal></em></p>
                                                                                </div>
                                                                                <div class="row">
                                                                                    <asp:Literal ID="lbCategory" runat="server"></asp:Literal>
                                                                                </div>
                                                                            </div>
                                                                        </section>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="vc_row wpb_row vc_row-fluid vc_custom_1477921942941 vc_row-has-fill" style="display:none;">
                                                            <div class="wpb_bounceInDown bounceInDown wpb_column vc_column_container vc_col-sm-2">
                                                                <div class="vc_column-inner ">
                                                                    <div class="wpb_wrapper">

                                                                        <section class="fact-figures">

                                                                            <div class="holder">

                                                                                <div class="elment-holder">

                                                                                    <div class="row">

                                                                                        <div class="col-md-12 col-sm-12">

                                                                                            <div class="fact-box">

                                                                                                <div class="inner"><strong class="number">902<sup></sup></strong> <strong class="title">COMPLETE PROJECTS</strong> </div>

                                                                                            </div>

                                                                                        </div>

                                                                                    </div>

                                                                                </div>

                                                                            </div>

                                                                        </section>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="wpb_column vc_column_container vc_col-sm-2">
                                                                <div class="vc_column-inner ">
                                                                    <div class="wpb_wrapper">

                                                                        <section class="fact-figures">

                                                                            <div class="holder">

                                                                                <div class="elment-holder">

                                                                                    <div class="row">

                                                                                        <div class="col-md-12 col-sm-12">

                                                                                            <div class="fact-box">

                                                                                                <div class="inner"><strong class="number">34<sup></sup></strong> <strong class="title">INPROGRESS PROJECTS</strong> </div>

                                                                                            </div>

                                                                                        </div>

                                                                                    </div>

                                                                                </div>

                                                                            </div>

                                                                        </section>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="wpb_column vc_column_container vc_col-sm-2">
                                                                <div class="vc_column-inner ">
                                                                    <div class="wpb_wrapper">

                                                                        <section class="fact-figures">

                                                                            <div class="holder">

                                                                                <div class="elment-holder">

                                                                                    <div class="row">

                                                                                        <div class="col-md-12 col-sm-12">

                                                                                            <div class="fact-box">

                                                                                                <div class="inner"><strong class="number">783<sup></sup></strong> <strong class="title">SATISFIED CLIENTS</strong> </div>

                                                                                            </div>

                                                                                        </div>

                                                                                    </div>

                                                                                </div>

                                                                            </div>

                                                                        </section>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="wpb_column vc_column_container vc_col-sm-2">
                                                                <div class="vc_column-inner ">
                                                                    <div class="wpb_wrapper">

                                                                        <section class="fact-figures">

                                                                            <div class="holder">

                                                                                <div class="elment-holder">

                                                                                    <div class="row">

                                                                                        <div class="col-md-12 col-sm-12">

                                                                                            <div class="fact-box">

                                                                                                <div class="inner"><strong class="number">125<sup></sup></strong> <strong class="title">TEAM MEMBERS</strong> </div>

                                                                                            </div>

                                                                                        </div>

                                                                                    </div>

                                                                                </div>

                                                                            </div>

                                                                        </section>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="wpb_column vc_column_container vc_col-sm-2">
                                                                <div class="vc_column-inner ">
                                                                    <div class="wpb_wrapper">

                                                                        <section class="fact-figures">

                                                                            <div class="holder">

                                                                                <div class="elment-holder">

                                                                                    <div class="row">

                                                                                        <div class="col-md-12 col-sm-12">

                                                                                            <div class="fact-box">

                                                                                                <div class="inner"><strong class="number">87<sup></sup></strong> <strong class="title">AWARDS WINNER</strong> </div>

                                                                                            </div>

                                                                                        </div>

                                                                                    </div>

                                                                                </div>

                                                                            </div>

                                                                        </section>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="wpb_column vc_column_container vc_col-sm-2">
                                                                <div class="vc_column-inner ">
                                                                    <div class="wpb_wrapper">

                                                                        <section class="fact-figures">

                                                                            <div class="holder">

                                                                                <div class="elment-holder">

                                                                                    <div class="row">

                                                                                        <div class="col-md-12 col-sm-12">

                                                                                            <div class="fact-box">

                                                                                                <div class="inner"><strong class="number">100<sup>%</sup></strong> <strong class="title">SUPPORT & MAINTENANCE</strong> </div>

                                                                                            </div>

                                                                                        </div>

                                                                                    </div>

                                                                                </div>

                                                                            </div>

                                                                        </section>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    <div style="display:none;" data-vc-full-width="true" data-vc-full-width-init="true" data-vc-stretch-content="true" class="vc_row wpb_row vc_row-fluid">
                                                        <div class="wpb_column vc_column_container vc_col-sm-12">
                                                            <div class="vc_column-inner ">
                                                                <div class="wpb_wrapper">
                                                                    <section class="portfolio-style-1">
                                                                            <div class="container">
                                                                                <div class="heading-style-1">
                                                                                    <h2><b><asp:Literal ID="lbProject1" runat="server"></asp:Literal></b></h2>
                                                                                </div>
                                                                                <h3><asp:Literal ID="lbProject2" runat="server"></asp:Literal></h3>
                                                                                <div class="text-holder">
                                                                                    <p><em><asp:Literal ID="lbProject3" runat="server"></asp:Literal></em></p>
                                                                                </div>
                                                                            </div>
                                                                            <div class="container-fluid">
                                                                                <div class="filter-nav-box">
                                                                                    <asp:Literal ID="lbCat" runat="server"></asp:Literal>
                                                                                </div>
                                                                                <div class="portfolioContainer gallery portfolio-item-600">
                                                                                    <asp:Literal ID="lbImage" runat="server"></asp:Literal>
                                                                                </div>
                                                                            </div>
                                                                        </section>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="vc_row-full-width vc_clearfix">
                                                    </div>
                                                    <div style="display:none;" class="vc_row wpb_row vc_row-fluid">
                                                        <div class="wpb_column vc_column_container vc_col-sm-12">
                                                            <div class="vc_column-inner ">
                                                                <div class="wpb_wrapper">
                                                                    <section class="blog-section">
                                                                            <div class="element-wrapper">
                                                                                <div class="heading-style-1">
                                                                                    <h2> <asp:Literal ID="lbNews1" runat="server"></asp:Literal></h2>
                                                                                </div>
                                                                                <h3> <asp:Literal ID="lbNews2" runat="server"></asp:Literal></h3>
                                                                                <div class="text-holder">
                                                                                    <p><em> <asp:Literal ID="lbNews3" runat="server"></asp:Literal></em></p>
                                                                                </div>
                                                                                    <asp:Literal ID="lbNews" runat="server"></asp:Literal>
                                                                            </div>
                                                                        </section>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                     <div style="display:none;" data-vc-full-width="true" data-vc-full-width-init="false" data-vc-stretch-content="true" class="vc_row wpb_row vc_row-fluid vc_custom_1480070562323 vc_row-has-fill vc_row-no-padding">
                                                            <div class="wpb_column vc_column_container vc_col-sm-12">
                                                                <div class="vc_column-inner vc_custom_1488265417948">
                                                                    <div class="wpb_wrapper">
                                                                        <style>
                                                                            .skill-section .right-col {
                                                                                background: url(/wp-content/uploads/2016/10/skill-bg-1.png) no-repeat left top/cover;
                                                                            }
                                                                        </style>

                                                                        <section class=" skill-section">
                                                                            <div class="container-fluid">
                                                                                <div class="col-md-6">
                                                                                    <div class="left-col">
                                                                                        <div class="holder">
                                                                                            <strong class="skil-logo"><a href="#">
                                                                                                <img src="/wp-content/uploads/2017/02/Logo - 175x120px-01.jpg" alt="Unique & Modern Architectural Design"></a></strong>
                                                                                            <h3>Unique & Modern Architectural Design</h3>
                                                                                            <p>Sagittis auctor lectus habitasse, platea habitasse sit nec, duis lorem sed Vel lectus, auctor aliquet adipiscing sit sociis adipiscing.</p>
                                                                                            <a href="#" class="btn-style-1">Buy Theme</a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                    <div class=" right-col">
                                                                                        <div class="holder">
                                                                                            <h3>We Are Expert with these Qualities</h3>
                                                                                            <ul>


                                                                                                <li><strong class="title">Architecture Design</strong>
                                                                                                    <div class="progress">
                                                                                                        <div class="progress-bar" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" style="width: 78%;"><span class="sr-only">78%</span> </div>
                                                                                                    </div>
                                                                                                </li>


                                                                                                <li><strong class="title">Indoor Interior</strong>
                                                                                                    <div class="progress">
                                                                                                        <div class="progress-bar" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;"><span class="sr-only">85%</span> </div>
                                                                                                    </div>
                                                                                                </li>


                                                                                                <li><strong class="title">Renovation</strong>
                                                                                                    <div class="progress">
                                                                                                        <div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%;"><span class="sr-only">90%</span> </div>
                                                                                                    </div>
                                                                                                </li>


                                                                                                <li><strong class="title">Landscaping</strong>
                                                                                                    <div class="progress">
                                                                                                        <div class="progress-bar" role="progressbar" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100" style="width: 89%;"><span class="sr-only">89%</span> </div>
                                                                                                    </div>
                                                                                                </li>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </section>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    <div class="vc_row-full-width vc_clearfix">
                                                    </div>
                                                    <div style="display:none;" class="vc_row wpb_row vc_row-fluid vc_custom_1478181235280">
                                                        <div class="wpb_column vc_column_container vc_col-sm-12">
                                                            <div class="vc_column-inner ">
                                                                <div class="wpb_wrapper">
                                                                    <section class="team-style-1">
                                                                            <div class="element_wrap">
                                                                                <div class="heading-style-1">
                                                                                    <h2><asp:Literal ID="lbMember1" runat="server"></asp:Literal></h2>
                                                                                </div>
                                                                                <h3><asp:Literal ID="lbMember2" runat="server"></asp:Literal></h3>
                                                                                <div class="text-holder">
                                                                                    <p><em><asp:Literal ID="lbMember3" runat="server"></asp:Literal></em></p>
                                                                                </div>
                                                                                <div class="row">
                                                                                <asp:Literal ID="lbPersonal" runat="server"></asp:Literal>

                                                                                </div>
                                                                            </div>
                                                                        </section>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style="display:none;" data-vc-full-width="true" data-vc-full-width-init="false" class="vc_row wpb_row vc_row-fluid vc_custom_1478001242658 vc_row-has-fill">
                                                            <div class="wpb_column vc_column_container vc_col-sm-12">
                                                                <div class="vc_column-inner vc_custom_1488265427795">
                                                                    <div class="wpb_wrapper">

                                                                        <section class="call-action">
                                                                            <div class="element-wrapper">
                                                                                <h2>Best <b>Architect</b> Template Ever</h2>
                                                                                <p>Dignissim enim et etiam integer cras amet ultrices enim? Enim et in porta integer natoque dapibus ridiculus? Parturient ultrices, sed cursus rhoncus</p>
                                                                                <div class="btn-row">
                                                                                    <a href="#" class="btn-style-2">Learn More</a>
                                                                                    <a href="#" class="btn-style-1">Purchase Theme</a>
                                                                                </div>
                                                                            </div>
                                                                        </section>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    <div class="vc_row-full-width vc_clearfix">
                                                    </div>
                                                    <div style="display:none;" class="vc_row wpb_row vc_row-fluid">
                                                        <div class="wpb_column vc_column_container vc_col-sm-12">
                                                            <div class="vc_column-inner ">
                                                                <div class="wpb_wrapper">
                                                                    <section class="client-section">
                                                                            <div class="element-wrap">
                                                                                <h3>CÁC ĐỐI TÁC</h3>
                                                                                <div class="holder">
                                                                                    <ul class="partner">

                                                                                        <li>
                                                                                            <a>
                                                                                                <img src="/wp-content/uploads/2016/10/client-img-1.png" alt="img"></a>
                                                                                            <span>
                                                                                                <img src="/wp-content/uploads/2016/10/client-img-1-hover.png" alt="img"></span>
                                                                                        </li>

                                                                                        <li>
                                                                                            <a>
                                                                                                <img src="/wp-content/uploads/2016/10/client-img-2.png" alt="img"></a>
                                                                                            <span>
                                                                                                <img src="/wp-content/uploads/2016/10/client-img-2-hover.png" alt="img"></span>
                                                                                        </li>

                                                                                        <li>
                                                                                            <a>
                                                                                                <img src="/wp-content/uploads/2016/10/client-img-3.png" alt="img"></a>
                                                                                            <span>
                                                                                                <img src="/wp-content/uploads/2016/10/client-img-3-hover.png" alt="img"></span>
                                                                                        </li>

                                                                                        <li>
                                                                                            <a>
                                                                                                <img src="/wp-content/uploads/2016/10/client-img-4.png" alt="img"></a>
                                                                                            <span>
                                                                                                <img src="/wp-content/uploads/2016/10/client-img-4-hover.png" alt="img"></span>
                                                                                        </li>

                                                                                        <li>
                                                                                            <a>
                                                                                                <img src="/wp-content/uploads/2016/10/client-img-5.png" alt="img"></a>
                                                                                            <span>
                                                                                                <img src="/wp-content/uploads/2016/10/client-img-5-hover.png" alt="img"></span>
                                                                                        </li>

                                                                                        <li>
                                                                                            <a>
                                                                                                <img src="/wp-content/uploads/2016/10/client-img-6.png" alt="img"></a>
                                                                                            <span>
                                                                                                <img src="/wp-content/uploads/2016/10/client-img-6-hover.png" alt="img"></span>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </section>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="vc_row wpb_row vc_row-fluid">
                                                        <div class="wpb_column vc_column_container vc_col-sm-12">
                                                            <div class="vc_column-inner ">
                                                                <div class="wpb_wrapper">
                                                                    <style>
                                                                        .testimonials-style-1 .holder .testi-container
                                                                        {
                                                                            background: #000 url(/wp-content/uploads/2016/10/testimonials-bg.png) no-repeat left top/cover;
                                                                        }
                                                                    </style>
                                                                    <section class="testimonials-style-1">
                                                                            <div class="elment-wrap">
                                                                                <div id="testimonial-style-1" class="owl-carousel owl-theme">
                                                                                <asp:Literal ID="lbFeedBack" runat="server"></asp:Literal>
                                                                                </div>
                                                                            </div>
                                                                        </section>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- .entry-content -->
                                            </div>
                                            <!-- #post-## -->
                                            <div class="comment-box">
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
</asp:Content>
