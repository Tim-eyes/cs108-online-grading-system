using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;


namespace WebApplication.Teacher
{
    public partial class Management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string se = Session["user_name"].ToString();
            if (se.StartsWith("T"))
            {
                ;
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }
        }

        protected void TextBox_TextChanged(object sender, EventArgs e)
        {
            //foreach(TextBox tb in this.Controls)
            //{
            //    int i = Convert.ToInt32(tb.Text);
            //    if (tb.TextMode.Equals("Number") && i<0)
            //    {
            //        tb.Text = "";   
            //    }
            //}
          
        }

        protected void ButtonQue_Click(object sender, EventArgs e)
        {
            int cnt = 0;
            string conStr = ConfigurationManager.ConnectionStrings["CS108DBConnectionString"].ToString();
            SqlConnection con = null;
            con = new SqlConnection(conStr);
            con.Open();
            string strCount = string.Format(@"SELECT COUNT(*) FROM Question");
            SqlCommand comCount = new SqlCommand(strCount, con);
            SqlDataReader dr = comCount.ExecuteReader();
            if (dr.Read())
            {
                cnt = (int)dr[0];
            }
            try
            {
                con = new SqlConnection(conStr);
                string strSql = string.Format(@"INSERT INTO Question VALUES({0},{1},'{2}','{3}',{4})",
                    cnt+1, Convert.ToInt32(DropDownListAss.Text), TextBoxQueInfo.Text, TextBoxSolInfo.Text, Convert.ToInt32(TextBoxQueScore.Text));
                SqlCommand com = new SqlCommand(strSql, con);

                con.Open();
                int i = com.ExecuteNonQuery();
                if (i > 0)
                {
                    MessageBox.Show("Creation Successful");
                }
                else
                {
                    MessageBox.Show("Creation Unsuccessful");
                }
                Response.Redirect("~/Teacher/Management.aspx");

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

        protected void ButtonAss_Click(object sender, EventArgs e)
        {
            int cnt = 0;
            string conStr = ConfigurationManager.ConnectionStrings["CS108DBConnectionString"].ToString();
            SqlConnection con = null;
            con = new SqlConnection(conStr);
            con.Open();
            string strCount = string.Format(@"SELECT COUNT(*) FROM Assignment");
            SqlCommand comCount = new SqlCommand(strCount, con);
            SqlDataReader dr = comCount.ExecuteReader();
            if (dr.Read())
            {
                cnt = (int)dr[0];
            }
            con.Close();
            try
            {
                con = new SqlConnection(conStr);
                string strSql = string.Format(@"INSERT INTO Assignment VALUES('{0}','{1}','{2}','{3}')",
                    cnt+1, TextBoxAssName.Text, DropDownList1.Text, 100);
                SqlCommand com = new SqlCommand(strSql, con);

                con.Open();
                int i = com.ExecuteNonQuery();
                if (i > 0)
                {
                    MessageBox.Show("Creation Successful");
                }
                else
                {
                    MessageBox.Show("Creation Unsuccessful");
                }
                
                Response.Redirect("~/Teacher/Management.aspx");    
                

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

  
        protected void ButtonUp_Click(object sender, EventArgs e)
        {
            SqlDataSource4.SelectParameters.GetValues(this.Context, DropDownList1);
        }
    }
}