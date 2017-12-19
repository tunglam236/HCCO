<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="News.aspx.cs" Inherits="News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="banner">
        <div id="inner-banner">
            <h1>
                <asp:Literal ID="lbTitle" runat="server"></asp:Literal>
            </h1>
            <div class="breadcrumb-area">
                <ul class="breadcrumb">
                    <li class=""><a href="/home">Trang chủ</a> </li>
                    <li class="current">
                        <asp:Literal ID="lbParent" runat="server"></asp:Literal></li></ul>
            </div>
        </div>
    </div>
    <div>
        <div class="main-content margin-top-bottom-cp">
            <div class="page_content">
                <div class="container">
                    <div class="row">
                        <div id="block_content_first" class="col-md-12">
                            <div class="container-res">
                                <div class="row">
                                    <div class="">
                                        <div id="post-280" class="post-280 page type-page status-publish hentry">
                                            <a href="#"></a>
                                            <div class="entry-content-cp">
                                                <div class="vc_row wpb_row vc_row-fluid">
                                                    <div class="wpb_column vc_column_container vc_col-sm-12">
                                                        <div class="vc_column-inner ">
                                                            <div class="wpb_wrapper">
                                                                <section class="blog-section blog-full">
                                                                <div class="element-wrapper">
                                                                   <div class="row">
                                                                    <asp:Literal ID="lbNews" runat="server"></asp:Literal>
                                                                   </div>
                                                                   <div class="pagination-box">
                                                                      <nav>
                                                                            <asp:Literal ID="lbPage" runat="server"></asp:Literal>
                                                                      </nav>
                                                                   </div>
                                                                </div>
                                                             </section>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
    <asp:HiddenField ID="hdTin" runat="server" />
</asp:Content>
