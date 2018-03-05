<%@ Page Title="Tin tức" Language="C#" MasterPageFile="~/Child.master" AutoEventWireup="true"
    CodeFile="News.aspx.cs" Inherits="News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <div class="news-category">
        <div class="container">
            <div class="container-inner">
            <h2 class="category-name">Tin khuyến mại</h2>
                <ul class="breadcrumb">
                    <li><a href="/home">Trang chủ</a></li>
                    <li><a href="/news">Tin khuyến mại</a></li>
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
                        <div class="opc-hidden">
                            <input type="hidden" id="input-opc-status" value="1" />
                        </div>
                        <div class="article-page">
                            <asp:Literal ID="lbNews" runat="server"></asp:Literal>
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
</asp:Content>
