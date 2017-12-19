using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Personal : System.Web.UI.Page
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

        //var m = from x in db.tPersonnels
        //        from y in db.tBranchTypes
        //        from z in db.tBranches
        //        where x.BranchTypeId == y.Id && x.BranchId == z.Id && x.BranchTypeId==int.Parse(branchType.Trim()) && x.Status!=0
        //        select new { x.Id,x.BranchTypeId, x.BranchId,x.Status, x.Code, x.Name, x.Sex, x.Birthday, x.Address,x.Email, x.Phone, x.CreateAt, BranchTypeName = y.Name, z.BranchName,x.Note };

        //foreach (var item in m.ToList())
        //{
        //    result += "<tr  data-toggle='modal' data-target='#addBranch' class='detail-rows' onclick='updateBranch_modal(\"" + item.Id.ToString() + "\",\"" + item.BranchTypeId.ToString() + "\",\"" + item.BranchId.ToString() + "\",\"" + item.Code + "\",\"" + item.Name + "\",\"" + item.Sex + "\",\"" + (item.Birthday !=null ? item.Birthday.Value.ToString("dd/MM/yyyy") : "") + "\",\"" + item.Phone + "\",\"" + item.Email + "\",\"" + item.Address + "\",\"" + item.Note + "\",\"" + item.Status + "\");' id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
        //    result += "<td class='center'>" + i.ToString() + "</td>";
        //    result += "<td>" + item.BranchTypeName + "</td>";
        //    result += "<td>" + item.BranchName + "</td>";
        //    result += "<td>" + item.Code + "</td>";
        //    result += "<td>" + item.Name + "</td>";
        //    if(item.Sex.Value)
        //        result += "<td>" + "Nam" + "</td>";
        //    else
        //        result += "<td>" +  "Nữ" + "</td>";
        //    if (item.Birthday!=null)
        //        result += "<td>" + item.Birthday.Value.ToString("dd/MM/yyyy") + "</td>";
        //    else
        //        result += "<td></td>";
        //    result += "<td>" + item.Phone + "</td>";
        //    result += "<td>" + item.Email+ "</td>";
        //    result += "<td>" + item.Address + "</td>";
        //    result += "<td>" + item.CreateAt.Value.ToString("dd/MM/yyyy HH:mm:ss") + "</td>";
        //    result += "</tr>";
        //    i++;
        //}
        return result;
    }
}