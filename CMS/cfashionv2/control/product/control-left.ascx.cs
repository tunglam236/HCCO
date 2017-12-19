using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class control_product_control_left : System.Web.UI.UserControl
{
    CFManagerDataContext db = new CFManagerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadCategories();
        }
    }
    private void loadCategories()
    {
        string result = "";
        var c = from x in db.tProductTypes where x.Status == 1 && x.ParentTypeId==null select x;
        foreach (var item in c.ToList())
        {
            result += "<a class='a-filter' href='/Product.aspx?parentId=" + item.Id.ToString() + "'><i class='fa fa-square-o'></i><b>" + item.ProductTypeName + "</b></a>";

            var child = from n in db.tProductTypes where n.Status==1 && n.ParentTypeId == item.Id select n;
            foreach (var i in child.ToList())
            {
                result += "<a class='a-filter' href='/Product.aspx?Id=" + i.Id.ToString() + "' style='padding-left:10px;'><i class='fa fa-square-o'></i>" + i.ProductTypeName + "</a>";
            }
        }
        lbCategories.Text = result;
    }
}