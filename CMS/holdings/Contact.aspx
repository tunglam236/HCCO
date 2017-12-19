<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        #map
        {
            height: 210px;
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="banner">
        <div id="inner-banner">
            <h1>
                Thông tin liên hệ
            </h1>
            <div class="breadcrumb-area">
                <ul class="breadcrumb">
                    <li class=""><a href="/home">Trang chủ</a> </li>
                    <li class="current">Liên hệ</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="">
        <div class="main-content margin-top-bottom-cp">
            <div class="page_content">
                <div class="container">
                    <div class="row">
                        <div id="block_content_first" class="col-md-12">
                            <div class="container-res">
                                <div class="row">
                                    <div class="">
                                        <div id="post-461" class="post-461 page type-page status-publish hentry">
                                            <a href="http://architecture.crunchpress.com/stay-with-us/"></a>
                                            <div class="entry-content-cp">
                                                <div class="vc_row wpb_row vc_row-fluid vc_custom_1480426776542">
                                                    <div class="wpb_column vc_column_container vc_col-sm-8">
                                                        <div class="vc_column-inner ">
                                                            <div class="wpb_wrapper">
                                                                <section class="contact-section">
                                                <div class="element_wrapper">
                                                   <div class="row">
                                                      <div class="col-md-12">
                                                         <h3>Vui lòng nhập đầy đủ thông tin dưới đây</h3>
                                                         <form id="contact_submit2" class="row">
                                                            <div id="loader"></div>
                                                            <input type="hidden" id="email_to" name="email_to" value="info@domain.com">
                                                            <div class="col-md-6">
                                                               Họ và tên<br />
                                                               <input type="text" name="name" id="name" class="form-control" placeholder="Name" required="">
                                                            </div>
                                                            <div class="col-md-6">
                                                               Email của bạn<br />
                                                               <input type="text" name="email" id="email" class="form-control" placeholder="Email" required="">
                                                            </div>
                                                            <div class="col-md-6">
                                                               Tiêu đề<br />
                                                               <input type="text" name="subject" id="subject" class="form-control" placeholder="Subject" required="">
                                                            </div>
                                                            <div class="col-md-6">
                                                               Contact<br />
                                                               <input type="text" name="contact" id="contact" class="form-control" placeholder="Contact" required="">
                                                            </div>
                                                            <div class="col-md-12">
                                                               Nội dung<br />
                                                               <textarea cols="10" rows="17" name="message" class="form-control" id="message" placeholder="Message" required=""></textarea>
                                                            </div>
                                                            <div class="col-md-12">
                                                               <div class="btn-row">
                                                                  <br />
                                                                  <input type="submit" class="btn btn-primary" value="Gửi thông tin">
                                                               </div>
                                                            </div>
                                                         </form>
                                                      </div>
                                                   </div>
                                                </div>
                                             </section>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="wpb_column vc_column_container vc_col-sm-4">
                                                        <div class="vc_column-inner ">
                                                            <div class="wpb_wrapper">
                                                                <section class="contact-section">
                                                <h3>Thông tin công ty</h3>
                                                <address>
                                                   <div class="address-box">
                                                      <ul>
                                                         <li>
                                                            <i aria-hidden="true" class="fa fa-bank"></i>
                                                            <p>Tầng 29, Tòa nhà HANDICO, Ngã tư Phạm Hùng - Mễ Trì, Quận Nam Từ Liêm, Hà Nội</p>
                                                         </li>
                                                         <li><i aria-hidden="true" class="fa fa-phone"></i> (+84) 24.6666.6838</li>

                                                         <li><i aria-hidden="true" class="fa fa-envelope-o"></i><a href="mailto:info@hcco.vn">Email: info@hcco.vn</a></li>
                                                         <li><i aria-hidden="true" class="fa fa-globe"></i><a href="http://www.hcco.vn">http://www.hcco.vn</a></li>
                                                      </ul>
                                                   </div>
                                                </address>
                                             </section>
                                                                <section class="contact-section">
                                                    <h3>Sơ đồ</h3>
                                                        <div class="address-box">
                                                        <div id="map"></div>
                                                      </section>
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
        </div>
    </div>
    <script type="text/javascript">
        function initMap() {
            var uluru = { lat: 21.0166395, lng: 105.7820841 };
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 17,
                center: uluru
            });
            var marker = new google.maps.Marker({
                position: uluru,
                map: map
            });
        }
    </script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?callback=initMap"></script>
</asp:Content>
