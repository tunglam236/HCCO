using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Discount : System.Web.UI.Page
{
    CFileManagerDataContext db = new CFileManagerDataContext();
    clsProcess cl = new clsProcess();
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
                loadBranchType();
                lbData.Text = loadDiscount(rdBranchType.SelectedValue);
            }
        }
    }
    void loadBranchType()
    {
        rdBranchType.DataSource = from x in db.tBranchTypes
                                  where x.Status == 1
                                  select new { x.Id, x.Name };
        rdBranchType.DataTextField = "Name";
        rdBranchType.DataValueField = "Id";
        rdBranchType.DataBind();
        rdBranchType.SelectedValue = Session["cm_branchTypeId"].ToString();
    }
    
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadDiscount(rdBranchType.SelectedValue);
    }
   
    public string loadDiscount(string branchType)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_loadDiscount(branchType);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' id='" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center childrows'></td>";
            result += "<td>" + item.DiscountName + "</td>";
            result += "<td>" + item.DiscountType + "</td>";
            result += "<td>" + item.DiscountNumber + "</td>";
            result += "<td>" + item.DiscountValue + "</td>";
            result += "<td>" + item.OrderMinValue + "</td>";
            result += "<td>" + item.StartDate + "</td>";
            result += "<td>" + item.EndDate + "</td>";
            result += "<td>" + item.CreateBy + "</td>";
            result += "<td>" + item.CreateAt + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}