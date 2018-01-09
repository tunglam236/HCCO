using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Price : System.Web.UI.Page
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
                loadProductType(rdBranchType.SelectedValue);
                lbData.Text = loadProduct(rdBranchType.SelectedValue, rdProductType.SelectedValue, txtCodeId.Text.Trim());
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
        //rdBranchType.Items.Insert(0, new ListItem("Tất cả", ""));
        rdBranchType.SelectedValue = Session["cm_branchTypeId"].ToString();
    }
    void loadProductType(string branchTypeId)
    {
        rdProductType.DataSource = from x in db.tProductTypes
                                   where x.Status == 1 && x.BranchTypeId == int.Parse(branchTypeId) && x.ParentTypeId == null
                                   select new { x.Id, x.ProductTypeName };
        rdProductType.DataTextField = "ProductTypeName";
        rdProductType.DataValueField = "Id";
        rdProductType.DataBind();
        rdProductType.Items.Insert(0, new ListItem("Tất cả", ""));
        rdProductType.SelectedValue = "";
    }
    protected void rdBranchType_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadProductType(rdBranchType.SelectedValue);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadProduct(rdBranchType.SelectedValue,rdProductType.SelectedValue, txtCodeId.Text.Trim());
        Session["cm_branchTypeId"] = rdBranchType.SelectedValue;
    }
    public string loadProduct(string branchType,string productType, string codeId)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_loadPrice(branchType, productType, codeId);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows removeprice" + item.PriceId.ToString() + "' id='" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center childrows'></td>";
            result += "<td>" + item.BranchTypeName + "</td>";
            result += "<td>" + item.CodeId + "</td>";
            result += "<td>" + item.ProductCode + "</td>";
            result += "<td>" + item.ProductName + "</td>";
            result += "<td class='right'>" +string.Format("{0:0,0}", item.Price.Value) + "</td>";
            result += "<td>" + item.FromDate + "</td>";
            result += "<td>" + item.EndDate + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}