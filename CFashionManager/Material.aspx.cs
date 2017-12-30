using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Material : System.Web.UI.Page
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
                lbData.Text = loadDept();
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadDept();
    }
    public string loadDept()
    {
        string result = ""; int i = 1;

        var m = from x in db.tMaterials
                where x.Status != 0
                select new { x.Id, x.MaterialCode, x.MaterialName, x.Description, x.CreateAt };

        foreach (var item in m.ToList())
        {
            result += "<tr  data-toggle='modal' data-target='#addDept' class='detail-rows' onclick='update_modal(\"" + item.Id.ToString() + "\",\"" + item.MaterialCode + "\",\"" + item.MaterialName + "\",\"" + item.Description + "\");' id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.MaterialCode + "</td>";
            result += "<td>" + item.MaterialName + "</td>";
            result += "<td>" + item.Description + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}