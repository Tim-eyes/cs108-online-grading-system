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
    public partial class Marking : System.Web.UI.Page
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


        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["CS108DBConnectionString"].ToString();
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(conStr);
                string strSql = string.Format(@"SELECT Q.QuestionNo, Q.Solution, S.Answer
                    FROM Question AS Q
                    JOIN Submission AS S
                    ON Q.QuestionNo=S.QuestionNo
                    WHERE Q.QuestionNo=@QuestionNo");

                SqlCommand com = new SqlCommand(strSql, con);
                com.Parameters.AddWithValue("@QuestionNo", DropDownListQue.Text);

                con.Open();
                SqlDataReader dr = com.ExecuteReader();
                //object ob = com.ExecuteScalar();

                if (dr.Read())
                {
                    TextBoxSol.Text = dr[1].ToString();
                    TextBoxAns.Text = dr[2].ToString();

                }
                else
                {
                    MessageBox.Show("No this question or answer!");
                    MessageBox.Show(DropDownListQue.Text);
                }
                //Response.Redirect("~/Teacher/Marking.aspx");

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

        protected void ButtonSub_Click(object sender, EventArgs e)
        {

            string conStr = ConfigurationManager.ConnectionStrings["CS108DBConnectionString"].ToString();
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(conStr);
                string strSql = string.Format(@"IF((SELECT Score FROM Question WHERE AssignmentNo={1} 
                    AND QuestionNo={2})>{0}) 
                    Update Submission SET Score={0}
                    WHERE AssignmentNo={1} AND QuestionNo={2}",
                    Convert.ToInt32(TextBoxSco.Text), Convert.ToInt32(DropDownListAss.Text), 
                    Convert.ToInt32(DropDownListQue.Text));
                SqlCommand com = new SqlCommand(strSql, con);
                //com.Parameters.AddWithValue("@Score", Convert.ToInt32(TextBoxSco.Text));

                con.Open();
                int i = com.ExecuteNonQuery();
                if (i>0)
                {
                    MessageBox.Show("Marking Successful");

                }
                else
                {
                    MessageBox.Show("Marking Unsuccessful");
                }
                Response.Redirect("~/Teacher/Marking.aspx");

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
            SqlDataSource2.SelectParameters.GetValues(this.Context, RadioButtonList1);
        }
    }
}