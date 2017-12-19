using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Demo : System.Web.UI.Page
{
    CFileManagerDataContext db = new CFileManagerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["cm_branchTypeId"])))
            {
                Response.Redirect("/login");
            }
        }
    }
    public string loadFile()
    {
        string result = ""; int i = 1;
        //var m = from x in db.tProducts
        //        where  x.Status != 0
        //        orderby x.CreateAt descending
        //        select
        //            new { x.Id,x.ProductName,x.ProductCode,x.Brand,x.CountryName,x.Price,x.PriceSale,x.Status };


        //foreach (var item in m.ToList())
        //{
        //    result += "<tr class='detail-rows' id='" + i.ToString() + "' title='Click để xem chi tiết'>";
        //    result += "<td class='center childrows'></td>";
        //    result += "<td>" + item.ProductCode + "</td>";
        //    result += "<td>" + item.ProductName + "</td>";
        //    result += "<td class='right'>" + string.Format("{0:0,0}", item.Price.Value) + "</td>";
        //    if(item.PriceSale != null)
        //        result += "<td class='right'>" + string.Format("{0:0,0}", item.PriceSale.Value) + "</td>";
        //    else 
        //        result += "<td class='right'>" + "--" + "</td>";
        //    result += "<td>" + item.Brand + "</td>";
        //    result += "<td>" + item.CountryName + "</td>";
        //    if (item.Status.Value == 1)
        //        result += "<td id='stt" + i.ToString() + "' class='center'>Đang kinh doanh</td>";
        //    else
        //        result += "<td id='stt" + i.ToString() + "' class='center'>Ngừng kinh doanh</td>";
        //    result += "</tr>";
        //    i++;
        //}
        return result;
    }
}