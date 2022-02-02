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
    public partial class Edit_Books : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con; SqlCommand cmd; SqlDataAdapter da;
        
        DataTable dt;
        int id;

        public static string GetRandomPassword(int length)
        {
            char[] chars = "abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
            string password = string.Empty;
            Random random = new Random();

            for (int i = 0; i < length; i++)
            {
                int x = random.Next(1, chars.Length);
                //For avoiding Repetation of Characters
                if (!password.Contains(chars.GetValue(x).ToString()))
                    password += chars.GetValue(x);
                else
                    i--;
            }
            return password;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            using (con = new SqlConnection(cs))
            {
                con.Open();

                id = Convert.ToInt32(Request.QueryString["id"].ToString());

                if (IsPostBack)
                {
                    return;
                }

                cmd = new SqlCommand("SELECT * FROM Books WHERE id= "+id+" ", con);
                cmd.ExecuteNonQuery();

                dt = new DataTable();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                foreach (DataRow dr in dt.Rows)
                {
                    txtBooksTitle.Text = dr["Books_Title"].ToString();
                    txtAuthorName.Text = dr["Books_Author_Name"].ToString();
                    txtIsbn.Text = dr["Books_Isbn"].ToString();
                    txtQty.Text = dr["Available_Quantity"].ToString(); //available_Quantity

                    booksimage.Text = dr["Books_Image"].ToString();
                    bookspdf.Text = dr["Books_Pdf"].ToString();
                    booksvideo.Text = dr["Books_Video"].ToString();
                }
                con.Close();
            }


        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            string books_image_name = "", books_pdf = "", books_video = "";
            string path = "", path2 = "", path3 = "";

            if (f1.FileName.ToString() != "")
            {
                books_image_name = GetRandomPassword(10) + ".jpg";

                f1.SaveAs(Request.PhysicalApplicationPath + "/Librarian/Books_Images/" + f1.FileName.ToString());
                path = "Books_Images/" + f1.FileName.ToString();

                using (con = new SqlConnection(cs))
                {
                    con.Open();


                    cmd = new SqlCommand("UPDATE  Books  SET Books_Title = @books_title, Books_Image= @books_image, Books_Author_Name = @books_author_name, Books_Isbn = @books_isbn, Available_Quantity = @available_quantity WHERE id =  '" + id + "'", con);

                    cmd.Parameters.AddWithValue("@books_title", txtBooksTitle.Text);

                    cmd.Parameters.AddWithValue("@books_image", "/Librarian/" + path); //Work to be done

                    cmd.Parameters.AddWithValue("@books_author_name", txtAuthorName.Text);
                    cmd.Parameters.AddWithValue("@books_isbn", txtIsbn.Text);
                    cmd.Parameters.AddWithValue("@available_quantity", txtQty.Text);

                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            if (f2.FileName.ToString() != "")
            {
                books_pdf = GetRandomPassword(10) + ".pdf";

                f2.SaveAs(Request.PhysicalApplicationPath + "/Librarian/Books_Pdf/" + f2.FileName.ToString());
                path2 = "Books_Pdf/" + f2.FileName.ToString();

                using (con = new SqlConnection(cs))
                {
                    con.Open();

                    cmd = new SqlCommand("UPDATE  Books SET Books_Title=@books_title," +

                                            "Books_Pdf=@books_pdf," +

                                            "Books_Author_Name=@books_author_name," +
                                            "Books_Isbn=@books_isbn," +
                                            "Available_Quantity=@available_quantity WHERE id =  '" + id + "'", con);


                    cmd.Parameters.AddWithValue("@books_title", txtBooksTitle.Text);

                    cmd.Parameters.AddWithValue("@books_pdf", path2.ToString());

                    cmd.Parameters.AddWithValue("@books_author_name", txtAuthorName.Text);
                    cmd.Parameters.AddWithValue("@books_isbn", txtIsbn.Text);
                    cmd.Parameters.AddWithValue("@available_quantity", txtQty.Text);

                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            if (f3.FileName.ToString() != "")
            {
                books_video = GetRandomPassword(10) + ".mp4";

                f3.SaveAs(Request.PhysicalApplicationPath + "/Librarian/Books_Videos/" + f3.FileName.ToString());
                path3 = "Books_Videos/" + f3.FileName.ToString();

                using (con = new SqlConnection(cs))
                {
                    con.Open();

                    cmd = new SqlCommand("UPDATE  Books SET Books_Title=@books_title," +

                                            "Books_Video=@books_video," +
                                            "Books_Author_Name=@books_author_name," +
                                            "Books_Isbn=@books_isbn," +
                                            "Available_Quantity=@available_quantity WHERE id =  '" + id + "'", con);


                    cmd.Parameters.AddWithValue("@books_title", txtBooksTitle.Text);

                    cmd.Parameters.AddWithValue("@books_video", "/Librarian/" + path3.ToString()); 

                    cmd.Parameters.AddWithValue("@books_author_name", txtAuthorName.Text);
                    cmd.Parameters.AddWithValue("@books_isbn", txtIsbn.Text);
                    cmd.Parameters.AddWithValue("@available_quantity", txtQty.Text);

                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            if (f1.FileName.ToString()=="" && f2.FileName.ToString() == "" && f3.FileName.ToString() == ""  )
            {
                using (con = new SqlConnection(cs))
                {
                    con.Open();
                    cmd = new SqlCommand("UPDATE  Books SET Books_Title=@books_title,Books_Author_Name=@books_author_name,Books_Isbn=@books_isbn,Available_Quantity=@available_quantity WHERE id =  '"+ id +"'", con);


                    cmd.Parameters.AddWithValue("@books_title", txtBooksTitle.Text);

                    cmd.Parameters.AddWithValue("@books_author_name", txtAuthorName.Text);
                    cmd.Parameters.AddWithValue("@books_isbn", txtIsbn.Text);
                    cmd.Parameters.AddWithValue("@available_quantity", txtQty.Text);

                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            Response.Redirect("Display_All_Books.aspx");

        }
    }
}