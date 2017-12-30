using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Norm : System.Web.UI.Page
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
            else
            {
                lbData.Text = loadNorm();
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadNorm();
    }
    public string loadNorm()
    {
        string result = ""; int i = 1;

        var m = from x in db.tNorms
                from y in db.tProductTypes
                where x.ProductTypeId == y.Id && x.Status != 0
                select new { x.Id, ProductTypeId = y.Id, y.ProductTypeName, x.ClothPrimary, x.ClothSub, x.Description };

        foreach (var item in m.ToList())
        {
            result += "<tr  data-toggle='modal' data-target='#addDept' class='detail-rows' onclick='update_modal(\"" + item.Id.ToString() + "\",\"" + item.ProductTypeId + "\",\"" + item.ClothPrimary + "\",\"" + item.ClothSub + "\",\"" + item.Description + "\");' id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.ProductTypeName + "</td>";
            result += "<td>" + item.ClothPrimary + "</td>";
            result += "<td>" + item.ClothSub + "</td>";
            result += "<td>" + item.Description + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}