using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AspNetProject_Jashim.Librarian
{
    public partial class Return_Books : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;

        //Work To be done here 

        SqlConnection con;
        SqlCommand cmd1;

        DataTable dt, dt1;
        SqlDataAdapter da1;
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowStudentBookData();
        }

        private void ShowStudentBookData()
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();

                //For Temporary DataTable
                dt = new DataTable();
                dt.Clear();

                dt.Columns.Add("id");

                dt.Columns.Add("Student_Enrollment_No");
                dt.Columns.Add("Books_Isbn");
                dt.Columns.Add("Books_Issue_Date");
                dt.Columns.Add("Books_Approx_Return_Date");
                dt.Columns.Add("Student_UserName");
                dt.Columns.Add("Is_Book_Returned");
                dt.Columns.Add("Book_Returned_Date");
                dt.Columns.Add("Late_Day");



                string query = "SELECT * FROM Issue_Books WHERE Is_Book_Returned = 'no' "; //Book which is right now available to the student
                cmd1 = new SqlCommand(query, con);
                cmd1.ExecuteNonQuery();
                dt1 = new DataTable();
                da1 = new SqlDataAdapter(cmd1);
                da1.Fill(dt1);

                foreach (DataRow dr1 in dt1.Rows) //using above Issue_Books table
                { 
                    //Temporary Table
                    DataRow dr = dt.NewRow();
                    dr["id"] = dr1["id"].ToString();

                    dr["Student_Enrollment_No"] = dr1["Student_Enrollment_No"].ToString();
                    dr["Books_Isbn"] = dr1["Books_Isbn"].ToString();
                    dr["Books_Issue_Date"] = dr1["Books_Issue_Date"].ToString();
                    dr["Books_Approx_Return_Date"] = dr1["Books_Approx_Return_Date"].ToString();
                    dr["Student_UserName"] = dr1["Student_UserName"].ToString();
                    dr["Is_Book_Returned"] = dr1["Is_Book_Returned"].ToString();
                    dr["Book_Returned_Date"] = dr1["Book_Returned_Date"].ToString();

                    //Late_Day Calculation

                    DateTime d1 = Convert.ToDateTime(DateTime.Now.ToString("yyyy/MM/dd"));
                    DateTime d2 = Convert.ToDateTime(dr1["Books_Approx_Return_Date"].ToString());

                    if (d1 > d2)
                    {
                        TimeSpan t = d1 - d2;
                        double noOfDays = t.TotalDays;
                        dr["Late_Day"] = noOfDays.ToString();
                    }
                    else
                    {
                        dr["Late_Day"] = "0";
                    }

                    dt.Rows.Add(dr);
                }

                d1.DataSource = dt;
                d1.DataBind();
                con.Close();
            }

        }
    }
}