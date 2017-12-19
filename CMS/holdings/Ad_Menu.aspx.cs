using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Menu : System.Web.UI.Page
{
    clsProcess cl = new clsProcess();
    HoldingDataContext db = new HoldingDataContext();
    string codeModule = "Menu";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["user_hcc"])) || string.IsNullOrEmpty(Convert.ToString(Session["userid_hcc"])))
                Response.Redirect("/login");
            if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 0))
            {
                dlParentMenu.Items.Clear();
                dlParentMenu.Items.Add(new ListItem("--Chọn menu--", ""));
                var mn = from x in db.tMenus where x.ParentId == null orderby x.ParentId select new { x.Name, x.Id, x.ParentId };
                if (mn.Count() > 0)
                {
                    foreach (var i in mn.ToList())
                    {
                        dlParentMenu.Items.Add(new ListItem(i.Name, i.Id.ToString()));
                        LoadChildMenu(dlParentMenu, i.Id);
                    }
                }
                dlParentMenu.DataBind();
                LoadGrid();
            }
            else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
        }
    }
    void LoadChildMenu(DropDownList dl, int parentId)
    {
        var mn = from x in db.tMenus where x.ParentId == parentId orderby x.Position select new { x.Name, x.Id };
        if (mn.Count() > 0)
        {
            foreach (var i in mn.ToList())
            {
                dlParentMenu.Items.Add(new ListItem("---- " + i.Name, i.Id.ToString()));
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 1))
        {
            if (txtName.Text.Trim().Equals(""))
                Mess("Nhập tên menu", "");
            else
            {
                try
                {
                    tMenu t = new tMenu();
                    if (!dlParentMenu.SelectedValue.Trim().Equals(""))
                        t.ParentId = int.Parse(dlParentMenu.SelectedValue.Trim());
                    t.Name = txtName.Text.Trim();
                    if (!txtLink.Text.Trim().Equals(""))
                        t.Link = txtLink.Text.Trim();
                    t.CreateAt = DateTime.Now;
                    t.Position = double.Parse(txtPosition.Text.Trim());
                    t.IsActive = ckActive.Checked;
                    t.Code = cl.ConvertToUnSign(txtName.Text.Trim().ToLower());
                    db.tMenus.InsertOnSubmit(t);
                    db.SubmitChanges();
                    ResetControl();
                    LoadGrid();
                    Mess("Lưu thành công", "");
                }
                catch (Exception ax)
                {
                    Mess(ax.Message, "");
                }
            }
        }
        else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
    }
    void LoadGrid()
    {
        gvMenu.DataSource = from x in db.tMenus select new { x.Id, x.Name, x.Link, x.Position, x.IsActive };
        gvMenu.DataBind();
    }
    void ResetControl()
    {
        dlParentMenu.SelectedIndex = 0;
        txtName.Text = "";
        txtLink.Text = "";
        txtPosition.Text = "";
        ckActive.Checked = true;
        btnSave.Visible = true;
        btnUpdate.Visible = false;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ResetControl();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 2))
        {
            if (txtName.Text.Trim().Equals(""))
                Mess("Nhập tên menu", "");
            else
            {
                try
                {
                    var up = (from x in db.tMenus where x.Id == int.Parse(hdIdMenu.Value) select x).FirstOrDefault();
                    up.Name = txtName.Text.Trim();
                    if (txtLink.Text.Trim().Equals(""))
                        up.Link = null;
                    else
                        up.Link = txtLink.Text.Trim();
                    up.ModifiedAt = DateTime.Now;
                    up.Position = double.Parse(txtPosition.Text.Trim());
                    up.Code = cl.ConvertToUnSign(txtName.Text.Trim().ToLower());
                    up.IsActive = ckActive.Checked;
                    db.SubmitChanges();
                    LoadGrid();
                    btnCancel_Click(sender, e);
                    Mess("Cập nhật thành công", "");
                }
                catch (Exception ax)
                {
                    Mess(ax.Message, "");
                }
            }
        }
        else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
    }
    private void Mess(string gstMess, string gstLink)
    {
        if (gstLink == "")
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('" + gstMess + "')", true);
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('" + gstMess + "');window.location.href='" + gstLink + "'", true);

    }

    protected void gvMenu_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string ID = e.CommandArgument.ToString();
        hdIdMenu.Value = ID;
        int gID = int.Parse(ID);

        try
        {
            if (e.CommandName.Equals("Select"))
            {
                var ct = (from x in db.tMenus where x.Id == gID select x).FirstOrDefault();
                txtLink.Text = ct.Link;
                txtName.Text = ct.Name;
                txtPosition.Text = ct.Position.ToString();
                dlParentMenu.SelectedValue = ct.ParentId.ToString();
                ckActive.Checked = ct.IsActive.Value;
                btnSave.Visible = false;
                btnUpdate.Visible = true;
            }
            else if (e.CommandName.Equals("Del"))
            {
                if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 3))
                {
                    var del = from x in db.tMenus where x.Id == gID select x;
                    if (del.Count() > 0)
                    {
                        db.tMenus.DeleteAllOnSubmit(del);
                        db.SubmitChanges();
                        LoadGrid();
                        ResetControl();
                        Mess("Xóa thành công", "");
                    }
                    else
                        Mess("Menu không tồn tại", "");
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