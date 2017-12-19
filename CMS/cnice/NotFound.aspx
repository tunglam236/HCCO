<%@ Page Title="Không tìm thấy trang yêu cầu" Language="C#" MasterPageFile="~/Child.master" AutoEventWireup="true" CodeFile="NotFound.aspx.cs" Inherits="NotFound" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .info h1 {
        font-size: 102px;
        font-weight: 700;
        margin-top: 60px;
        line-height: 105px;
        color: #f35d34;
        text-transform: uppercase;
        }
        .info h2 {
            font-size: 42px;
            font-weight: 700;
            line-height: 48px;
            color: #000;
            text-transform: uppercase;
        }
        .info p {
            font-size: 16px;
            line-height: 24px;
            font-weight: 300;
            color: #000;
            text-transform: uppercase;
            margin: 15px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <div class="animationload">
        <div class="loader">
        </div>
    </div>
    <div id="wrapper">
        <div class="container">
            <div class="col-xs-12 col-sm-7 col-lg-7">
                <!-- Info -->
                <div class="info">
                    <h1>404</h1>
                    <h2>Không tìm thấy nội dung</h2>
                    <p>Trang bạn đang tìm kiếm đã được di chuyển, đã bị xoá, hoặc đường dẫn không tồn tại</p>
                    <a href="/home" class="btn"><i class="fa fa-home"></i> Quay về trang chủ</a>
                </div>
                <!-- end Info -->
            </div>

            <div class="col-xs-12 col-sm-5 col-lg-5 text-center">
                <div class="monkey">
                    <img src="notfound/img/monkey.gif.pagespeed.gif" alt="Monkey" />
                </div>
            </div>

        </div>
    </div>
    <script src="notfound/js/pagespeed.js" type="text/javascript"></script>
    <script src="notfound/page.js"></script>
    <script src="notfound/js/jquery.nicescroll.min.js" type="text/javascript"></script>
    <script type="text/javascript">$(window).load(function () { "use strict"; $(".loader").delay(400).fadeOut(); $(".animationload").delay(400).fadeOut("fast"); }); $("html").niceScroll({ cursorcolor: '#fff', cursoropacitymin: '0', cursoropacitymax: '1', cursorwidth: '2px', zindex: 999999, horizrailenabled: false, enablekeyboard: false });</script>
</asp:Content>

