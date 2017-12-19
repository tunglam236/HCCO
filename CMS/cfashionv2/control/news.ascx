<%@ Control Language="C#" AutoEventWireup="true" CodeFile="news.ascx.cs" Inherits="control_news" %>
<div class="main-row ">
    <div class="container">
        <div class="row">
            <div class="main-col col-sm-12 col-md-12">
                <div class="row sub-row">
                    <div class="sub-col col-sm-12 col-md-12">
                        <div id="blog_home" class="menu-recent module-nav2 box-module">
                            <div>
                                <div class="blog-title group-title">
                                    <%--<p>New our blogs</p>--%>
                                    <h2>
                                        <span>Tin tức nổi bật</span>
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
