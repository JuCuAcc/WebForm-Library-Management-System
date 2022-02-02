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

    public partial class Display_All_Books : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowBookData();
        }

        private void ShowBookData()
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();
                string query = "SELECT * FROM Books";
                cmd = new SqlCommand(query,con);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                r1.DataSource = dt;
                r1.DataBind();
                con.Close();
            }
        }

        public string CheckVideo(object videoPath, object id)  
        {
            if (videoPath == "")
            {
                return videoPath.ToString();
            }
            else
            {
                return "<a href='Delete_Files.aspx?id="+id+"' style='color:red;'>Delete Video</a>";
            }
        }

        public string CheckPdf(object pdfPath, object id1)
        {
            if (pdfPath == "")
            {
                return pdfPath.ToString();
            }
            else
            {
                return "<a href='Delete_Files.aspx?id1="+id1+"' style='color:red;'>Delete PDF</a>";
            }
        }
    }
}