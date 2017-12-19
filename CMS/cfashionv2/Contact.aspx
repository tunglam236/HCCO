<%@ Page Title="Liên hệ" Language="C#" MasterPageFile="~/Child.master" AutoEventWireup="true"
    CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <div class="contact-category">
        <div class="container">
            <div class="container-inner">
            <h2 class="category-name">Liên hệ</h2>
                <ul class="breadcrumb">
                    <li><a href="/home">Trang chủ</a></li>
                    <li><a href="/contact">Liên hệ</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div id="content" class="container layer-category">
        <div class="main-row full-width">
            <div class="container">
                <div class="row">
                    <div class="main-col col-sm-12 col-md-12">
                        <div class="row sub-row">
                            <div class="sub-col col-sm-12 col-md-12">
                                <div id="ajax-login-block">
                                </div>
                                <div id="ajax-loader">
                                    <img src="image/catalog/AjaxLoader.gif" alt="" />
                                </div>
                                <div class="row">
                                    <div class="main-col col-sm-12 col-md-12">
                                        <div class="row sub-row">
                                            <div class="sub-col col-sm-12 col-md-12">
                                                <div class="">
                                                    <div class="group-title" style="margin-top: 0px;">
                                                        <p>
                                                            Thông tin liên hệ</p>
                                                        <h2>
                                                            Liên hệ</h2>
                                                    </div>
                                                    <div class="owl-container">
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
        </div>
    </div>
</asp:Content>
