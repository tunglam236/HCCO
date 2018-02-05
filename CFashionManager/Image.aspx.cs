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
        string result = hdProductId.Value;
        string color = result.Split('#')[0];
        string id = result.Split('#')[1];
        string _control = "", filename = "", img_path = "", img_save = "";
        string date = DateTime.Now.ToString("ddMMyyyyHHmmss");
        string imageZoom = "", imageThumb = "", img_type = "";

        if (color == "") color = "0";
        var p = from x in db.tProducts
                where (color == "0" || x.Color == int.Parse(color)) && x.ProductTypeCode == id.Trim() && x.BranchTypeId == int.Parse(rdBranchType.SelectedValue.Trim())
                select x;
        if (p.Count() > 0)
        {
            if (id != "")
            {
                HttpFileCollection hfc = Request.Files;
                for (int i = 0; i < hfc.Count; i++)
                {
                    HttpPostedFile hpf = hfc[i];
                    _control = hfc.AllKeys[i];
                    if (hpf.ContentLength > 0)
                    {
                        filename = hpf.FileName.Trim();

                        if (p.FirstOrDefault().BranchTypeId.ToString() == "1")
                            img_path = "/upload/cnice/product/" + img_type + date + "_" + i.ToString() + filename.Substring(filename.LastIndexOf('.'));
                        else if (p.FirstOrDefault().BranchTypeId.ToString() == "2")
                            img_path = "/upload/cfashion/product/" + img_type + date + "_" + i.ToString() + filename.Substring(filename.LastIndexOf('.'));
                        else if (p.FirstOrDefault().BranchTypeId.ToString() == "3")
                            img_path = "/upload/cn/product/" + img_type + date + "_" + i.ToString() + filename.Substring(filename.LastIndexOf('.'));

                        img_save = "/upload/product/" + img_type + date + "_" + i.ToString() + filename.Substring(filename.LastIndexOf('.'));

                        if (_control.Contains("fuImage"))
                        {
                            if (imageZoom != "") imageZoom += "#";
                            imageZoom += img_save;
                            img_type = "";
                        }
                        else
                        {
                            if (imageThumb != "") imageThumb += "#";
                            imageThumb += img_save;
                            img_type = "thumb_";
                        }

                        hpf.SaveAs(Server.MapPath(img_path));
                    }
                }

                foreach (var item in p.ToList())
                {
                    if (item.Image == null || item.Image == "")
                        item.Image = imageThumb;
                    else
                        item.Image = item.Image + "#" + imageThumb;
                    if (item.ImageZoom == null || item.ImageZoom == "")
                        item.ImageZoom = imageZoom;
                    else
                        item.ImageZoom = item.ImageZoom + "#" + imageZoom;

                }
                db.SubmitChanges();
            }
            Response.Redirect("/image");
        }
    }
    public string loadImage(string branchType)
    {
        string result = ""; int i = 1;

        var m = db.sp_web_loadProductImage(branchType);

        foreach (var item in m.ToList())
        {
            result += "<tr class='detail-rows' branchtype='" + branchType.Trim() + "' imageZoom=\"" + Convert.ToString(item.ImageZoom).Replace("/", "@") + "\" image=\"" + Convert.ToString(item.Image).Replace("/", "@") + "\" id='" + item.ColorId.ToString() + "#" + item.ProductTypeCode.ToString() + "' title='Click để xem chi tiết'>";
            result += "<td class='center childrows'></td>";
            result += "<td>" + item.CodeId + "</td>";
            result += "<td>" + item.ProductTypeCode + "</td>";
            result += "<td>" + item.ProductTypeName + "</td>";
            result += "<td>" + item.ProductCode + "</td>";
            result += "<td>" + item.ProductName + "</td>";
            result += "<td id='imageCount" + item.Id.ToString() + "'>" + item.ImageCount.ToString() + "</td>";
            result += "</tr>";
            i++;
        }
        return result;
    }
}