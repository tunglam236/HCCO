using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    HoldingDataContext db = new HoldingDataContext();
    clsProcess cl = new clsProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Convert.ToString(Session["user_hcc"])))
                Response.Redirect("/adhome");
            txtUser.Focus();
        }
    }
    private void Mess(string gstMess, string gstLink)
    {
        if (gstLink == "")
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('" + gstMess + "')", true);
        else
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), " ", "alert('" + gstMess + "');window.location.href='" + gstLink + "'", true);

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUser.Text.Trim().Equals("")) Mess("Nhập tên truy cập", "");
        else if (txtPass.Text.Trim().Equals("")) Mess("Nhập mật khẩu truy cập", "");
        else
        {
            var check_acc = from x in db.tAccounts
                            where x.Username == txtUser.Text.Trim().ToLower()
                                && x.Password == cl.MaHoa(txtPass.Text.Trim())
                            select x;
            if (check_acc.Count() == 1)
            {
                Session["user_hcc"] = txtUser.Text.Trim();
                Session["userid_hcc"] = check_acc.FirstOrDefault().Id.ToString();
                Response.Redirect("/adhome");
            }
            else
                Mess("Tên truy cập hoặc mật khẩu không đúng. Kiểm tra lại !", "");
        }
    }
}