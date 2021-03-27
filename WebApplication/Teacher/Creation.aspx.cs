using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace WebApplication.Teacher
{
    public partial class Creation : System.Web.UI.Page
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

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if (TextBox5.Text != TextBox6.Text)
            {
                MessageBox.Show("Password must be the same!");
                Response.Redirect("~/Teacher/Creation.aspx");
                return;
            }
            string conStr = ConfigurationManager.ConnectionStrings["CS108DBConnectionString"].ToString();
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(conStr);
                string strSql = string.Format(@"INSERT INTO Student VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')",
                    TextBox1.Text, TextBox2.Text, DropDownList1.Text, RadioButtonList1.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, null);
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
                Response.Redirect("~/Teacher/Home.aspx");

            }
            catch(SqlException ex)
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