using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Showroom : System.Web.UI.Page
{
    private static int branchTypeId = int.Parse(System.Configuration.ConfigurationManager.AppSettings["branchTypeId"]);
    CFManagerDataContext db = new CFManagerDataContext();
    clsProcess cl = new clsProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var b = from x in db.tBranches where x.BranchTypeId==branchTypeId && x.Status == 1 && x.IsDisplay == true orderby x.CountryId, x.DistrictId select new {x.CountryName, x.DistrictName, x.CountryId, x.DistrictId};
            int countryid = 0;
            
            foreach (var item in b.ToList())
            {
                if (countryid != item.CountryId)
                {
                    countryid = item.CountryId.Value;
                    lbBranch.Text += "<a href='javascript:void(0)'><b>" + item.CountryName + "</b></a>";
                    lbBranch.Text += "<a href='javascript:void(0)' onclick='return initMap(" + item.DistrictId.ToString() + ",\"\");' class='pl'>" + item.DistrictName + "</a>";

                }
                else
                {
                    lbBranch.Text += "<a href='javascript:void(0)' onclick='return initMap(" + item.DistrictId.ToString() + ",\"\");' class='pl'>" + item.DistrictName + "</a>";
                }
            }
            
        }
    }
}