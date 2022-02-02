using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace AspNetProject_Jashim.Librarian
{
    public partial class Issue_Books : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;

        SqlConnection con; SqlCommand cmd, cmd2, cmd3, cmd4, cmd5;

        DataTable dt, dt2, dt3, dt5; SqlDataAdapter da, da2, da3, da5;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                return;
            }

            EnrollmentNoDropDown();
            BookIsbnDropDown();

        }


        //[Corrected]
        protected void ddlBookIsbn_SelectedIndexChanged(object sender, EventArgs e)
        {
            imgBook.ImageUrl = "";

            lblBookName.Text = "";

            lblInStock.Text = "";

            con = new SqlConnection(cs);

            con.Open();
            string query3 = "SELECT * FROM Books WHERE Books_Isbn = '" + ddlBookIsbn.SelectedItem.ToString() + "' ";
            cmd3 = new SqlCommand(query3, con);
            cmd3.ExecuteNonQuery();
            dt3 = new DataTable();
            da3 = new SqlDataAdapter(cmd3);
            da3.Fill(dt3);

            foreach (DataRow dr3 in dt3.Rows)
            {
                imgBook.ImageUrl = dr3["Books_Image"].ToString();
                lblBookName.Text = dr3["Books_Title"].ToString();
                lblInStock.Text = dr3["Available_Quantity"].ToString();  //Available_Quantity

            }
            con.Close();

        }

        protected void ddlSelectEnrollmentNo_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            //Checking Book is selected or not
            if (ddlBookIsbn.SelectedItem.ToString() == "Select ISBN")
            {
                Response.Write("<script>alert('Please Select Book ISBN'); window.location.href=window.location.href; </script>");
            }
            else
            {
                //Checking the Book is already issued to the student or not
                int found = 0;

                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    string query5 = "SELECT * FROM Issue_Books WHERE Student_Enrollment_No= '" + ddlSelectEnrollmentNo.SelectedItem.ToString() + "' AND Books_Isbn = '" + ddlBookIsbn.SelectedValue.ToString() + "' AND Is_Book_Returned = 'no' ";
                    cmd5 = new SqlCommand(query5, con);
                    cmd5.ExecuteNonQuery();

                    dt5 = new DataTable();
                    da5 = new SqlDataAdapter(cmd5);
                    da5.Fill(dt5);
                    found = Convert.ToInt32(dt5.Rows.Count.ToString());

                    if (found > 0)      //This means Book is available
                    {
                        Response.Write("<script>alert('This Book is already issued to the student.'); </script>");
                    }
                    else
                    {
                        //This is for checking the Book is available or not
                        if (lblInStock.Text == "0")
                        {
                            Response.Write("<script>alert('This Book is not available in stock.'); </script>");
                        }
                        else
                        {
                            //For Insert
                            IssueBookToMember();
                        }
                    }
                }
            }

        }
        private void EnrollmentNoDropDown()
        {

            ddlSelectEnrollmentNo.Items.Clear();

            using (con = new SqlConnection(cs))
            {
                con.Open();
                string query1 = "SELECT Enrollment_No FROM Student_Registration";

                cmd = new SqlCommand(query1, con);
                cmd.ExecuteNonQuery();
                dt = new DataTable();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                foreach (DataRow dr in dt.Rows)
                {
                    ddlSelectEnrollmentNo.Items.Add(dr["Enrollment_No"].ToString());
                }
                con.Close();
            }
        }
        private void BookIsbnDropDown()
        {
            ddlBookIsbn.Items.Clear();
            ddlBookIsbn.Items.Add("Select ISBN");

            using (con = new SqlConnection(cs))
            {
                con.Open();
                string query2 = "SELECT Books_Isbn FROM Books";

                cmd2 = new SqlCommand(query2, con);
                cmd2.ExecuteNonQuery();
                dt2 = new DataTable();
                da2 = new SqlDataAdapter(cmd2);
                da2.Fill(dt2);

                foreach (DataRow dr2 in dt2.Rows)
                {
                    ddlBookIsbn.Items.Add(dr2["Books_Isbn"].ToString());
                }
                con.Close();

            }

        }
        private void IssueBookToMember()
        {
            string books_issue_date = DateTime.Now.ToString("yyyy/MM/dd");
            string approx_return_date = DateTime.Now.ToString("yyyy/MM/dd");
            string username = "";

            using (con = new SqlConnection(cs))
            {
                con.Open();
                string query4 = "SELECT * FROM Student_Registration WHERE Enrollment_No= '" + ddlSelectEnrollmentNo.SelectedItem.ToString() + "'";
                cmd2 = new SqlCommand(query4, con);
                cmd2.ExecuteNonQuery();

                dt2 = new DataTable();
                da2 = new SqlDataAdapter(cmd2);
                da2.Fill(dt2);

                foreach (DataRow dr2 in dt2.Rows)
                {
                    username = dr2["UserName"].ToString();
                }


                string mixedQuery = "INSERT INTO Issue_Books VALUES('" + ddlSelectEnrollmentNo.SelectedItem.ToString() + "','" + ddlBookIsbn.SelectedItem.ToString() + "','" + books_issue_date.ToString() + "','" + approx_return_date.ToString() + "','" + username.ToString() + "','no','no')";
                cmd3 = new SqlCommand(mixedQuery, con);
                cmd3.ExecuteNonQuery();

                string query6 = "UPDATE Books SET Available_Quantity = Available_Quantity-1 WHERE Books_Isbn = '" + ddlBookIsbn.SelectedItem.ToString() + "'";
                cmd4 = new SqlCommand(query6, con);
                cmd4.ExecuteNonQuery();

                con.Close();

            }
            Response.Write("<script>alert('Book Issued Successfully'); window.location.href=window.location.href;</script>");

        }

    }
}