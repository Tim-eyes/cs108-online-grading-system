using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {

    }

    protected void HeadLoginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
        Response.Cookies["user_name"].Expires = DateTime.Now.AddDays(-1);
        HttpContext.Current.Session["user_name"] = null;
        Session.Clear();
        Session.Abandon();     
        Response.Redirect("~/Log.aspx");
    }
}
