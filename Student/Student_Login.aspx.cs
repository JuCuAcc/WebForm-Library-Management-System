using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AspNetProject_Jashim.Student
{
    public partial class Student_Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        DataTable dt;
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnStudentSignIn_Click(object sender, EventArgs e)
        {
            int i = 0;


            using (con = new SqlConnection(cs))
            {
                con.Open();
                string query = "SELECT * FROM Student_Registration WHERE UserName = '" + username.Text + "' AND password ='" + password.Text + "' AND Approved= 'yes'";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

                dt = new DataTable();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                i = Convert.ToInt32(dt.Rows.Count.ToString());

                if (i > 0)
                {
                    Session["Student"] = username.Text;
                    Response.Redirect("Books_Issued_To_Me.aspx");
                }
                else
                {
                    error.Style.Add("display", "block");
                }
            }

        }
    }
}