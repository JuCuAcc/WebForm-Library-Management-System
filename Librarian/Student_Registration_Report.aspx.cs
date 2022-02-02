using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;


using System.Net;
using System.IO;
namespace AspNetProject_Jashim.Librarian
{
    public partial class Student_Registration_Report : System.Web.UI.Page
    {

        string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        Student_Registration_Report rpt;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["report"] != null)
            //{
            //    CrystalReportViewer1.ReportSource = (Student_Registration_Report)Session["report"];

            //}

        }

        protected void Page_Init(object sender, EventArgs e)
        {

            if (Session["report"] != null)
            {
                CrystalReportViewer1.ReportSource = (Student_Registration_Report)Session["report"];
            }
        }

        protected void btnShowReport_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(cs))
            {
                StudentTableAdapters.Student_RegistrationTableAdapter da = new StudentTableAdapters.Student_RegistrationTableAdapter();
                Student ds = new Student();
                Student.Student_RegistrationDataTable dt = (Student.Student_RegistrationDataTable)
                ds.Tables["Student_Registration"];
                da.Fill(dt);
                rpt = new Student_Registration_Report();

                rpt.SetDataSource(ds);
                CrystalReportViewer1.ReportSource = rpt;
                Session.Add("report", rpt);

            }
        }

        private void SetDataSource(Student ds)
        {
            throw new NotImplementedException();
        }
    }
}
