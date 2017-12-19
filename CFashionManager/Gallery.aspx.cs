using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Gallery : System.Web.UI.Page
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
                lbData.Text = loadGallery(rdBranchType.SelectedValue);
            }
            if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Id"])))
            {
                var d = from x in db.tGalleries where x.Id == int.Parse(Request.QueryString["Id"].ToString().Trim()) select x;
                if (d.Count() > 0)
                {
                    dlBranchType.SelectedValue = d.FirstOrDefault().BranchTypeId.ToString();
                    txtName.Text = d.FirstOrDefault().GalleryName;
                    txtDescription.Text = d.FirstOrDefault().Description;
                    fckContent.Value = d.FirstOrDefault().Content;
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
        var br_type = from x in db.tBranchTypes
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
        lbData.Text = loadGallery(rdBranchType.SelectedValue);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string date1 = DateTime.Now.ToString("ddMMyyyyHHmmss"), date2 = DateTime.Now.ToString("ddMMyyyyHHmmss"); ;
        string filename = "";
        var n = new tGallery();
        n.GalleryName = txtName.Text.Trim();
        n.Content = fckContent.Value;
        n.CreateAt = DateTime.Now;
        n.CreateBy = int.Parse(Session["cm_userId"].ToString());
        n.Description = txtDescription.Text.Trim();
        if (fuImage.HasFile)
        {
            filename = fuImage.FileName.Trim();
            n.Image1 = "/upload/gallery/" + date1 + "_" + filename.Substring(filename.LastIndexOf('.'));
        }
        if (fuImage2.HasFile)
        {
            date2 = DateTime.Now.ToString("ddMMyyyyHHmmss");
            filename = fuImage2.FileName.Trim();
            n.Image2 = "/upload/gallery/" + date2 + "_" + filename.Substring(filename.LastIndexOf('.'));
        }
        n.Status = byte.Parse(dlActive.SelectedValue);
        n.BranchTypeId = int.Parse(dlBranchType.SelectedValue);
        db.tGalleries.InsertOnSubmit(n);
        db.SubmitChanges();

        if (fuImage.HasFile)
        {
            if (dlBranchType.SelectedValue == "1")
                fuImage.SaveAs(Server.MapPath("/upload/cnice/gallery/" + date1 + "_" + filename.Substring(filename.LastIndexOf('.'))));
            else if (dlBranchType.SelectedValue == "2")
                fuImage.SaveAs(Server.MapPath("/upload/cfashion/gallery/" + date1 + "_" + filename.Substring(filename.LastIndexOf('.'))));
        }
        if (fuImage2.HasFile)
        {
            if (dlBranchType.SelectedValue == "1")
                fuImage2.SaveAs(Server.MapPath("/upload/cnice/gallery/" + date2 + "_" + filename.Substring(filename.LastIndexOf('.'))));
            else if (dlBranchType.SelectedValue == "2")
                fuImage2.SaveAs(Server.MapPath("/upload/cfashion/gallery/" + date2 + "_" + filename.Substring(filename.LastIndexOf('.'))));
        }

        txtDescription.Text = "";
        txtName.Text = "";
        fckContent.Value = "";
        Response.Redirect("/gallery");
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        var n = from x in db.tGalleries where x.Id == int.Parse(Request.QueryString["Id"]) select x;
        if (n.Count() > 0)
        {
            string filename = "", date1 = DateTime.Now.ToString("ddMMyyyyhhmmss"), date2 = DateTime.Now.ToString("ddMMyyyyhhmmss");
            n.FirstOrDefault().Description = txtDescription.Text.Trim();
            n.FirstOrDefault().GalleryName = txtName.Text.Trim();
            n.FirstOrDefault().Content = fckContent.Value;
            n.FirstOrDefault().ModifiedAt = DateTime.Now;
            n.FirstOrDefault().ModifiedBy = int.Parse(Session["cm_userId"].ToString());
            n.FirstOrDefault().Description = txtDescription.Text.Trim();
            if (fuImage.HasFile)
            {
                filename = fuImage.FileName;
                filename = filename.Substring(filename.LastIndexOf('.'));
                n.FirstOrDefault().Image1 = "/upload/news/" + date1 + "_" + filename;
            }
            if (fuImage2.HasFile)
            {
                date2 = DateTime.Now.ToString("ddMMyyyyhhmmss");
                filename = fuImage2.FileName;
                filename = filename.Substring(filename.LastIndexOf('.'));
                n.FirstOrDefault().Image2 = "/upload/gallery/" + date2 + "_" + filename;
            }
            n.FirstOrDefault().Status = byte.Parse(dlActive.SelectedValue);
            n.FirstOrDefault().BranchTypeId = int.Parse(dlBranchType.SelectedValue);
            db.SubmitChanges();

            if (fuImage.HasFile)
            {
                if (dlBranchType.SelectedValue == "1")
                    fuImage.SaveAs(Server.MapPath("/upload/cnice/gallery/" + date1 + "_" + filename.Substring(filename.LastIndexOf('.'))));
                else if (dlBranchType.SelectedValue == "2")
                    fuImage.SaveAs(Server.MapPath("/upload/cfashion/gallery/" + date1 + "_" + filename.Substring(filename.LastIndexOf('.'))));
            }
            txtDescription.Text = "";
            txtName.Text = "";
            fckContent.Value = "";

            Response.Redirect("/gallery");
        }
    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        pnShow.Visible = !pnShow.Visible;
    }
    public string loadGallery(string branchType)
    {
        string result = ""; int i = 1;

        var m = from x in db.tGalleries where x.BranchTypeId == int.Parse(branchType.Trim()) && x.Status == 1 select new { x.Id, x.GalleryName, x.Description };

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' id='" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center childrows'></td>";
            result += "<td><span style='font-weight:bold;'><a href='/gl-detail/" + item.Id.ToString() + "/" + cl.ConvertToUnSign(item.GalleryName) + ".html'>" + item.GalleryName + "</a></span></br><span style='font-size:11px; font-style:italic;'>" + item.Description + "</span></td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}