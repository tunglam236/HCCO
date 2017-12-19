using System;
using System.Linq;
using System.Web.UI.WebControls;

public partial class News : System.Web.UI.Page
{
    CFileManagerDataContext db = new CFileManagerDataContext();
    clsProcess cl = new clsProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnShow.Visible = false;
            btnUpdate.Visible = false;
            btnSave.Visible = false;
            if (string.IsNullOrEmpty(Convert.ToString(Session["cm_branchTypeId"])))
            {
                Response.Redirect("/login");
            }
            else
            {
                loadBranchType();
                lbData.Text = loadNews(rdBranchType.SelectedValue);
            }
            if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Id"])))
            {
                var d = from x in db.tNews where x.Id == int.Parse(Request.QueryString["Id"].ToString().Trim()) select x;
                if (d.Count() > 0)
                {
                    dlBranchType.SelectedValue = d.FirstOrDefault().BranchTypeId.ToString();
                    txtTitle.Text = d.FirstOrDefault().Title;
                    txtDescription.Text = d.FirstOrDefault().Description;
                    fckContent.Value = d.FirstOrDefault().Body;
                    dlMenu.SelectedValue = d.FirstOrDefault().Type.ToString();
                    txtTag.Text = d.FirstOrDefault().Tag;
                    dlActive.SelectedValue = d.FirstOrDefault().Status.ToString();
                    pnShow.Visible = true;
                    btnUpdate.Visible = true;
                }
            }
            else
                btnSave.Visible = true;
        }
    }
    void loadBranchType()
    {
        var br_type= from x in db.tBranchTypes
                     where x.Status == 1
                     select new { x.Id, x.Name };
        dlBranchType.DataSource = br_type;
        dlBranchType.DataBind();

        rdBranchType.DataSource = br_type;
        rdBranchType.DataTextField = "Name";
        rdBranchType.DataValueField = "Id";
        rdBranchType.DataBind();
        rdBranchType.SelectedValue = Session["cm_branchTypeId"].ToString();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["cm_branchTypeId"] = rdBranchType.SelectedValue.ToString();
        lbData.Text = loadNews(rdBranchType.SelectedValue);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string date = DateTime.Now.ToString("ddMMyyyyHHmmss");
        string filename = "";
        var n = new tNew();
        n.Body = fckContent.Value;
        n.CreateAt = DateTime.Now;
        n.CreateBy = int.Parse(Session["cm_userId"].ToString());
        n.Type = byte.Parse(dlMenu.SelectedValue);
        n.Description = txtDescription.Text.Trim();
        if (fuImage.HasFile)
        {
            filename = fuImage.FileName.Trim();
            n.Image = "/upload/news/" + date + "_" + filename.Substring(filename.LastIndexOf('.'));
        }
        n.Status = byte.Parse(dlActive.SelectedValue);
        n.Tag = txtTag.Text.Trim();
        n.Title = txtTitle.Text.Trim();
        n.BranchTypeId = int.Parse(dlBranchType.SelectedValue);
        db.tNews.InsertOnSubmit(n);
        db.SubmitChanges();

        if (fuImage.HasFile)
        {
            if (dlBranchType.SelectedValue == "1")
                fuImage.SaveAs(Server.MapPath("/upload/cnice/news/" + date + "_" + filename.Substring(filename.LastIndexOf('.'))));
            else if (dlBranchType.SelectedValue == "2")
                fuImage.SaveAs(Server.MapPath("/upload/cfashion/news/" + date + "_" + filename.Substring(filename.LastIndexOf('.'))));
        }

        txtDescription.Text = "";
        txtTag.Text = "";
        txtTitle.Text = "";
        fckContent.Value = "";
        Response.Redirect("/news");
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        var n = from x in db.tNews where x.Id == int.Parse(Request.QueryString["Id"]) select x;
        if (n.Count() > 0)
        {
            string filename = "", date = DateTime.Now.ToString("ddMMyyyyhhmmss");
            n.FirstOrDefault().Body = fckContent.Value;
            n.FirstOrDefault().ModifiedAt = DateTime.Now;
            n.FirstOrDefault().ModifiedBy = int.Parse(Session["cm_userId"].ToString());
            n.FirstOrDefault().Type = byte.Parse(dlMenu.SelectedValue);
            n.FirstOrDefault().Description = txtDescription.Text.Trim();
            if (fuImage.HasFile)
            {
                filename = fuImage.FileName;
                filename = filename.Substring(filename.LastIndexOf('.'));
                n.FirstOrDefault().Image = "/upload/news/" + date + "_" + filename;
            }
            n.FirstOrDefault().Status = byte.Parse(dlActive.SelectedValue);
            n.FirstOrDefault().Tag = txtTag.Text.Trim();
            n.FirstOrDefault().Title = txtTitle.Text.Trim();
            n.FirstOrDefault().BranchTypeId = int.Parse(dlBranchType.SelectedValue);
            db.SubmitChanges();

            if (fuImage.HasFile)
            {
                if (dlBranchType.SelectedValue == "1")
                    fuImage.SaveAs(Server.MapPath("/upload/cnice/news/" + date + "_" + filename.Substring(filename.LastIndexOf('.'))));
                else if (dlBranchType.SelectedValue == "2")
                    fuImage.SaveAs(Server.MapPath("/upload/cfashion/news/" + date + "_" + filename.Substring(filename.LastIndexOf('.'))));
            }
            txtDescription.Text = "";
            txtTag.Text = "";
            txtTitle.Text = "";
            fckContent.Value = "";

            Response.Redirect("/news");
        }
        else
        {

        }

    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        pnShow.Visible = !pnShow.Visible;
    }
    public string loadNews(string branchType)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_loadNews(branchType);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' id='" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            
            result += "<td><img width='120px' height='80px' ";
            if (item.Image != null)
            {
                if (branchType == "1")
                    result += "src ='" + item.Image.Replace("/upload/", "/upload/cnice/") + "' alt='" + item.Title + "'></td>";
                else if (branchType == "2")
                    result += "src ='" + item.Image.Replace("/upload/", "/upload/cfashion/") + "' alt='" + item.Title + "'></td>";
            }
            else
            {
                result += "src ='' alt='" + item.Title + "'></td>";
            }
            result += "<td><span style='font-weight:bold;'><a href='/detail-news/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.Title) + ".html'>" + item.Title + "</a></span></br><span style='font-size:11px; font-style:italic;'>" + item.Description + "</span></td>";
            result += "<td style='width:200px;'>" + item.Type + "</td>";
            result += "<td style='width:100px;'>" + item.Status + "</td>";
            result += "<td style='width:100px;'>" + item.CreateAt + "</td>";
            result += "<td style='width:100px;'>" + item.CreateBy + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}