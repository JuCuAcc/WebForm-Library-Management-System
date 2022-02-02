using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace AspNetProject_Jashim.MyControls
{
    public partial class ucRegisterStudent : System.Web.UI.UserControl
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string path = Path.GetFileName(FileUpload1.PostedFile.FileName);
          
            FileUpload1.SaveAs(MapPath("~/Student/Student_Images/" + path));

            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("INSERT INTO Student_Registration(FirstName,LastName, Enrollment_No, UserName, Password,Email,Contact,Student_Image,Approved)" +
                 "VALUES(@FirstName,@LastName, @Enrollment_No, @UserName, @Password,@Email,@Contact,@Student_Image,@Approved)", con);


                // @FirstName,@LastName, @Enrollment_No, @UserName, @Password,@Email,@Contact,@Student_Image,@Approved

                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@Enrollment_No", txtEnrollmentNo.Text);
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Contact", txtContact.Text);
                cmd.Parameters.AddWithValue("@Student_Image", "~/Student/Student_Images/" + path);
                cmd.Parameters.AddWithValue("@Approved", rdoApproved.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
            }

            ClearControls();
        }

        private void ClearControls()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEnrollmentNo.Text = "";
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtEmail.Text = "";
            txtContact.Text = "";
            rdoApproved.SelectedIndex = -1;
        }
    }
}
       