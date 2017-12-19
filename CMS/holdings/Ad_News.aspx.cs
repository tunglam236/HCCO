using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Ad_News : System.Web.UI.Page
{
    clsProcess cl = new clsProcess();
    HoldingDataContext db = new HoldingDataContext();
    string codeModule = "News";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["user_hcc"])) || string.IsNullOrEmpty(Convert.ToString(Session["userid_hcc"])))
                Response.Redirect("/login");
            if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 0))
            {
                dlMenu.Items.Clear();
                var mn = from x in db.tMenus where x.ParentId != null select new { x.Name, x.Id, x.ParentId };
                foreach (var item in mn.ToList())
                {
                    dlMenu.Items.Add(new ListItem(item.Name, item.Id.ToString()));
                }
                dlMenu.DataBind();

                LoadGrid();
            }
            else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
        }
    }
    void ResetControl()
    {
        dlMenu.SelectedIndex = 0;
        txtTitle.Text = "";
        txtDescription.Text = "";
        txtTag.Text = "";
        fckContent.Value = "";
        ckActive.Checked = true;
        btnSave.Visible = true;
        btnUpdate.Visible = false;
    }
    void LoadGrid()
    {
        var news = from x in db.tNews from y in db.tMenus where x.MenuId == y.Id
                   orderby x.CreateAt descending select new { x.Id, x.Title, x.Image, x.CreateAt, x.IsActive, MenuName = y.Name };
        gvNews.DataSource = news;
        gvNews.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 1))
        {
            if (txtTitle.Text.Trim() == "") Mess("Nhập tiêu đề bài viết", "");
            else if (txtDescription.Text.Trim() == "") Mess("Nhập nội dung tóm tắt bài viết", "");
            else if (fckContent.Value.Trim() == "") Mess("Nhập nội dung bài viết", "");
            else if (!fileImage.HasFile) Mess("Chọn file ảnh", "");
            else
            {
                string filename = DateTime.Now.ToString("ddMMyyyyhhmmss"), file_ex = "";
                try
                {
                    tNew n = new tNew();
                    n.Title = txtTitle.Text.Trim();
                    n.Description = txtDescription.Text.Trim();
                    n.Body = fckContent.Value;
                    n.MenuId = int.Parse(dlMenu.SelectedValue.Trim());
                    n.Tag = txtTag.Text.Trim();
                    n.IsActive = ckActive.Checked;
                    n.CreateAt = DateTime.Now;
                    n.CreateBy = int.Parse(Session["userid_hcc"].ToString());

                    if (fileImage.HasFile)
                    {
                        file_ex = fileImage.FileName.Trim();
                        file_ex = file_ex.Substring(file_ex.LastIndexOf('.'));
                        n.Image = "/wp-content/uploads/news/" + filename + file_ex;
                    }
                    db.tNews.InsertOnSubmit(n);
                    db.SubmitChanges();
                    if (fileImage.HasFile)
                        fileImage.SaveAs(Server.MapPath("/wp-content/uploads/news/" + filename + file_ex));

                    var check_news = from m in db.tNews where m.MenuId == int.Parse(dlMenu.SelectedValue.Trim()) select new { m.Id };

                    //Update link menu
                    var update_menu = from u in db.tMenus where u.Id == int.Parse(dlMenu.SelectedValue) select u;
                    if (update_menu.Count() > 0)
                    {
                        if (check_news.Count() == 1)
                            update_menu.FirstOrDefault().Link = "/bai-viet/" + n.Id.ToString() + "/" + cl.ConvertToUnSign(txtTitle.Text.Trim().ToLower()) + ".hcc";
                        else
                            update_menu.FirstOrDefault().Link = null;
                        db.SubmitChanges();
                    }
                    //end update
                    ResetControl();
                    LoadGrid();
                    Mess("Lưu bài viết thành công", "");
                }
                catch (Exception ax)
                {
                    Mess(ax.Message, "");
                }
            }
        }
        else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 2))
        {
            if (txtTitle.Text.Trim() == "") Mess("Nhập tiêu đề bài viết", "");
            else if (txtDescription.Text.Trim() == "") Mess("Nhập nội dung tóm tắt bài viết", "");
            else if (fckContent.Value.Trim() == "") Mess("Nhập nội dung bài viết", "");
            else
            {
                string filename = DateTime.Now.ToString("ddMMyyyyhhmmss"), file_ex = "";
                try
                {

                    var n = (from x in db.tNews where x.Id == int.Parse(hdId.Value) select x).FirstOrDefault();
                    n.Title = txtTitle.Text.Trim();
                    n.Description = txtDescription.Text.Trim();
                    n.Body = fckContent.Value;
                    n.MenuId = int.Parse(dlMenu.SelectedValue.Trim());
                    n.Tag = txtTag.Text.Trim();
                    n.IsActive = ckActive.Checked;
                    n.ModifiedAt = DateTime.Now;
                    n.ModifedBy = int.Parse(Session["userid_hcc"].ToString());

                    if (fileImage.HasFile)
                    {
                        file_ex = fileImage.FileName.Trim();
                        file_ex = file_ex.Substring(file_ex.LastIndexOf('.'));
                        n.Image = "/wp-content/uploads/news/" + filename + file_ex;
                    }
                    db.SubmitChanges();
                    if (fileImage.HasFile)
                        fileImage.SaveAs(Server.MapPath("/wp-content/uploads/news/" + filename + file_ex));

                    //update menu link,bai viet thuoc menu cu
                    var check_news = from m in db.tNews where m.MenuId == int.Parse(hdMenuId.Value) select new { m.Id, m.Title };
                    var update_menu = from u in db.tMenus where u.Id == int.Parse(hdMenuId.Value) select u;
                    if (update_menu.Count() > 0)
                    {
                        if (check_news.Count() == 1)
                            update_menu.FirstOrDefault().Link = "/bai-viet/" + check_news.FirstOrDefault().Id.ToString() + "/"
                                + cl.ConvertToUnSign(check_news.FirstOrDefault().Title.ToLower()) + ".hcc";
                        else
                            update_menu.FirstOrDefault().Link = null;
                        db.SubmitChanges();
                    }
                    //bai viet thuoc menu moi
                    var check_news2 = from m in db.tNews where m.MenuId == int.Parse(dlMenu.SelectedValue.Trim()) select new { m.Id, m.Title };
                    var update_menu2 = from u in db.tMenus where u.Id == int.Parse(dlMenu.SelectedValue.Trim()) select u;
                    if (update_menu2.Count() > 0)
                    {
                        if (check_news2.Count() == 1)
                            update_menu2.FirstOrDefault().Link = "/bai-viet/" + check_news2.FirstOrDefault().Id.ToString() + "/"
                                + cl.ConvertToUnSign(check_news2.FirstOrDefault().Title.ToLower()) + ".hcc";
                        else
                            update_menu2.FirstOrDefault().Link = null;
                        db.SubmitChanges();
                    }
                    //end update

                    ResetControl();
                    LoadGrid();
                    Mess("Cập nhật bài viết thành công", "");
                }
                catch (Exception ax)
                {
                    Mess(ax.Message, "");
                }
            }
        }
        else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ResetControl();
    }
    protected void gvNews_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string ID = e.CommandArgument.ToString();
        hdId.Value = ID;
        
        int gID = int.Parse(ID);

        try
        {
            if (e.CommandName.Equals("Select"))
            {
                var ct = (from x in db.tNews where x.Id == gID select x).FirstOrDefault();
                txtTitle.Text = ct.Title;
                txtDescription.Text = ct.Description;
                fckContent.Value = ct.Body;
                txtTag.Text = ct.Tag;
                dlMenu.SelectedValue = ct.MenuId.ToString();
                ckActive.Checked = ct.IsActive;
                btnSave.Visible = false;
                btnUpdate.Visible = true;
                hdMenuId.Value = ct.MenuId.ToString();
            }
            else if (e.CommandName.Equals("Del"))
            {
                if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 3))
                {
                    int idMenu;
                    var del = from x in db.tNews where x.Id == gID select x;
                    if (del.Count() > 0)
                    {
                        var img = del.FirstOrDefault().Image;
                        idMenu = del.FirstOrDefault().MenuId.Value;
                        db.tNews.DeleteAllOnSubmit(del);
                        db.SubmitChanges();
                        FileInfo f = new FileInfo(Server.MapPath(img));
                        if (f.Exists)
                            f.Delete();

                        //update menu link
                        var check_news = from m in db.tNews where m.MenuId == idMenu select new { m.Id, m.Title };
                        var update_menu = from u in db.tMenus where u.Id == idMenu select u;
                        if (update_menu.Count() > 0)
                        {
                            if (check_news.Count() == 1)
                                update_menu.FirstOrDefault().Link = "/bai-viet/" + check_news.FirstOrDefault().Id.ToString() + "/" + cl.ConvertToUnSign(check_news.FirstOrDefault().Title.ToLower()) + ".hcc";
                            else
                                update_menu.FirstOrDefault().Link = null;
                            db.SubmitChanges();
                        }
                        //end update
                        LoadGrid();

                        ResetControl();
                        Mess("Xóa thành công", "");
                    }
                    else
                        Mess("Bài viết không tồn tại", "");
                }
                else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
            }
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
}