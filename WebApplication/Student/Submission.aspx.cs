using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication.Student
{
    public partial class Submission : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.Cookies["MyCook"] != null)// get cookie and modify times
            //{
            //    HttpCookie cookie = Request.Cookies["MyCook"];
            //    string times = cookie["VisitTimes"];
            //    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "info", "alert('" + times + "times');", true);
            //    string newtimes = (Convert.ToInt32(times) + 1).ToString();
            //    cookie.Values["VisitTimes"] = newtimes;
            //    Response.SetCookie(cookie);
            //}
            //else // create cookie
            //{
            //    HttpCookie cookie = new HttpCookie("MyCook");
            //    cookie.Expires = DateTime.Now.AddMinutes(30);
            //    cookie.Values.Add("VisitTimes", "1");
            //    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "info", "alert('create time ');", true);
            //    Response.SetCookie(cookie);
            //}

            //if (IsPostBack)
            //{
            //    Response.Cookies["MyCook"].Expires = DateTime.Now.AddDays(-1);
            //}
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

        protected void ButtonSub_Click(object sender, EventArgs e)
        {


            int cnt = 0;
            string conStr = ConfigurationManager.ConnectionStrings["CS108DBConnectionString"].ToString();
            SqlConnection con = null;
            con = new SqlConnection(conStr);
            con.Open();
            string strCount = string.Format(@"SELECT COUNT(*) FROM Submission");
            SqlCommand comCount = new SqlCommand(strCount,con);
            SqlDataReader dr = comCount.ExecuteReader();
            if (dr.Read())
            {
                cnt = (int)dr[0];
            }
            con.Close();
            try
            {
                con = new SqlConnection(conStr);
                string strSql = string.Format(@"INSERT INTO Submission VALUES('{0}','{1}','{2}','{3}','{4}','{5}')",
                    cnt+1,
                    Convert.ToInt32(DropDownListAss.Text),
                    Convert.ToInt32(DropDownListQue.Text),
                    Session["user_name"],TextBoxAns.Text,null);
                SqlCommand com = new SqlCommand(strSql, con);

                con.Open();
                int i = com.ExecuteNonQuery();
                if (i > 0)
                {
                    MessageBox.Show("Submission Successful");
                    
                }
                else
                {
                    MessageBox.Show("Submission Unsuccessful");
                }
                Response.Redirect("~/Student/Submission.aspx");

            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectParameters.GetValues(this.Context, RadioButtonList1);
        }

        protected void ButtonUpdate2_Click(object sender, EventArgs e)
        {
            SqlDataSource3.SelectParameters.GetValues(this.Context, DropDownListAss);
        }

       

        protected void ButtonUpdate3_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["CS108DBConnectionString"].ToString();
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(conStr);
                string strSql = string.Format(@"SELECT DISTINCT Q.Question
                    FROM Course AS C
                    JOIN Assignment AS A
                    ON C.CourseID=A.CourseID
                    JOIN Question AS Q
                    ON Q.AssignmentNo=@AssignmentNo
                    AND Q.QuestionNo=@QuestionNo");
 
                SqlCommand com = new SqlCommand(strSql, con);
                com.Parameters.AddWithValue("@AssignmentNo", DropDownListAss.Text);
                com.Parameters.AddWithValue("@QuestionNo", DropDownListQue.Text);
                con.Open();
                SqlDataReader dr = com.ExecuteReader();
                //object ob = com.ExecuteScalar();

                if (dr.Read())
                {
                    TextBoxQue.Text = dr[0].ToString();

                }
                else
                {
                    MessageBox.Show("No this question");
                }
                //Response.Redirect("~/Student/Submission.aspx");

            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["CS108DBConnectionString"].ToString();
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(conStr);
                string strSql = string.Format(@"IF(( SELECT COUNT(*) FROM Grade WHERE CourseID ='{0}' AND StudentID = '{1}')<1) INSERT INTO Grade VALUES('{0}','{1}','{2}') ",
                    RadioButtonList1.Text,Session["user_name"].ToString(),null);

                SqlCommand com = new SqlCommand(strSql, con);
                con.Open();
                int i = com.ExecuteNonQuery();
                //object ob = com.ExecuteScalar();

                if (i>0)
                {
                    MessageBox.Show("Add Successful");
                }
                else
                {
                    MessageBox.Show("Add Unsuccessful");
                }
                //Response.Redirect("~/Student/Submission.aspx");

            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}