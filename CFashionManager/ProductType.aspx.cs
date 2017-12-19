using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductType : System.Web.UI.Page
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
                loadBranchType();

                lbData.Text = loadBranch(rdBranchType.SelectedValue);
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
        lbData.Text = loadBranch(rdBranchType.SelectedValue);
    }

    public string loadBranch(string branchType)
    {
        string result = ""; int i = 1;

        var m = from x in db.tProductTypes
                where x.BranchTypeId == int.Parse(branchType.Trim()) && x.ParentTypeId == null && x.Status != 0
                select new { x.Id,x.BranchTypeId, x.ProductTypeCode, x.ProductTypeName, x.ParentTypeId,x.CreateAt };

        foreach (var item in m.ToList())
        {
            result += "<tr  data-toggle='modal' data-target='#addProductType' class='detail-rows' onclick='updateProductType_modal(\"" + item.Id.ToString() + "\",\"" + item.BranchTypeId.ToString() + "\",\"" + item.ProductTypeCode + "\",\"" + item.ProductTypeName + "\",\"" + item.ParentTypeId.ToString() + "\");' id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.ProductTypeCode + "</td>";
            result += "<td>" + item.ProductTypeName + "</td>";
            result += "<td>--</td>";
            result += "<td>" + item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss") + "</td>";
            result += "</tr>";
            i++;
            var child = from n in db.tProductTypes
                        where n.BranchTypeId == int.Parse(branchType.Trim()) && n.ParentTypeId==item.Id && n.Status!=0
                        select new { n.Id,n.BranchTypeId, n.ProductTypeCode, n.ProductTypeName, n.ParentTypeId, n.CreateAt };
            foreach (var item2 in child.ToList())
            {
                result += "<tr  data-toggle='modal' data-target='#addProductType' class='detail-rows' onclick='updateProductType_modal(\"" + item2.Id.ToString() + "\",\"" + item2.BranchTypeId.ToString() + "\",\"" + item2.ProductTypeCode + "\",\"" + item2.ProductTypeName + "\",\"" + item2.ParentTypeId.ToString() + "\");' id='delete" + item2.Id.ToString() + "' title='Click để xem chi tiết'>";
                result += "<td class='center'>" + i.ToString() + "</td>";
                result += "<td>" + item2.ProductTypeCode + "</td>";
                result += "<td>" + item2.ProductTypeName + "</td>";
                result += "<td>"+item2.ProductTypeName+"</td>";
                result += "<td>" + item2.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss") + "</td>";
                result += "</tr>";
                i++;
            }
        }
        return result;
    }
}