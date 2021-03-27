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
    public partial class Home : System.Web.UI.Page
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

       
        
        protected void CalGrade_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["CS108DBConnectionString"].ToString();
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(conStr);
                string strSql = string.Format(@"WITH T AS
                    (
                    SELECT SUM(S.Score) OVER(PARTITION BY A.AssignmentNo ORDER BY A.AssignmentNo)AS [Mark]
                    FROM Submission AS S
                    JOIN Assignment AS A
                    ON A.AssignmentNo=S.AssignmentNo
                    WHERE A.CourseID='{0}' AND S.StudentID='{1}'
                     )
                    SELECT (SUM(Mark)/COUNT(Mark)) AS[Average Mark of every assignment]
                    FROM T", DropDownListCou.Text, DropDownListStu.Text);
                SqlCommand com = new SqlCommand(strSql, con);

                con.Open();
                SqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    MessageBox.Show("Grade Successful! The Grade is "+dr[0].ToString());
                    SqlConnection conUp = new SqlConnection(conStr);
                    string strUp = string.Format(@"UPDATE Grade
                        SET Grade={0}
                        WHERE CourseID='{1}' AND StudentID='{2}'",
                        dr[0], DropDownListCou.Text, DropDownListStu.Text);

                    SqlCommand comUp = new SqlCommand(strUp, conUp);
                    conUp.Open();
                    try
                    {

                        int i = comUp.ExecuteNonQuery();
                        if (i>0)
                        {
                            MessageBox.Show("Update Successful");
                        }
                        else
                        {
                            MessageBox.Show("Update Unsuccessful");
                        }
                    }
                    catch (SqlException ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                    finally
                    {
                        conUp.Close();
                    }
                } 
                else
                    {
                        MessageBox.Show("Grade Unsuccessful");
                    }
                    Response.Redirect("~/Teacher/Home.aspx");
    
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

        protected void ButtonGPA_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["CS108DBConnectionString"].ToString();
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(conStr);
                string strSql = string.Format(@"WITH T AS(
                    SELECT G.Grade,C.Credit
                    FROM Grade AS G
                    JOIN Course AS C
                    ON G.CourseID=C.CourseID 
                    AND StudentID='{0}'
                    )
                    SELECT SUM(xx)/(SELECT SUM(C.Credit)
                    FROM Grade AS G
                    JOIN Course AS C
                    ON G.CourseID=C.CourseID 
                    AND StudentID='{0}') AS GPA
                    FROM(
                    SELECT Grade*Credit AS xx
                    FROM T GROUP BY Grade,Credit ) AS P
                    ",DropDownListStu.Text);
                SqlCommand com = new SqlCommand(strSql, con);

                con.Open();
                SqlDataReader dr = com.ExecuteReader();
                if(dr.Read())
                {
                    MessageBox.Show("GPA Successful! The GPA is " + dr[0].ToString());
                    SqlConnection conUp = new SqlConnection(conStr);
                    string strUp = string.Format(@"UPDATE Student
                        SET GPA={0}
                        WHERE StudentID='{1}'",
                        dr[0], DropDownListStu.Text);

                    SqlCommand comUp = new SqlCommand(strUp, conUp);
                    conUp.Open();
                    try
                    {

                        int i = comUp.ExecuteNonQuery();
                        if (i > 0)
                        {
                            MessageBox.Show("Update Successful");
                        }
                        else
                        {
                            MessageBox.Show("Update Unsuccessful");
                        }
                    }
                    catch (SqlException ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                    finally
                    {
                        conUp.Close();
                    }
                }
                else
                {
                    MessageBox.Show("GPA Unsuccessful");
                }
                Response.Redirect("~/Teacher/Home.aspx");

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