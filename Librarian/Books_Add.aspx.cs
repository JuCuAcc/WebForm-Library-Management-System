using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

using System.Configuration;
using System.Data.SqlClient;


namespace AspNetProject_Jashim.Librarian
{
    public partial class Books_Add : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            string path = "", path2 = "", path3 = "";

            if (f1.FileName.ToString() != "")
            {

                f1.SaveAs(Request.PhysicalApplicationPath + "/Librarian/Books_Images/" + f1.FileName.ToString());
                path = "Books_Images/" + f1.FileName.ToString();
            }

            if (f2.FileName.ToString() != "")
            {
                f2.SaveAs(Request.PhysicalApplicationPath + "/Librarian/Books_Pdf/" + f2.FileName.ToString());
                path2 = "Books_Pdf/" + f2.FileName.ToString();
            }

            if (f3.FileName.ToString() != "")
            {
                f3.SaveAs(Request.PhysicalApplicationPath + "/Librarian/Books_Videos/" + f3.FileName.ToString());
                path3 = "Books_Videos/" + f3.FileName.ToString();
            }
            using (con = new SqlConnection(cs))
            {
                con.Open();

                cmd = new SqlCommand("INSERT INTO books(Books_Title,Books_Image,Books_Pdf,Books_Video,Books_Author_Name, Books_Isbn, Available_Quantity)" +
                 "VALUES(@books_title,@books_image,@books_pdf,@books_video, @books_author_name, @books_isbn, @available_quantity)", con);

                cmd.Parameters.AddWithValue("@books_title",txtBooksTitle.Text);
                cmd.Parameters.AddWithValue("@books_image", "/Librarian/" + path);  //For Image Path
                cmd.Parameters.AddWithValue("@books_pdf", "/Librarian/" + path2);   //For Pdf Path
                cmd.Parameters.AddWithValue("@books_video", "/Librarian/" + path3); //For Video Path
                cmd.Parameters.AddWithValue("@books_author_name",txtAuthorName.Text);
                cmd.Parameters.AddWithValue("@books_isbn",txtIsbn.Text);
                cmd.Parameters.AddWithValue("@available_quantity",txtQty.Text);

                cmd.ExecuteNonQuery();
                msg.Style.Add("display", "block");
                con.Close();
            }

            ClearControl();
        }

        private void ClearControl()
        {
            txtBooksTitle.Text = "";
            txtAuthorName.Text = "";
            txtIsbn.Text = "";
            txtQty.Text = "";
        }
    }
}