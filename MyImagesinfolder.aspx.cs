using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.IO;

namespace AspNetProject_Jashim
{
    public partial class MyImagesinfolder : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;

        DataTable dt;
        SqlDataAdapter da;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            using (con = new SqlConnection(cs))
            {
                if (FileUpload1.HasFile)
                {
                    string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    if (extension.ToLower() == ".jpg" || extension.ToLower() == ".gif" || extension.ToLower() == ".png" || extension.ToLower() == ".bmp" || extension.ToLower() == ".jpeg")
                    {
                        string dtx = getspan(DateTime.Now);
                        string filenm = dtx + FileUpload1.FileName;
                        string path = Server.MapPath("~/Userpics/" + filenm);
                        FileUpload1.SaveAs(path);
                        imgpro.ImageUrl = "~/Userpics/" + filenm;
                        SqlCommand cmd = new SqlCommand("Usp_mypicsstoreinfolder", con);
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ImageName", FileUpload1.FileName); // storing name of image  
                        cmd.Parameters.AddWithValue("@ImagePath", path); // bytes  
                        cmd.Parameters.AddWithValue("@ImageSize", FileUpload1.PostedFile.ContentLength); // getting file size  
                        int returnvalue = cmd.ExecuteNonQuery();
                        con.Close();
                        cmd.Dispose();
                        if (returnvalue > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Image Saved Successfully');", true);
                        }
                    }
                }

            }
        }
        public string getspan(DateTime value)
        {
            return value.ToString("yyyyMMddHHmmssffff"); //for making unique name of image  
        }
    }
}