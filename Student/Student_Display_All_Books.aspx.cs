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

namespace AspNetProject_Jashim.Student
{
    public partial class Student_Display_All_Books : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(cs);
            con.Open();
            if (Session["Student"] == null)
            {
                Response.Redirect("Student_Login.aspx");
            }
            ShowBookData();
        }
        private void ShowBookData()
        {
            using (con = new SqlConnection(cs))
            {
                con.Open();
                string query = "SELECT * FROM Books";
                cmd = new SqlCommand(query, con);
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
                return "Not Available";
            }
            else
            {
                videoPath = "../" + videoPath.ToString();
                return "<a href='"+ videoPath.ToString() + "' style='color:blue;'>View Video</a>";
            }
        }

        public string CheckPdf(object pdfPath, object id1)
        {
            if (pdfPath == "")
            {
                return "Not Available";
            }
            else
            {
                pdfPath = "../"+ pdfPath.ToString();
                return "<a href='"+ pdfPath.ToString()+ "' style='color:blue;'>View PDF</a>";
            }
        }
    }
}