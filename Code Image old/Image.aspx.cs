using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Image : System.Web.UI.Page
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
                lbData.Text = loadImage(rdBranchType.SelectedValue);
            }
            if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["Id"])))
            {
                
            }
        }
    }
    void loadBranchType()
    {
        var br_type = from x in db.tBranchTypes
                      where x.Status == 1
                      select new { x.Id, x.Name };
        rdBranchType.DataSource = br_type;
        rdBranchType.DataTextField = "Name";
        rdBranchType.DataValueField = "Id";
        rdBranchType.DataBind();
        rdBranchType.SelectedValue = Session["cm_branchTypeId"].ToString();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (fckContent.Value.Trim() !="")
        {
            string id = hdProductId.Value;

            var p = from x in db.tProducts where x.Id == int.Parse(id.Trim()) select x;
            if (p.Count() > 0)
            {
                p.FirstOrDefault().Content = fckContent.Value.Trim();
                db.SubmitChanges();
                Response.Redirect("/image");
            }
        }
        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        lbData.Text = loadImage(rdBranchType.SelectedValue);
        Session["cm_branchTypeId"] = rdBranchType.SelectedValue;
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string productTypeCode = hdProductTypeCode.Value;
        string branchType = hdBranchType.Value;
        string imageThumb = "", imageZoom = "";
        string filename = "", img_path = "", img_save = "";
        string _control = "";
        var p = from x in db.tProductImages
                where x.BranchTypeId == int.Parse(branchType.Trim()) &&
                x.ProductTypeCode == productTypeCode.Trim()
                select x;
        if (p.Count() > 0)
        {
            //update image
            Response.Redirect("/image");
        }
        else
        {
            //inser image
            if (fuImage.HasFile || fuThumb.HasFile)
            {
                string date = DateTime.Now.ToString("ddMMyyyyHHmmss");
                HttpFileCollection hfc = Request.Files;
                for (int i = 0; i < hfc.Count; i++)
                {
                    HttpPostedFile hpf = hfc[i];
                    _control = hfc.AllKeys[i];
                    if (hpf.ContentLength > 0)
                    {
                        filename = fuImage.FileName.Trim();

                        if (_control.Contains("fuImage"))
                        {
                            img_path = "/upload/product/" + date + "_" + i.ToString() + filename.Substring(filename.LastIndexOf('.'));
                            if (imageZoom != "") imageZoom += "#";
                            imageZoom += img_path;
                        }
                        else
                        {
                            img_path = "/upload/product/" + "thumb_" + date + "_" + i.ToString() + filename.Substring(filename.LastIndexOf('.'));
                            if (imageThumb != "") imageThumb += "#";
                            imageThumb += img_path;
                        }

                        if (branchType == "1")
                            img_save = "/upload/cnice/product/" + date + "_" + i.ToString() + filename.Substring(filename.LastIndexOf('.'));
                        else if (branchType == "2")
                            img_save = "/upload/cfashion/product/" + date + "_" + i.ToString() + filename.Substring(filename.LastIndexOf('.'));
                        else
                            img_save = "/upload/cn/product/" + date + "_" + i.ToString() + filename.Substring(filename.LastIndexOf('.'));

                        hpf.SaveAs(Server.MapPath(img_save));
                    }
                }
               
            }
            //insert data
            var im = new tProductImage();
            im.BranchTypeId = int.Parse(branchType.Trim());
            im.ProductTypeCode = productTypeCode.Trim();
            im.ImageThumb = imageThumb.Trim();
            im.ImageZoom = imageZoom.Trim();
            im.Status = 1;
            db.tProductImages.InsertOnSubmit(im);
            db.SubmitChanges();
        }
        Response.Redirect("/image");
    }
    public string loadImage(string branchType)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_loadProductImage2(branchType);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' branchtype='" + branchType.Trim() + "' imageZoom=\"" + Convert.ToString(item.ImageZoom).Replace("/", "@") + "\" image=\"" + Convert.ToString(item.Image).Replace("/", "@") + "\" id='" + item.Id.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center childrows'></td>";
            result += "<td>" + item.ProductTypeCode + "</td>";
            result += "<td>" + (item.Image.Length > 50 ? (item.Image.Substring(0, 50) + "...") : item.Image) + "</td>";
            result += "<td>" + (item.ImageZoom.Length > 50 ? (item.ImageZoom.Substring(0, 50) + "...") : item.ImageZoom) + "</td>";
            result += "<td id='imageCount" + item.Id.ToString() + "'>" + item.ImageCount.ToString() + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}