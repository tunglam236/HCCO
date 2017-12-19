<%@ Page Title="" Language="C#" MasterPageFile="~/Child.master" AutoEventWireup="true"
    CodeFile="NewsDetail.aspx.cs" Inherits="NewsDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <div class="news-category">
        <div class="container">
            <div class="container-inner">
            <h2 class="category-name">Tin tức</h2>
                <ul class="breadcrumb">
                    <li><a href="/home">Trang chủ</a></li>
                    <li><a href="/news">Tin tức</a></li>
                    <li>
                        <asp:Literal ID="lbLinkTitle" runat="server"></asp:Literal></li>
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
                            <img src="image/catalog/AjaxLoader.gif" alt="" />
                        </div>
                        <div class="opc-hidden">
                            <input type="hidden" id="input-opc-status" value="1" />
                        </div>
                        <div class="article-container">
                            <div class="row">
                                <div class="col-sm-5 col-xs-12">
                                    <asp:Literal ID="lbImage" runat="server"></asp:Literal>
                                </div>
                                <div class="col-sm-7 col-xs-12">
                                    <div class="article-title">
                                        <asp:Literal ID="lbTitle" runat="server"></asp:Literal>
                                    </div>
                                    <div class="article-date">
                                        <asp:Literal ID="lbCreated" runat="server"></asp:Literal>
                                    </div>
                                    <div class="article-description">
                                        <p>
                                            <asp:Literal ID="lbDescription" runat="server"></asp:Literal></p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="article-body">
                                        <asp:Literal ID="lbBody" runat="server"></asp:Literal>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="main-row ">
                            <div class="container">
                                <div class="row">
                                    <div class="main-col col-sm-12 col-md-12">
                                        <div class="row sub-row">
                                            <div class="sub-col col-sm-12 col-md-12">
                                                <div id="blog_home" class="menu-recent module-nav2 box-module">
                                                    <div>
                                                        <div class="blog-title group-title">
                                                            <h2>
                                                                <span>Tin khác </span>
                                                            </h2>
                                                        </div>
                                                        <div class="owl-container">
                                                            <div class="articles-container">
                                                                <asp:Literal ID="lbNews" runat="server"></asp:Literal>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $(".articles-container").owlCarousel({
                autoPlay: false,
                items: 3,
                itemsDesktop: [1199, 3],
                itemsDesktopSmall: [991, 2],
                itemsTablet: [767, 2],
                itemsMobile: [479, 1],
                slideSpeed: 1000,
                paginationSpeed: 1000,
                rewindSpeed: 1000,
                navigation: true,
                pagination: false,
                stopOnHover: true,
                addClassActive: true

            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $(".articles-container").owlCarousel({
                autoPlay: true,
                items: 3,
                itemsDesktop: [1199, 3],
                itemsDesktopSmall: [991, 2],
                itemsTablet: [767, 2],
                itemsMobile: [479, 1],
                slideSpeed: 1000,
                paginationSpeed: 1000,
                rewindSpeed: 1000,
                navigation: true,
                pagination: false,
                stopOnHover: true,
                addClassActive: true
            });
        });
    </script>
</asp:Content>
