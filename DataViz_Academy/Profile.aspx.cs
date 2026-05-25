using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataViz_Academy
{
    public partial class Profile : System.Web.UI.Page
    {
        // Instantiating your existing architectural asset class
        private DatabaseHandler db = new DatabaseHandler();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Simple tracking baseline token hook. Sync this to your Auth system session string later.
                if (Session["Role"] == null)
                {
                    Response.Redirect("Auth.aspx");
                }

                LoadDashboardView();
            }
        }

        private void LoadDashboardView()
        {
            if (Session["Email"] == null) return;
            string currentEmail = Session["Email"].ToString();

            // 1. POPULATE IDENTITY RECORDS
            DataTable dtUser = db.GetUserProfile(currentEmail);
            if (dtUser.Rows.Count > 0)
            {
                DataRow userRow = dtUser.Rows[0];
                string name = userRow["Username"].ToString();
                string email = userRow["Email"].ToString();

                lblDashAccountName.Text = name;
                lblDashAccountEmail.Text = email;
                txtEditProfileName.Text = name;
                txtEditProfileEmail.Text = email;

                // Set dynamic text initial letter fallback frame
                litAvatarTarget.Text = !string.IsNullOrEmpty(name) ? name.Substring(0, 1).ToUpper() : "U";

            }

            // 2. POPULATE BADGES INFORMATION
            /*DataTable dtBadges = db.GetUserBadges(currentEmail);

            lblBadgeCountDisplay.Text = dtBadges.Rows.Count.ToString();
            lblPassedQuestions.Text = (dtBadges.Rows.Count * 3).ToString();

            gvBadges.DataSource = dtBadges;
            gvBadges.DataBind();*/
        }

        protected void BtnCommitChanges_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && Session["Email"] != null)
            {
                string oldEmail = Session["Email"].ToString();
                string newName = txtEditProfileName.Text.Trim();
                string newEmail = txtEditProfileEmail.Text.Trim();

                // Save parameters cleanly to database
                db.UpdateUserProfile(oldEmail, newName, newEmail);

                // Remap session context tracking parameters to stay synced if email changes
                Session["Email"] = newEmail;

                // Re-fetch records completely to cleanly render labels
                LoadDashboardView();
            }
        }

        protected void BtnResetData_Click(object sender, EventArgs e)
        {
            if (Session["Email"] == null) return;
            string currentEmail = Session["Email"].ToString();

            // Execute reset transactions through your CRUD layer
            db.ResetProfileData(currentEmail);

            // Reload visual parameters completely
            LoadDashboardView();
        }

    }
}