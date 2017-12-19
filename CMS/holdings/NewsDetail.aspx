<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="NewsDetail.aspx.cs" Inherits="NewsDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 <style type="text/css">
        .blog-section .post-box img
        {
            height: auto !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <div id="banner">
        <div id="inner-banner">
            <h1>
                <asp:Literal runat="server" ID="lbTitle"></asp:Literal>
            </h1>
            <div class="breadcrumb-area">
                <ul class="breadcrumb">
                    <li class=""><a href="/home">Trang chủ</a> </li>
                    <asp:Literal runat="server" ID="lbSubmenu"></asp:Literal>
                </ul>
            </div>
        </div>
    </div>
    <div id="main">
        <section class="blog-section blog-full blog-detail">
      <div class="container">
         <div class="row">
            <div id="post-289" class="col-md-9">
               <div class="post-box">
                        <div class="thumb" style="display:none;">
                           <asp:Literal ID="lbImage" runat="server"></asp:Literal>
                        </div>
                        <div class="text-box"  style="max-height:none;">
                           <h3><asp:Literal ID="lbTitle2" runat="server"></asp:Literal> </h3>
                           <asp:Literal ID="lbBody" runat="server"></asp:Literal>
                           <div class="tags">
                            <strong class="title">Từ khóa</strong>
                                <asp:Literal ID="lbTag" runat="server"></asp:Literal>
                            </div>
                            <div class="share-post"> <strong class="title">Chia sẻ bài viết này</strong>
                            <ul>
                                <li><a href='<%#HttpContext.Current.Request.Url.AbsoluteUri %>'><i class="fa fa-facebook"></i></a></li>
                                <li><a href='<%#HttpContext.Current.Request.Url.AbsoluteUri %>'><i class="fa fa-twitter"></i></a></li>
                                <li><a href='<%#HttpContext.Current.Request.Url.AbsoluteUri %>'><i class="fa fa-google-plus"></i></a></li>
                                <li><a href='<%#HttpContext.Current.Request.Url.AbsoluteUri %>'><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                            </div>
                        </div>
               </div>
            </div>
            <div class="col-md-3 content_sidebar sidebar side-bar">
               <div class="widget sidebar-box sidebar-recent-post footer-box Popular-Posts">
                  <h3>Bài viết phổ biến</h3>
                  <div class="recent-news">
                    <asp:Literal ID="lbNewsPopular" runat="server"></asp:Literal>
                  </div>
               </div>
               <div class="widget sidebar-box sidebar-recent-post footer-box recent-news">
                  <h3>Bài viết gần đây</h3>
                  <div class="recent-post">
                    <asp:Literal ID="lbNewsRecent" runat="server"></asp:Literal>
                  </div>
               </div>
               <div class="widget sidebar-box sidebar-recent-post widget_tag_cloud">
                  <h3>Từ khóa liên quan</h3>
                  <div class="tagcloud">
                        <asp:Literal ID="lbTag2" runat="server"></asp:Literal>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
    </div>
</asp:Content>

