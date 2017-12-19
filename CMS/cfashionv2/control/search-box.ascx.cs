using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class control_search_box : System.Web.UI.UserControl
{
    CFManagerDataContext db = new CFManagerDataContext();
    clsProcess cl=new clsProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadCart();
        }
    }
    private void loadCart()
    {
        string result = "";
        ShoppingCart cart = (ShoppingCart)Session["Cart"];
        result += "<table class='table'>";
        double total = 0;
        for (int i = 0; i < cart.Rows.Count; i++)
        {
            result += "<tr><td class='text-center'>";
            result += "<a href='/detail/" + cart.Rows[i]["ID"].ToString() + "/" + cl.ConvertToUnSign(cart.Rows[i]["ProductName"].ToString()) + ".html'>";
            result += "<img src='" + cart.Rows[i]["Image"].ToString() + "'";
            result += "alt='" + cart.Rows[i]["ProductName"].ToString() + "' width='100px' height='100px' title='" + cart.Rows[i]["ProductName"].ToString() + "' /></a></td>";
            result += "<td class='text-left info-item'>";
            result += "<a class='cart-name' href='/detail/" + cart.Rows[i]["ID"].ToString() + "/" + cl.ConvertToUnSign(cart.Rows[i]["ProductName"].ToString()) + ".html'>" + cart.Rows[i]["ProductName"].ToString() + "</a><p class='cart-quantity'>" + cart.Rows[i]["Quantity"].ToString() + " x ";
            result += "</p><p class='cart-price'> " + string.Format("{0:0,0}", cart.Rows[i]["Price"]) + "</p></td></tr>";
            total += double.Parse(cart.Rows[i]["TotalPrice"].ToString());
        }
        result += "</table>";
        if (cart.Rows.Count > 0)
        {
            lbCart.Text = result;
            lbTotal.Text = string.Format("{0:0,0 đ}", total);
            sfooter.Visible = true;
            liCart.Visible = true;
            liEmpty.Visible = false;
        }
        else
        {
            sfooter.Visible = false;
            liCart.Visible = false;
            liEmpty.Visible = true;
        }
    }
}