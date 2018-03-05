<%@ Control Language="C#" AutoEventWireup="true" CodeFile="footer.ascx.cs" Inherits="control_footer" %>
<footer>
               <%--<div class="newsletter-group">
                  <div class="container">
                     <div class="container-inner">
                     <div class="newletter-subscribe-container">
                           <div class="newletter-subscribe">
                              <div id="boxes-normal" class="newletter-container">
                                 <div style="" id="dialog-normal" class="window">
                                    <div class="box">
                                       <div class="newletter-title">
                                          <h3>Đăng kí nhận tin</h3>
                                          <label>Get e-mail updates about our latest shop and special offers.</label>
                                       </div>
                                       <div class="box-content newleter-content">
                                          <div class="des-testimonial">
                                          </div>
                                          <div id="frm_subscribe-normal">
                                             <div name="subscribe" id="subscribe-normal">
                                                <input type="text" value="" name="subscribe_email" id="subscribe_email-normal" placeholder="Nhập địa chỉ Email">
                                                <a class="btn">Subscribe!</a>
                                             </div>
                                          </div>
                                          <!-- /#frm_subscribe -->
                                          <div id="notification-normal"></div>
                                       </div>
                                       <!-- /.box-content -->
                                    </div>
                                 </div>
                               
                              </div>
                           </div>
                        </div>
                        <div class="follow">
                           <h3>Theo dõi</h3>
                           <ul class="link-follow">
                              <li class="first"><a class="twitter icon ion-social-instagram" title="Instagram" href="http://instagram.com/cfashionvn"><span>Instagram</span></a></li>
                              <li><a class="google icon ion-social-googleplus" title="Google" href="javascript:void(0)"><span>google</span></a></li>
                              <li><a class="facebook icon ion-social-facebook" title="Facebook" href="http://facebook.com/cfashionvn"><span>facebook</span></a></li>
                              <li><a class="youtube icon ion-social-youtube" title="Youtube" href="javascript:void(0)"><span>youtube</span></a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>--%>
               <div class="footer-top">
                  <div class="container">
                     <div class="row">
                        <div class="col-md-3 col-sm-12 col-footer">
                           <h3 class="footer-title">CÁC ĐƠN VỊ VẬN CHUYỂN</h3>
                           <div class="footer-content">
                              <img src="/image/footer/post.png" />
                           </div>
                           <h3 class="footer-title footer-title-bottom">CÁCH THỨC THANH TOÁN</h3>
                           <div class="footer-content">
                              <img src="/image/footer/vc.png" />
                           </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-footer">
                           <h3 class="footer-title">Chính sách & quy định</h3>
                           <div class="footer-content">
                              <asp:Literal ID="lbIntroNews" runat="server"></asp:Literal>
                           </div>
                        </div>
                        <div class="col-md-2 col-sm-6 col-footer">
                           <h3 class="footer-title">Khách hàng</h3>
                           <div class="footer-content">
                              <ul class="list-unstyled text-content">
                                 <li><a href="javascript:void(0)" onclick="ocajaxlogin.appendLoginForm()">- Đăng nhập</a></li>
                                 <li><a href="javascript:void(0)" onclick="ocajaxlogin.appendRegisterForm()">- Đăng kí thành viên</a></li>
                                 <li><a href="/cart">- Giỏ hàng</a></li>
                                 <%--<li><a href="/t/member/0">- Thông tin cá nhân</a></li>
                                 <li><a href="/t/member/2">- Quản lý đơn thàng</a></li>
                                 <li><a href="/t/member/3">- Lịch sử tích điểm</a></li>--%>
                              </ul>
                           </div>
                        </div>
                        <div class="col-md-4 col-sm-6 col-footer">
                           <div class="footer-content">
                              <div class="footer-contact">
                                 <a class="logo-footer" href="/home"><img src="/image/CFashion-logo-62.png" alt="img"></a>
                                 <p><strong><i class="fa fa-home"></i> Địa chỉ cửa hàng:</strong>421 Kim Mã - Ba Đình - Hà Nội.</p>
                                 <p><strong><i class="fa fa-phone"></i> Hotline:</strong>(+8424) 22 18 95 95</p>
                                 <p><strong><i class="fa fa-envelope"></i> Email:</strong>info@hcco.vn</p>
                                  <p><strong><i class="fa fa-globe"></i> Website:</strong><a href="http://cfashion.vn" target="_blank">http://cfashion.vn</a> </p>
                                  <p><strong><i class="fa fa-facebook-square"></i> Facebook:</strong><a href="http://facebook.com/cfashionvn" target="_blank">http://facebook.com/cfashionvn</a> </p>
                                  <p><strong><i class="fa fa-instagram"></i> Instagram:</strong><a href="http://instagram.com/cfashionvn" target="_blank">http://instagram.com/cfashionvn</a> </p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="footer-bottom">
                  <div class="container">
                     <div class="container-inner">
                        <div class="footer-copyright">
                           <span>Copyright &copy; 2017 <a href="#">HCCO</a>. All rights reserved.</span>
                        </div>
                        <div class="footer-payment">
                           <%--<a href="#"><img src="/image/catalog/cmsblock/payment.png" alt="payment"></a>--%>
                        </div>
                     </div>
                  </div>
               </div>
               <div id="back-top"><i class="fa fa-angle-up" style="margin-top:10px;"></i></div>
               <script type="text/javascript">
                   $(document).ready(function () {
                       // hide #back-top first
                       $("#back-top").hide();
                       // fade in #back-top
                       $(function () {
                           $(window).scroll(function () {
                               if ($(this).scrollTop() > 300) {
                                   $('#back-top').fadeIn();
                               } else {
                                   $('#back-top').fadeOut();
                               }
                           });
                           // scroll body to 0px on click
                           $('#back-top').click(function () {
                               $('body,html').animate({ scrollTop: 0 }, 800);
                               return false;
                           });
                       });
                   });
               </script>
             </footer>
