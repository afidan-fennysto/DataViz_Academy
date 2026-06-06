using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataViz_Academy
{
    public partial class Site : System.Web.UI.MasterPage
    {
        private DatabaseHandler db = new DatabaseHandler();

        protected void Page_Load(object sender, EventArgs e)
        {
            ConfigureNavigationRoleGates();
        }

        private void ConfigureNavigationRoleGates()
        {
            // Fallback: If no user session token is found, treat as guest state lines
            if (Session["Role"] == null)
            {
                // 1. GUEST ACCESS STATE
                menuDashboard.Visible = false;   // Hides the dashboard list item entirely
                menuAdminPanel.Visible = false;  // Hides the admin list item entirely
            }
            else
            {
                string runningUserRole = Session["Role"].ToString().ToLower();

                if (runningUserRole == "admin")
                {
                    // 2. PRIVILEGED MASTER ADMIN STATE
                    menuDashboard.Visible = true;
                    menuAdminPanel.Visible = true;   // Admin sees everything
                }
                else
                {
                    // 3. REGULAR VALIDATED MEMBER / STUDENT STATE
                    menuDashboard.Visible = true;    // Students view their own profile logs
                    menuAdminPanel.Visible = false;  // Students are safely blocked from admin tooling
                }
            }
        }

        //This is for forum
        protected void BtnSubmitPost_Click(object sender, EventArgs e)
        {
            // Security verification: verify the user session exists before processing data
            if (Session["Username"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Anonymous posts blocked. Please authenticate.');", true);
                return;
            }

            if (Session["UserID"] == null) { /* block post */ }
            int currentUserId = Convert.ToInt32(Session["UserID"]);
            string topicText = txtForumTopic.Text.Trim();
            string contentText = txtForumContent.Text.Trim();

            // Forum not implemented yet
            /*bool isSaved = db.CreateForumPost(currentUserId, topicText, contentText);

            if (isSaved)
            {
                // Clear out input values on success
                txtForumTopic.Text = "";
                txtForumContent.Text = "";

                // Refresh the current page view to display the new post record instantly
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Failed to register transaction database sync.');", true);
            }*/
        }

        //Logout
        protected void LnkLogout_Click(object sender, EventArgs e)
        {
            // Abandon the current runtime state, clear session attributes, and return to auth gateway. Similar to close and dispose
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Auth.aspx");
        }

    }
}