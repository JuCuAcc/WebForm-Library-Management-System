using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;


namespace AspNetProject_Jashim.Librarian
{
    public partial class Student_Deactive : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            RejectApproval();
        }

        private void RejectApproval()
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                string query = "UPDATE Student_Registration SET Approved = 'no' WHERE id=" + id + " ";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Response.Redirect("Display_Student_Info.aspx");
        }
    }
}