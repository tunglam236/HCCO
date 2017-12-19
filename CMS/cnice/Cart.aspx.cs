﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Cart : System.Web.UI.Page
{
    CNManagerDataContext db = new CNManagerDataContext();
    clsProcess cl = new clsProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            loadCart();
        }
    }
    public DataTable loadCart()
    {
        var cart = (ShoppingCart)Session["Cart"];
        return cart;
    }
    public string getRefMember()
    {
        if (!string.IsNullOrEmpty(Convert.ToString(Session["cn_mb_user_id"])))
        {
            return "ref-" + Session["cn_mb_user_id"].ToString() + "/";
        }
        else return "";
    }
}