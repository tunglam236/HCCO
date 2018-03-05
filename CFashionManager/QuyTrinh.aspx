<%@ Page Title="Sơ đồ tổng quan quy trình sản xuất" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="QuyTrinh.aspx.cs" Inherits="QuyTrinh" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="/dist/css/client.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph" runat="Server">
    <section class="content">
   <div class="row">
       <div class="col-xs-12 col-md-12">
      <section class="">
   <div class="pull-left">
      <h3 style="margin:5px; font-weight:bold;"><i class="fa fa-object-group"></i> Sơ đồ tổng quan quy trình sản xuất</h3>
   </div>
   <div style="text-align:right; padding-bottom:10px;">
       <div class="dropdown">
      <button class="btn btn-sm btn-danger dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-th"></i> Hiển thị</button>
        <ul class="dropdown-menu ul-column" style="margin-left:-65px;">
            <li><a href="#" class="small toggle-vis" data-column="1" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Trạng thái</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="2" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Nhà gia công</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="3" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;KCS kiểm</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="4" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Ngày hoàn thành</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="5" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Mẫu thiết kế</label> </a></li>
            <li><a href="#" class="small toggle-vis" data-column="6" tabIndex="-1"><label><input type="checkbox" checked/>&nbsp;Thiết kế</label> </a></li>
        </ul>
    </div>
</section>
         <div class="box box-warning">
            <div class="box-header" style="text-align:right;">
            </div>
           <div class="box-body">
             <div class="row" style="padding: 5px;">
                <div class="row" style="padding: 5px;">
                    
                    <div class="col-md-3">
                        <div class="input-group">
                          <span class="input-group-addon"><b>1</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="Thiết kế đề xuất các nguyên phụ liệu cần thiết cho việc thiết kế mẫu của mình" value="Đề xuất nhập Nguyên/phụ liệu" disabled class="form-control" />
                          <span class="input-group-addon"><b>→</b></span>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="input-group">
                          <span class="input-group-addon"><b>2</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="Người có chức năng duyệt sẽ phê duyệt phiếu đề xuất này hay không" value="Duyệt đề xuất nhập Nguyên/phụ liệu" disabled class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                    <div class="col-md-3"></div>
                </div>
                <div class="row" style="padding: 5px;">
                    
                    <div class="col-md-3">
                        <div class="input-group">
                          <span class="input-group-addon"><b>3</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="Thiết kế lên mẫu chì hình ảnh" value="Lên mẫu thiết kế hình ảnh" disabled class="form-control" />
                          <span class="input-group-addon"><b>→</b></span>
                        </div>
                    </div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>4</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="Người có chức năng duyệt mẫu chì sẽ quyết định mẫu đạt hay không" value="Duyệt mẫu thiết kế chì" disabled class="form-control" />
                          <span class="input-group-addon"><b>→</b></span>
                        </div>
                    </div>
                    <div class="col-md-3">
                          <div class="input-group">
                          <span class="input-group-addon"><b>O</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="" value="Nếu KHÔNG duyệt thì kết thúc quy trình" disabled class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
                <div class="row" style="padding: 5px;">
                   
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>5</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="" value="Nhập định mức vải mẫu" disabled class="form-control" />
                          <span class="input-group-addon"><b>↓</b></span>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                    <div class="col-md-3"></div>
                     <div class="col-md-3"></div>
                </div>
                <div class="row" style="padding: 5px;">
                    
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>6</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="" value="Xuất nguyên phụ liệu may mẫu" disabled class="form-control" />
                        <span class="input-group-addon"><b>↓</b></span>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                    <div class="col-md-3"></div>
                    <div class="col-md-3"></div>
                </div>
                <div class="row" style="padding: 5px;">
                    
                    <div class="col-md-3">
                        <div class="input-group">
                          <span class="input-group-addon"><b>7</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="" value="May mẫu" disabled class="form-control" />
                          <span class="input-group-addon"><b>↓</b></span>
                        </div>
                    </div>
                    <div class="col-md-3">←--------------------------------------------------------------------</div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>←</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="" value="Sửa lại mẫu" disabled class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
                <div class="row" style="padding: 5px;">
                    
                    <div class="col-md-3"></div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>8</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="" value="Kiểm KCS sản phẩm mẫu" disabled class="form-control" />
                             <span class="input-group-addon"><b>→</b></span>
                        </div>
                    </div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>↑</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="" value="Nếu kiểm không ĐẠT quay lại bước 7" disabled class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
                 <div class="row" style="padding: 5px;">
                    
                     <div class="col-md-3">
                        <div class="input-group">
                          <span class="input-group-addon"><b>O</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="" value="Nếu KHÔNG duyệt kết thúc quy trình" disabled class="form-control" />
                        <span class="input-group-addon"><b>←</b></span>
                        </div>
                    </div>
                     <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>9</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="" value="Duyệt mẫu sống" disabled class="form-control" />
                             <span class="input-group-addon"><b>→</b></span>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="input-group">
                          <span class="input-group-addon"><b>↑</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title="" value="Nếu SỬA LẠI quay lại bước 7" disabled class="form-control" />
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
                  <div class="row" style="padding: 5px;">
                    
                      <div class="col-md-3"></div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>10</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title=""  value="Làm lệnh sản xuất" disabled class="form-control" />
                        <span class="input-group-addon"><b>↓</b></span>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                    <div class="col-md-3"></div>
                </div>
                 <div class="row" style="padding: 5px;">
                   
                    <div class="col-md-3"></div>
                     <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>11</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title=""  value="Đi sơ đồ nhảy size" disabled class="form-control" />
                        <span class="input-group-addon"><b>↓</b></span>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                     <div class="col-md-3"></div>
                </div>
                 <div class="row" style="padding: 5px;">
                   
                     <div class="col-md-3"></div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>12</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title=""  value="Cắt sản xuất" disabled class="form-control" />
                        <span class="input-group-addon"><b>↓</b></span>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                     <div class="col-md-3"></div>
                </div>
                 <div class="row" style="padding: 5px;">
                   
                     <div class="col-md-3"></div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>13</b></span>
                          <input type="text"  data-toggle="tooltip" data-placement="bottom" title="" value="Giao gia công sản xuất" disabled class="form-control" />
                        <span class="input-group-addon"><b>↓</b></span>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="input-group">
                          <span class="input-group-addon"><b>←</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title=""  value="Gia công xử lý lại mẫu lỗi" disabled class="form-control" />
                        </div>
                    </div>
                     <div class="col-md-3"></div>
                </div>
                 <div class="row" style="padding: 5px;">
                   
                     <div class="col-md-3"></div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>14</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title=""  value="Kiểm KCS mẫu gia công" disabled class="form-control" />
                          <span class="input-group-addon"><b>→</b></span>
                        </div>
                    </div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>↑</b></span>
                          <input type="text"  data-toggle="tooltip" data-placement="bottom" title="" value="Kiểm KHÔNG ĐẠT giao lại gia công" disabled class="form-control" />
                        </div>
                    </div>
                     <div class="col-md-3"></div>
                </div>
                  <div class="row" style="padding: 5px;">
                   
                      <div class="col-md-3"></div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>15</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title=""  value="Hoàn thiện thông tin sản phẩm" disabled class="form-control" />
                        <span class="input-group-addon"><b>↓</b></span>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                     <div class="col-md-3"></div>
                </div>
                 <div class="row" style="padding: 5px;">
                   
                     <div class="col-md-3"></div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>16</b></span>
                          <input type="text"  data-toggle="tooltip" data-placement="bottom" title="" value="Nhập sản phẩm vào kho" disabled class="form-control" />
                        <span class="input-group-addon"><b>↓</b></span>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                     <div class="col-md-3"></div>
                </div>
                  <div class="row" style="padding: 5px;">
                  
                      <div class="col-md-3"></div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>17</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title=""  value="Chụp ảnh sản phẩm" disabled class="form-control" />
                        <span class="input-group-addon"><b>↓</b></span>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                      <div class="col-md-3"></div>
                </div>
                  <div class="row" style="padding: 5px;">
                   
                      <div class="col-md-3"></div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>18</b></span>
                          <input type="text" data-toggle="tooltip" data-placement="bottom" title=""  value="Xuất kho sản phẩm" disabled class="form-control" />
                        <span class="input-group-addon"><b>↓</b></span>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                     <div class="col-md-3"></div>
                </div>
                  <div class="row" style="padding: 5px;">
                   
                      <div class="col-md-3"></div>
                    <div class="col-md-3">
                         <div class="input-group">
                          <span class="input-group-addon"><b>19</b></span>
                          <input type="text"  data-toggle="tooltip" data-placement="bottom" title="" value="Nhập kho điều chuyển" disabled class="form-control" />
                        <span class="input-group-addon"><b>↓</b></span>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                     <div class="col-md-3"></div>
                </div>
            </div>
          </div>
         </div>
      </div>
   </div>
</section>
 <script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>
</asp:Content>

