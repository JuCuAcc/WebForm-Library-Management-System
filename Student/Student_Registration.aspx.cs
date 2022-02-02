using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

using Newtonsoft.Json.Linq;
using System.Net;
using System.IO;


namespace AspNetProject_Jashim.Student
{
    public partial class Student_Registration : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {

            if (IsReCaptchValid())
            {
                InsertInfo();
                Response.Redirect("Student_Login.aspx");  //Work here
            }
            else
            {
                lblMessage1.Text = "This is invalid";
            }


        }

        public bool IsReCaptchValid()
        {
            var result = false;
            var captchaResponse = Request.Form["g-recaptcha-response"];
            var secretKey = "6LcGUoocAAAAAEqYfXen7OhG5JvES7P_dGjKYkCG";     //SecretKeyFromGoogle
            var apiUrl = "https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}";
            var requestUri = string.Format(apiUrl, secretKey, captchaResponse);
            var request = (HttpWebRequest)WebRequest.Create(requestUri);

            using (WebResponse response = request.GetResponse())
            {
                using (StreamReader stream = new StreamReader(response.GetResponseStream()))
                {
                    JObject jResponse = JObject.Parse(stream.ReadToEnd());
                    var isSuccess = jResponse.Value<bool>("success");
                    result = isSuccess ? true : false;
                }
            }
            return result;
        }
        private void InsertInfo()
        {
            string student_image_path = "";

            if (f1.FileName.ToString() != "")
            {
                string randomno = RandomPassword.GetRandomPassword(10) + ".jpg";
                f1.SaveAs(Request.PhysicalApplicationPath + "/Student/Student_Images/" + randomno.ToString());
                student_image_path = "Student_Images/" + randomno.ToString();
            }
            using (con = new SqlConnection(cs))
            {
                con.Open();
                string query = "INSERT INTO Student_Registration(FirstName, LastName, Enrollment_No, UserName, Password, Email, Contact, Student_Image) " +
                    "VALUES(@firstname, @lastname, @enrollment_no, @username, @password, @email, @contact, @student_image)";


                cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@firstname", txtStudentFirstName.Text);
                cmd.Parameters.AddWithValue("@lastname", txtStudentLastName.Text);
                cmd.Parameters.AddWithValue("@enrollment_no", txtStudentEnrollmentNo.Text);
                cmd.Parameters.AddWithValue("@username", txtStudentUserName.Text);
                cmd.Parameters.AddWithValue("@password", txtStudentPassword.Text);
                cmd.Parameters.AddWithValue("@email", txtStudentEmail.Text);
                cmd.Parameters.AddWithValue("@contact", txtStudentContact.Text);
                cmd.Parameters.AddWithValue("@student_image", "/Student/" + student_image_path.ToString());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Record Inserted Successfully.');</script>");

                txtStudentFirstName.Text = "";
                txtStudentLastName.Text = "";
                txtStudentEnrollmentNo.Text = "";
                txtStudentUserName.Text = "";
                txtStudentPassword.Text = "";
                txtStudentEmail.Text = "";
                txtStudentContact.Text = "";

            }

        }



    }
}