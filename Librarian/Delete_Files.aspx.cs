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
    public partial class Delete_Files : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(cs);
            con.Open();
            DeleteData();
            Response.Redirect("Display_All_Books.aspx");
        }

        private void DeleteData()
        {

            if (Request.QueryString["id"] != null)
            {
                string query1 = "UPDATE Books SET Books_Video = '' WHERE id = '" + Request.QueryString["id"].ToString() + "'";

                cmd = new SqlCommand(query1, con);
                cmd.ExecuteNonQuery();
            }
            else if (Request.QueryString["id1"] != null)
            {
                string query2 = "UPDATE Books SET Books_Pdf = ''   WHERE id = '" + Request.QueryString["id1"].ToString() + "'";

                cmd = new SqlCommand(query2, con);
                cmd.ExecuteNonQuery();
            }
            else
            {
                string query3 = "DELETE Books WHERE id = '" + Request.QueryString["id2"].ToString() + "'";

                cmd = new SqlCommand(query3, con);
                cmd.ExecuteNonQuery();
            }
        }
    }
}