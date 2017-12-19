using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for CMServices
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class CMServices : System.Web.Services.WebService
{

    public CMServices()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    clsProcess cl = new clsProcess();

    [WebMethod]
    public string getConnection()
    {
        string con = System.Configuration.ConfigurationManager.AppSettings["CMSServicesConnectionString"].ToString();
        return cl.Encrypt(con);
    }
    [WebMethod]
    public string getDateTime()
    {
        string dt = DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss");
        return dt;
    }
}
