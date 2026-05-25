using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataViz_Academy
{
    public partial class Admin : System.Web.UI.Page
    {
        // Leverage your existing DatabaseHandler class
        private DatabaseHandler db = new DatabaseHandler();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verify if a token session exists and matches our privileged admin credential scale
                if (Session["Role"] != null && Session["Role"].ToString().ToLower() == "admin")
                {
                    pnlAdminGateLocked.Visible = false;
                    pnlAdminGateUnlocked.Visible = true;
                    LoadCoursesDirectory();
                }
                else
                {
                    // Secure fallback execution path: lock view down completely
                    pnlAdminGateLocked.Visible = true;
                    pnlAdminGateUnlocked.Visible = false;
                }
            }
        }

        private void LoadCoursesDirectory()
        {
            // You can implement custom repository selectors inside your DatabaseHandler later
            // For now, we fetch your database tables cleanly to populate our GridView
            // Example stub using forum lists as data structure schema placeholder:
            DataTable dtCourses = db.GetAllForumPosts();

            // Or if you have a specific method ready: gvAdminCourses.DataSource = db.GetAllCourses();
            gvAdminCourses.DataSource = dtCourses;
            gvAdminCourses.DataBind();
        }

        protected void DeleteCourse_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string courseId = btn.CommandArgument;

            // Execute delete transaction pipeline logic here:
            // db.DeleteCourse(courseId);

            // Re-render dataset matrix indicators instantly
            LoadCoursesDirectory();
        }
    }
}