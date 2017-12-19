using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Unit : System.Web.UI.Page
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

                lbData.Text = loadUnit(rdBranchType.SelectedValue);
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
        lbData.Text = loadUnit(rdBranchType.SelectedValue);
    }

    public string loadUnit(string branchType)
    {
        string result = ""; int i = 1;

        var m = from x in db.tUnits
                from y in db.tBranchTypes
                where x.BranchTypeId == y.Id && x.BranchTypeId == int.Parse(branchType.Trim()) && x.Status != 0
                select new { x.Id, x.UnitCode, x.UnitName, x.CreateAt, x.BranchTypeId, BranchTypeName = y.Name };

        foreach (var item in m.ToList())
        {
            result += "<tr  data-toggle='modal' data-target='#addColor' class='detail-rows' onclick='updateColor_modal(\"" + item.Id.ToString() + "\",\"" + item.BranchTypeId.ToString() + "\",\"" + item.BranchTypeName.Replace("'", ".") + "\",\"" + item.UnitCode + "\",\"" + item.UnitName + "\");' id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.UnitCode + "</td>";
            result += "<td>" + item.UnitName + "</td>";
            result += "<td>" + item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss") + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}