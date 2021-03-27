using System;
using System.Web;

namespace WebApplication
{
    public class User : System.Web.UI.Page
    {
        public string UserName
        {
            get
            {
                if (Session["user_name"] != null)
                {
                    Session["user_name"] = Session["user_name"].ToString();
                    return Session["user_name"].ToString();
                }
                else
                {
                    string s = GetCookie("user_name");
                    if (s != "")
                    {
                        UserName = s;
                        return s;
                    }
                }
                return "";
            }
            set
            {
                WriteCookie("user_name", value);
                Session["user_name"] = value;
            }
        }
        //method for cookie
        public static void WriteCookie(string cookieName,DateTime exprise, string value)
        {
            HttpCookie cookie = new HttpCookie(cookieName);
            cookie.Value = HttpContext.Current.Server.UrlEncode(value);
            cookie.Expires = exprise;
            HttpContext.Current.Response.Cookies.Add(cookie);

        }
        public static void WriteCookie(string cookieName, string value)
        {
            HttpCookie cookie = new HttpCookie(cookieName);
            cookie.Value = HttpContext.Current.Server.UrlEncode(value);
            HttpContext.Current.Response.Cookies.Add(cookie);

        }
        public static string GetCookie(string cookieName)
        {
            if (HttpContext.Current.Request.Cookies[cookieName] != null)
            {
                HttpCookie cookie = HttpContext.Current.Request.Cookies[cookieName];
                return HttpContext.Current.Server.UrlDecode(cookie.Value);
            }
            return "";
        }
    }

    
}