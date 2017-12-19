using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Ad_Slide : System.Web.UI.Page
{
    HoldingDataContext db = new HoldingDataContext();
    clsProcess cl = new clsProcess();
    string codeModule = "Slide";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["user_hcc"])) || string.IsNullOrEmpty(Convert.ToString(Session["userid_hcc"])))
                Response.Redirect("/login");
            if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 0))
                LoadGrid();
            else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 1))
            {
                if (fuImage.HasFile)
                {
                    string filename = DateTime.Now.ToString("ddMMyyyyhhmmss"), file_ex = "";
                    tSlide sl = new tSlide();
                    if (fuImage.HasFile)
                    {
                        file_ex = fuImage.FileName.Trim();
                        file_ex = file_ex.Substring(file_ex.LastIndexOf('.'));
                        sl.Image = "/wp-content/uploads/slide/" + filename + file_ex;
                    }
                    sl.Content = txtContent.Text.Trim();
                    sl.Caption = txtCaption.Text.Trim();
                    sl.Type = ckType1.Checked;
                    sl.Style1 = txtStyle1.Text.Trim();
                    sl.Style2 = txtStyle2.Text.Trim();
                    sl.IsActive = ckActive.Checked;
                    sl.CreateAt = DateTime.Now;
                    db.tSlides.InsertOnSubmit(sl);
                    db.SubmitChanges();
                    if (fuImage.HasFile)
                        fuImage.SaveAs(Server.MapPath("/wp-content/uploads/slide/" + filename + file_ex));
                    ResetControl();
                    LoadGrid();
                    Mess("Lưu thành công", "");
                }
                else Mess("Chọn hình ảnh Slide", "");
            }
            else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
        }
        catch (Exception ax)
        {
            Mess(ax.Message, "");
        }
    }
    void LoadGrid()
    {
        gvSlide.DataSource = from x in db.tSlides orderby x.Type descending select new { x.Id, x.Caption, x.Content, x.Image, x.IsActive, x.Style1, x.Style2,x.Type };
        gvSlide.DataBind();
    }
    void ResetControl()
    {
        txtCaption.Text = "";
        txtContent.Text = "";
        txtStyle1.Text = "font-family: Roboto Slab; font-size: 90px; color: #ffffff; font-weight:bold;";
        txtStyle2.Text = "font-family: Roboto Slab; font-size: 80px; color: #ffffff;";
        ckActive.Checked = true;
        ckType1.Checked = true;
        btnSave.Visible = true;
        btnUpdate.Visible = false;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ResetControl();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 2))
            {
                var up = (from x in db.tSlides where x.Id == int.Parse(hdId.Value) select x).FirstOrDefault();
                up.Caption = txtCaption.Text.Trim();
                up.Content = txtContent.Text.Trim();
                up.Style2 = txtStyle2.Text.Trim();
                up.Style1 = txtStyle1.Text.Trim();
                up.Type = ckType1.Checked;
                up.ModifiedAt = DateTime.Now;
                string filename = DateTime.Now.ToString("ddMMyyyyhhmmss"), file_ex = "";
                if (fuImage.HasFile)
                {
                    file_ex = fuImage.FileName.Trim();
                    file_ex = file_ex.Substring(file_ex.LastIndexOf('.'));
                    up.Image = "/wp-content/uploads/slide/" + filename + file_ex;
                }
                up.IsActive = ckActive.Checked;
                db.SubmitChanges();
                if (fuImage.HasFile)
                    fuImage.SaveAs(Server.MapPath("/wp-content/uploads/slide/" + filename + file_ex));
                LoadGrid();
                btnCancel_Click(sender, e);
                Mess("Cập nhật thành công", "");
            }
            else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
        }
        catch (Exception ax)
        {
            Mess(ax.Message, "");
        }
    }
    private void Mess(string gstMess, string gstLink)
    {
        if (gstLink == "")
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('" + gstMess + "')", true);
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('" + gstMess + "');window.location.href='" + gstLink + "'", true);

    }

    protected void gvSlide_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string ID = e.CommandArgument.ToString();
        hdId.Value = ID;
        int gID = int.Parse(ID);

        try
        {
            if (e.CommandName.Equals("Select"))
            {
                var ct = (from x in db.tSlides where x.Id == gID select x).FirstOrDefault();
                txtContent.Text = ct.Content;
                txtCaption.Text = ct.Caption;
                txtStyle1.Text = ct.Style1;
                txtStyle2.Text = ct.Style2;
                ckType1.Checked = ct.Type.Value;
                ckType2.Checked = !ct.Type.Value;
                ckActive.Checked = ct.IsActive.Value;
                btnSave.Visible = false;
                btnUpdate.Visible = true;
            }
            else if (e.CommandName.Equals("Del"))
            {
                if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 3))
                {
                    var del = from x in db.tSlides where x.Id == gID select x;
                    if (del.Count() > 0)
                    {
                        var img = del.FirstOrDefault().Image;
                        db.tSlides.DeleteAllOnSubmit(del);
                        db.SubmitChanges();
                        FileInfo f = new FileInfo(Server.MapPath(img));
                        if (f.Exists)
                            f.Delete();
                        LoadGrid();
                        ResetControl();
                        Mess("Xóa thành công", "");
                    }
                    else
                        Mess("Slide không tồn tại", "");
                }
                else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
            }
        }
        catch (Exception ax)
        {
            Mess(ax.Message, "");
        }
    }
}