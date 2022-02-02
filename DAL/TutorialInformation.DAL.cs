using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


using System.Configuration;
using System.Data.SqlClient;
using AspNetProject_Jashim.Librarian;

namespace AspNetProject_Jashim.DAL
{
    public class TutorialInformation
    {
        public int CourseId { get; set; }

        public string CourseName { get; set; }

        public string CourseDuration { get; set; }
    }

    public class TutorialInformation_DAL
    {
        public static string cs = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;

        public static List<Course> GetAllCourses()
        {
            List<Course> listCourses = new List<Course>();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string qry = "SELECT * FROM Course";

                SqlCommand cmd = new SqlCommand(qry, con);
                con.Open();

                SqlDataReader sqlDataReader = cmd.ExecuteReader();

                while (sqlDataReader.Read())
                {
                    Course course = new Course();

                    course.CourseId = (int)sqlDataReader["CourseId"];
                    course.CourseName = (string)sqlDataReader["CourseName"];
                    course.CourseDuration = (string)sqlDataReader["CourseDuration"];

                    listCourses.Add(course);
                }
            }
            return listCourses;
        }

        public static int SaveCourse(string courseName, string courseDuration)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {


                string qry = "INSERT INTO Course(CourseName,CourseDuration) VALUES(@crsname, @crsdur)";

                SqlCommand cmd = new SqlCommand(qry, con);

                SqlParameter prmCourseName = new SqlParameter("@crsname", courseName);
                cmd.Parameters.Add(prmCourseName);

                SqlParameter prmCourseDuration = new SqlParameter("@crsdur", courseDuration);
                cmd.Parameters.Add(prmCourseDuration);
                con.Open();

                return cmd.ExecuteNonQuery();
            }

        }

        public static int UpdateCourse(int courseId, string courseName, string courseDuration)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string qry = "UPDATE Course SET CourseName =@crsname, CourseDuration = @crsdur WHERE CourseId=@crsid";

                SqlCommand cmd = new SqlCommand(qry, con);

                SqlParameter prmCourseId = new SqlParameter("@crsid", courseId);
                cmd.Parameters.Add(prmCourseId);

                SqlParameter prmCourseName = new SqlParameter("@crsname", courseName);
                cmd.Parameters.Add(prmCourseName);

                SqlParameter prmCourseDuration = new SqlParameter("@crsdur", courseDuration);
                cmd.Parameters.Add(prmCourseDuration);

                con.Open();

                return cmd.ExecuteNonQuery();
            }

        }


        public static int DeleteCourse(int courseId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string qry = "DELETE Course WHERE CourseId=@crsid";

                SqlCommand cmd = new SqlCommand(qry, con);

                SqlParameter prmCourseId = new SqlParameter("@crsid", courseId);
                cmd.Parameters.Add(prmCourseId); ;

                con.Open();

                return cmd.ExecuteNonQuery();
            }

        }
    }
}