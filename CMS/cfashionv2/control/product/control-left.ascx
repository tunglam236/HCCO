<%@ Control Language="C#" AutoEventWireup="true" CodeFile="control-left.ascx.cs"
    Inherits="control_product_control_left" %>
<aside id="column-left" class="col-sm-12 col-md-3">
                        <div class="layernavigation-module">
                           <div class="panel panel-default">
                              
                              <div class="layered">
                                 <div class="list-group">
                                    
                                    <div class="filter-attribute-container filter-categories">
                                       <div class="layered-heading module-title">
                                         <h2>Danh mục sản phẩm</h2>
                                      </div>
                                       <div class="list-group-item">
                                          <div id="filter-group3">
                                            <asp:Literal ID="lbCategories" runat="server"></asp:Literal>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="filter-attribute-container filter-attribute-remove-container">
                                    </div>
                                    <div class="filter-attribute-container filter-price">
                                       <label>Lọc theo khoảng giá</label>
                                       <div class="list-group-item">
                                          <div class="filter-price">
                                             <div id="slider-price"></div>
                                             <div class="slider-values">
                                                <input id="price-from" disabled="disabled" class="input-price" type="text" value="100000" placeholder="Min" name="price-from"/><sup> đ</sup> - 
                                                <input id="price-to" disabled="disabled" class="input-price" type="text" value="1000000" placeholder="Max" name="price-to" /><sup> đ</sup>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    
                                   
                                    <div class="filter-attribute-container filter-manufacturer">
                                       <label>Lọc theo thương hiệu</label>
                                       <div class="list-group-item">
                                          <div id="filter-group2">
                                             <a  name="12"><i class="fa fa-square-o"></i>Calvin Klein (4)</a>
                                             <a  name="13"><i class="fa fa-square-o"></i>Chanel (2)</a>
                                             <a  name="14"><i class="fa fa-square-o"></i>Christian Dior (9)</a>
                                             <a  name="15"><i class="fa fa-square-o"></i>ferragamo (11)</a>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <script type="text/javascript">
                               var filter_url = '';
                               var ids = [];
                               var min_price = parseFloat('100000');
                               var max_price = parseFloat('1000000');
                               var current_min_price = parseFloat($('#price-from').val());
                               var current_max_price = parseFloat($('#price-to').val());

                               $('#slider-price').slider({
                                   range: true,
                                   step: 50000,
                                   min: min_price,
                                   max: max_price,
                                   values: [current_min_price, current_max_price],
                                   slide: function (event, ui) {

                                       $('#price-from').val(ui.values[0]);
                                       $('#price-to').val(ui.values[1]);
                                       current_min_price = ui.values[0];
                                       current_max_price = ui.values[1];
                                   },
                                   stop: function (event, ui) {
                                       //filter_url = $('.price-url').val();
                                       var currentLocation = window.location;

                                       filter_url = currentLocation + '&price-from=' + current_min_price + '&price-to=' + current_max_price;
                                       //alert(filter_url);

                                       //window.location.href = filter_url;
                                       //oclayerednavigationajax.filter(filter_url);
                                   }
                               });

                               $('.a-filter').click(function () {
                                   var id = $(this).attr('name');
                                   var filter_ids = '';
                                   filter_url = $('.filter-url').val();
                                   if ($(this).hasClass('add-filter') == true) {
                                       ids.push(id);
                                   } else if ($(this).hasClass('remove-filter') == true) {
                                       ids = $.grep(ids, function (value) {
                                           return value != id;
                                       });
                                   }
                                   filter_ids = ids.join(',');
                                   filter_url += '&filter=' + filter_ids;
                                   //alert(filter_url);
                                   //oclayerednavigationajax.filter(filter_url);
                               });

                               $('.clear-filter').click(function () {
                                   ids = [];
                               });

                               $(document).ajaxComplete(function () {
                                   var current_min_price = parseFloat($('#price-from').val());
                                   var current_max_price = parseFloat($('#price-to').val());

                                   $('#slider-price').slider({
                                       range: true,
                                       min: min_price,
                                       max: max_price,
                                       values: [current_min_price, current_max_price],
                                       slide: function (event, ui) {
                                           $('#price-from').val(ui.values[0]);
                                           $('#price-to').val(ui.values[1]);
                                           current_min_price = ui.values[0];
                                           current_max_price = ui.values[1];
                                       },
                                       stop: function (event, ui) {
                                           filter_url = $('.price-url').val();
                                           filter_url += '&price=' + current_min_price + ',' + current_max_price;
                                           //oclayerednavigationajax.filter(filter_url);
                                           //alert(filter_url);
                                       }
                                   });
                                   $('.a-filter').click(function () {
                                       var id = $(this).attr('name');
                                       var filter_ids = '';
                                       filter_url = $('.filter-url').val();

                                       if ($(this).hasClass('add-filter') == true) {
                                           ids.push(id);
                                       } else if ($(this).hasClass('remove-filter') == true) {
                                           ids = $.grep(ids, function (value) {
                                               return value != id;
                                           });
                                       }
                                       filter_ids = ids.join(',');
                                       filter_url += '&filter=' + filter_ids;
                                       //oclayerednavigationajax.filter(filter_url);
                                       //alert(filter_url);
                                   });

                                   $('.clear-filter').click(function () {
                                       ids = [];
                                   });
                               });
                               $('.layered .filter-attribute-container label').click(function () {
                                   $(this).next().slideToggle();
                               });
                              
                           </script>
                        </div>
                        <div class="random-products-slider module-sidebar">
                           <div class="group-title">
                              <h2>Sản phẩm ngẫu nhiên </h2>
                           </div>
                           <div class="owl-container">
                              <div class="random_products_slider box-module">
                                 <div class="row_items">
                                    <div class="item">
                                       <div class="item-inner">
                                          <div class="images-container">
                                             <a class="product-image" href="#">
                                             <img  src="image/cache/catalog/products/2-600x706.jpg" alt="Fusion Backpacks" />
                                             </a>
                                             <div class="actions">
                                             </div>
                                             <!-- actions -->
                                          </div>
                                          <!-- image -->
                                          <div class="des-container">
                                             <h2 class="product-name">
                                                <a href="#">Fusion Backpacks</a>
                                             </h2>
                                             <div class="price-box box-regular">
                                                <span class="regular-price">
                                                <span class="price">$98.00</span>
                                                </span>
                                             </div>
                                             <div class="ratings">
                                                <div class="rating-box">
                                                   <div class="rating4">rating</div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="item">
                                       <div class="item-inner">
                                          <div class="images-container">
                                             <a class="product-image" href="#">
                                             <img  src="image/cache/catalog/products/13-600x706.jpg" alt="Crown Summit Backpacks" />
                                             </a>
                                             <div class="actions">
                                             </div>
                                             <!-- actions -->
                                          </div>
                                          <!-- image -->
                                          <div class="des-container">
                                             <h2 class="product-name">
                                                <a href="#">Crown Summit Backpacks</a>
                                             </h2>
                                             <div class="price-box box-regular">
                                                <span class="regular-price">
                                                <span class="price">$1,202.00</span>
                                                </span>
                                             </div>
                                             <div class="ratings">
                                                <div class="rating-box">
                                                   <div class="rating1">rating</div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="item">
                                       <div class="item-inner">
                                          <div class="images-container">
                                             <a class="product-image" href="#">
                                             <img  src="image/cache/catalog/products/15-600x706.jpg" alt="Endeavor Daytrip Backpacks" />
                                             </a>
                                             <div class="actions">
                                             </div>
                                             <!-- actions -->
                                          </div>
                                          <!-- image -->
                                          <div class="des-container">
                                             <h2 class="product-name">
                                                <a href="#">Endeavor Daytrip Backpacks</a>
                                             </h2>
                                             <div class="price-box box-regular">
                                                <span class="regular-price">
                                                <span class="price">$98.00</span>
                                                </span>
                                             </div>
                                             <div class="ratings">
                                                <div class="rating-box">
                                                   <div class="rating3">rating</div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <div class="item">
                                       <div class="item-inner">
                                          <div class="images-container">
                                             <a class="product-image" href="#">
                                             <img  src="image/cache/catalog/products/6-600x706.jpg" alt="Radiant Tees" />
                                             </a>
                                             <div class="actions">
                                             </div>
                                             <!-- actions -->
                                          </div>
                                          <!-- image -->
                                          <div class="des-container">
                                             <h2 class="product-name">
                                                <a href="#">Radiant Tees</a>
                                             </h2>
                                             <div class="price-box box-regular">
                                                <span class="regular-price">
                                                <span class="price">$241.99</span>
                                                </span>
                                             </div>
                                             <div class="ratings">
                                                <div class="rating-box">
                                                   <div class="rating3">rating</div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="row_items">
                                    <div class="item">
                                       <div class="item-inner">
                                          <div class="images-container">
                                             <a class="product-image" href="#">
                                             <img  src="image/cache/catalog/products/9-600x706.jpg" alt="Sprite Yoga Companion Kits" />
                                             </a>
                                             <div class="actions">
                                             </div>
                                             <!-- actions -->
                                          </div>
                                          <!-- image -->
                                          <div class="des-container">
                                             <h2 class="product-name">
                                                <a href="#">Sprite Yoga Companion Kits</a>
                                             </h2>
                                             <div class="price-box box-regular">
                                                <span class="regular-price">
                                                <span class="price">$98.00</span>
                                                </span>
                                             </div>
                                             <div class="ratings">
                                                <div class="rating-box">
                                                   <div class="rating2">rating</div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <script type="text/javascript">
                               $(document).ready(function () {
                                   $(".random_products_slider").owlCarousel({
                                       autoPlay: true,
                                       items: 1,
                                       slideSpeed: 1000,
                                       navigation: false,
                                       paginationNumbers: true,
                                       pagination: false,
                                       stopOnHover: false,
                                       lazyLoad: true,
                                       itemsDesktop: [1199, 1],
                                       itemsDesktopSmall: [991, 2],
                                       itemsTablet: [767, 2],
                                       itemsMobile: [479, 1],
                                       addClassActive: true,
                                       scrollPerPage: false,
                                       afterAction: function () {
                                           $(".random_products_slider .owl-wrapper .owl-item").removeClass('first');
                                           $(".random_products_slider .owl-wrapper .owl-item").removeClass('last');
                                           $(".random_products_slider .owl-wrapper .owl-item").removeClass('before-active');
                                           $(".random_products_slider .owl-wrapper .owl-item.active:first").addClass('first');
                                           $(".random_products_slider .owl-wrapper .owl-item.active:last").addClass('last');
                                           $('.random_products_slider .owl-wrapper .owl-item.active:first').prev().addClass('before-active');
                                       }

                                   });
                               });
                           </script>
                        </div>
                     </aside>
