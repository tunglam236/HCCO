using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Supplier : System.Web.UI.Page
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

                lbData.Text = loadSupplier(rdBranchType.SelectedValue);
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
        rdBranchType.Items.Insert(0, new ListItem("Tất cả", ""));
        rdBranchType.SelectedValue = "";
    }
    
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadSupplier(rdBranchType.SelectedValue);
    }
    public string loadSupplier(string branchType)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_loadSupplier(branchType);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' onclick='showModalUpdate(" + item.Id.ToString() + ");' data-toggle='modal' data-target='#addSupplier' id='" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.BranchTypeName + "</td>";
            result += "<td>" + item.SupplierCode + "</td>";
            result += "<td>" + item.SupplierName + "</td>";
            result += "<td>" + item.Address + "</td>";
            result += "<td>" + item.Phone + "</td>";
            result += "<td>" + item.ContactName + "</td>";
            result += "<td>" + item.Info + "</td>";
            result += "<td>" + item.CreateBy + "</td>";
            result += "<td>" + item.CreateAt + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}