using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Function : System.Web.UI.Page
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
                lbData.Text = loadFunction();
            }
        }
    }
   
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbData.Text = loadFunction();
    }

    public string loadFunction()
    {
        string result = ""; int i = 1;

        var m = from x in db.tRoles
                where x.ParentId==null && x.Status != 0
                orderby x.Position,x.Sort
                select new { x.Id, x.ModuleCode,x.ModuleName,x.ParentId,x.Link,x.Position,x.Sort,x.Icon,x.Status,x.IsFunction };

        foreach (var item in m.ToList())
        {
            result += "<tr style='font-weight:bold' data-toggle='modal' data-target='#addColor' class='detail-rows' onclick='updateColor_modal(\"" + item.Id.ToString() + "\",\"" + item.ModuleCode.ToString() + "\",\"" + item.ModuleName + "\",\"" + item.ParentId + "\",\"" + item.Link + "\",\""+item.Position+ "\",\"" + item.Sort+ "\",\"" + item.Icon+ "\",\"" + item.IsFunction+ "\");' id='delete" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center'>" + i.ToString() + "</td>";
            result += "<td>" + item.ModuleCode + "</td>";
            result += "<td>" + item.ModuleName + "</td>";
            result += "<td>--</td>";
            result += "<td>" + item.Link + "</td>";
            result += "<td>" + item.Position + "</td>";
            result += "<td>" + item.Sort + "</td>";
            result += "<td>" + item.Icon + "</td>";
            result += "<td>" + (item.Status.Value==1 ? "Hiển thị" : "Không hiển thị") + "</td>";
            result += "</tr>";
            i++;
            var child = from y in db.tRoles where y.ParentId==item.Id
                        orderby y.Position, y.Sort
                        select new { y.Id, y.ModuleCode, y.ModuleName, y.ParentId, y.Link, y.Position, y.Sort, y.Icon, y.Status, y.IsFunction };
            foreach (var c in child.ToList())
            {
                result += "<tr  data-toggle='modal' data-target='#addColor' class='detail-rows' onclick='updateColor_modal(\"" + c.Id.ToString() + "\",\"" + c.ModuleCode.ToString() + "\",\"" + c.ModuleName + "\",\"" + c.ParentId + "\",\"" + c.Link + "\",\"" + c.Position + "\",\"" + c.Sort + "\",\"" + c.Icon + "\",\"" + c.IsFunction + "\");' id='delete" + c.Id.ToString() + "' title='Click để xem chi tiết'>";
                result += "<td class='center'>" + i.ToString() + "</td>";
                result += "<td>" + c.ModuleCode + "</td>";
                result += "<td>" + c.ModuleName + "</td>";
                result += "<td>" + item.ModuleName + "</td>";
                result += "<td>" + c.Link + "</td>";
                result += "<td>" + c.Position + "</td>";
                result += "<td>" + c.Sort + "</td>";
                result += "<td>" + c.Icon + "</td>";
                result += "<td>" + (c.Status.Value == 1 ? "Hiển thị" : "Không hiển thị") + "</td>";
                result += "</tr>";
                i++;
            }
        }
        return result;
    }
    [WebMethod]
    public static List<result> getParent()
    {
        var l = new List<result>();
        CFileManagerDataContext db = new CFileManagerDataContext();
        var m = from x in db.tRoles
                where x.ParentId == null
                orderby x.Position,x.Sort
                select new { x.Id, x.ModuleCode, x.ModuleName };
        foreach (var item in m.ToList())
        {
            var t = new result();
            t._id = item.Id.ToString();
            t._content = item.ModuleName;
            l.Add(t);
        }
        return l;
    }
    public class result
    {
        private string id = "", content = "", mess = "";
        public string _id
        {
            set { id = value; }
            get { return id; }
        }
        public string _content
        {
            set { content = value; }
            get { return content; }
        }
        public string _mess
        {
            set { mess = value; }
            get { return mess; }
        }
    }
}