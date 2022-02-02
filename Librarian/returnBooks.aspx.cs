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
    public partial class returnBooks : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        
        int id; 
        string Books_Isbn = "";

        SqlConnection con;  
        SqlCommand cmd1, cmd2, cmd3; 
        DataTable dt1;   SqlDataAdapter da1;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            ReturnBooksOperation();
            Response.Redirect("Return_Books.aspx");
        }

        private void ReturnBooksOperation()
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();
                string query1 = "UPDATE Issue_Books SET Is_Book_Returned = 'yes', Book_Returned_Date = '" + DateTime.Now.ToString("yyyy/MM/dd") + "' WHERE id= " + id + "";
                cmd1 = new SqlCommand(query1, con);
                cmd1.ExecuteNonQuery();


                string query2 = "SELECT * FROM Issue_Books WHERE id= " + id + "";
                cmd2 = new SqlCommand(query2, con);
                cmd2.ExecuteNonQuery();

                dt1 = new DataTable();
                da1 = new SqlDataAdapter(cmd2);
                da1.Fill(dt1);

                foreach (DataRow dr1 in dt1.Rows)
                {
                    Books_Isbn = dr1["Books_Isbn"].ToString();

                }


                string query3 = "UPDATE Books SET Available_Quantity = (Available_Quantity + 1) WHERE Books_Isbn = " + Books_Isbn.ToString() + "";
                cmd3 = new SqlCommand(query3, con);
                cmd3.ExecuteNonQuery();

                con.Close();
            }
        }
    }
}