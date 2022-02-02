using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

using Microsoft.AspNet.FriendlyUrls;

namespace AspNetProject_Jashim
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            RouteTable.Routes.EnableFriendlyUrls();

            // Code that runs on application startup
            //RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            FriendlyRoutes(RouteTable.Routes);
        }

        private void FriendlyRoutes(RouteCollection routes)
        {
            //Work to be done

            routes.MapPageRoute(
                routeName: "Librarian",
                routeUrl: "Content/{0}/Librarian",
                physicalFile: "~/Librarian/Login.aspx"
                );

             routes.MapPageRoute(
                    routeName: "Book",
                    routeUrl: "{0}/Student/{1}",
                    physicalFile: "~/Student/Books_Issued_To_Me.aspx"
                 );
            routes.MapPageRoute(
                routeName: "Display",
                routeUrl: "Content/Librarian",
                physicalFile: "~/Librarian/Display_Student_Info.aspx"
                );


            routes.MapPageRoute(
                routeName: "Student",
                routeUrl: "Student/",
                physicalFile: "~/Student/Student_Login.aspx"
                );

            //Default Routes
            routes.MapPageRoute(
                routeName: "Home",
                routeUrl: "",
                physicalFile: "~/Default.aspx"
                );
        }
    }
}