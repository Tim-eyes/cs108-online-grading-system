using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication.Student
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string se = Session["user_name"].ToString();
            if (se.StartsWith("S"))
            {
                ;
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
}