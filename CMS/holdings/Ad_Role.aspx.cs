using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Role : System.Web.UI.Page
{
    HoldingDataContext db = new HoldingDataContext();
    clsProcess cl = new clsProcess();
    string codeModule = "Role";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["user_hcc"])) || string.IsNullOrEmpty(Convert.ToString(Session["userid_hcc"])))
                Response.Redirect("/login");

            if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 0))
            {
                dlUser.Items.Clear();
                var us = from k in db.tAccounts select new { k.Id, k.Username, k.FullName };
                foreach (var item in us.ToList())
                {
                    dlUser.Items.Add(new ListItem(item.Username + " | " + item.FullName, item.Id.ToString()));
                }
                dlUser.DataBind();
                LoadRole();
            }
            else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
        }
    }
    void LoadRole()
    {
        var l= from x in db.tRoles
                            join n in db.tUserRoles on x.Id equals n.RoleId
                            where n.UserId == int.Parse(dlUser.SelectedValue)
                            select new { x.ModuleCode, x.Id, n.sView, n.sModifie, n.sDel, n.sInsert };
        if (l.Count() > 0)
            gvRole.DataSource = l;
        else
        {
            gvRole.DataSource = from x in db.tRoles
                                select new { x.ModuleCode, x.Id, sView=false, sModifie=false, sDel=false, sInsert=false };
        }
        gvRole.DataBind();
    }
    private void Mess(string gstMess, string gstLink)
    {
        if (gstLink == "")
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('" + gstMess + "')", true);
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('" + gstMess + "');window.location.href='" + gstLink + "'", true);

    }
    protected void dlUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadRole();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        try
        {
            if (cl.checkRole(Session["userid_hcc"].ToString(), codeModule, 1))
            {
                bool change = false;
                int idUser = int.Parse(dlUser.SelectedValue.Trim());
                var check_user = from x in db.tUserRoles where x.UserId == idUser select x;
                if (check_user.Count() > 0)
                {
                    //del data
                    db.tUserRoles.DeleteAllOnSubmit(check_user);
                    change = true;
                }
                foreach (GridViewRow row in gvRole.Rows)
                {
                    Label lbId = (Label)row.FindControl("lbId");
                    Label lbCode = (Label)row.FindControl("lbCode");
                    CheckBox ckView = (CheckBox)row.FindControl("ckView");
                    CheckBox ckInsert = (CheckBox)row.FindControl("ckInsert");
                    CheckBox ckModifie = (CheckBox)row.FindControl("ckModifie");
                    CheckBox ckDel = (CheckBox)row.FindControl("ckDel");

                    var r = new tUserRole();
                    r.UserId = idUser;
                    r.RoleId = int.Parse(lbId.Text.Trim());
                    r.sView = ckView.Checked;
                    r.sInsert = ckInsert.Checked;
                    r.sModifie = ckModifie.Checked;
                    r.sDel = ckDel.Checked;
                    r.CreateAt = DateTime.Now;
                    r.CreateBy = int.Parse(Session["userid_hcc"].ToString());
                    if (change)
                    {
                        r.ModifiedAt = DateTime.Now;
                        r.ModifedBy = int.Parse(Session["userid_hcc"].ToString());
                    }
                    db.tUserRoles.InsertOnSubmit(r);
                }
                db.SubmitChanges();
                Mess("Lưu thành công", "");
            }
            else Mess("Bạn không có quyền sử dụng chức năng này", "/adhome");
        }
        catch (Exception ax)
        {
            Mess(ax.Message, "");
        }

    }
}