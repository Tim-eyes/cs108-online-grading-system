using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data.Sql;
using System.Web.Security;

namespace WebApplication
{
    
    public partial class Log : System.Web.UI.Page 
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //String ReturnUrl = Request.QueryString["ReturnUrl"];
            //if (ReturnUrl == null || ReturnUrl.Equals(String.Empty))
            //{

            //    Response.Redirect("~/Log.aspx");

            //}
            //else
            //{
            //    if (ReturnUrl.ToLower().Contains("/admin/"))
            //    {
            //        Response.Redirect("~/AdminLogin.aspx?ReturnUrl=" + Server.UrlEncode(ReturnUrl));
            //    }
            //    else
            //    {
            //        Response.Redirect("~/UserLogin.aspx?ReturnUrl=" + Server.UrlEncode(ReturnUrl));
            //    }
            //}

        }

        protected void Login_Authenticate(object sender, AuthenticateEventArgs e)
        {
           
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-BNVOSEL\SQLEXPRESS;Initial Catalog=CS108DB;Integrated Security=True");
            con.Open();
            string strSqlTeacher = "select Name from Teacher where TeacherID='" + 
                Login.UserName.ToString() + 
                "' and Password ='" + Login.Password.ToString() + "'";
            string strSqlStudent = "select Name from Student where StudentID='" +
                Login.UserName.ToString() +
                "' and Password ='" + Login.Password.ToString() + "'";
            if (CheckBoxTeacher.Checked)
            {           
                SqlCommand com = new SqlCommand(strSqlTeacher, con);
                SqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    e.Authenticated = true;

                    HttpContext.Current.Session["OK"] = "OK";
                    HttpContext.Current.Session.Remove("user_name");
                    HttpContext.Current.Session["user_name"] = Login.UserName.ToString();
                    HttpCookie cookie = new HttpCookie("user_name");
                    cookie.Expires = DateTime.Now.AddDays(1);
                    cookie.HttpOnly = false;
                    cookie.Values.Add("user_name", Login.UserName.ToString());
                    
                    Response.AppendCookie(cookie);
                    FormsAuthentication.SetAuthCookie(Login.UserName.ToString(), false);
                    FormsAuthentication.RedirectFromLoginPage(Login.UserName.ToString(), true);
                    Response.Redirect("~/Teacher/Home.aspx");
                    
                }
                else
                {
                    e.Authenticated = false;
                }
                dr.Close();
                
            }
            else if (CheckBoxStudent.Checked)
            {
                SqlCommand com = new SqlCommand(strSqlStudent, con);
                SqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    e.Authenticated = true;

                    HttpContext.Current.Session["OK"] = "OK";
                    HttpContext.Current.Session.Remove("user_name");
                    HttpContext.Current.Session["user_name"] = Login.UserName.ToString();
                    HttpCookie cookie = new HttpCookie("user_name");
                    cookie.Expires = DateTime.Now.AddDays(1);
                    cookie.HttpOnly = false;
                    cookie.Values.Add("user_name", Login.UserName.ToString());

                    Response.AppendCookie(cookie);
                    FormsAuthentication.SetAuthCookie(Login.UserName.ToString(), false);
                    FormsAuthentication.RedirectFromLoginPage(Login.UserName.ToString(), true);
                    Response.Redirect("~/Student/Home.aspx");
                }
                else
                {
                    e.Authenticated = false;
                }
                dr.Close();
                MessageBox.Show("Welcome"+dr.ToString());
                
            }
            else if(CheckBoxTeacher.Checked && CheckBoxStudent.Checked)
            {
                MessageBox.Show("Error! You only have one identity.");
                Response.Redirect("~/Log.aspx");
            }
            else
            {
                MessageBox.Show("Error! Please choose your identity.");
                Response.Redirect("~/Log.aspx");
            }
            con.Close();


        }

        protected void CheckBoxTeacher_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBoxStudent_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}