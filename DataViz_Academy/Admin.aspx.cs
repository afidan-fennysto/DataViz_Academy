using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataViz_Academy
{
    public partial class Admin : System.Web.UI.Page
    {
        // Establish our data access pipeline instance layer handle
        private DatabaseHandler db = new DatabaseHandler();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Always enforce panel visibility on every load including postbacks
            if (Session["Role"] != null && Session["Role"].ToString().ToLower() == "admin")
            {
                pnlAdminGateLocked.Visible = false;
                pnlAdminGateUnlocked.Visible = true;

                if (!IsPostBack)
                {
                    LoadCoursesDirectory();
                }
            }
            else
            {
                pnlAdminGateLocked.Visible = true;
                pnlAdminGateUnlocked.Visible = false;
            }
        }

        private void LoadCoursesDirectory()
        {
            try
            {
                DataTable dtCourses = db.GetAllModules();

                if (dtCourses != null && dtCourses.Rows.Count > 0)
                {
                    gvAdminCourses.DataSource = dtCourses;
                    gvAdminCourses.DataBind();
                }
                else
                {
                    // Wipe bound caches if the repository contains zero records
                    gvAdminCourses.DataSource = null;
                    gvAdminCourses.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Staging fallback display box to gracefully capture connectivity errors
                Response.Write($"<script>alert('Data connection error trace: {ex.Message}');</script>");
            }
        }

        protected void AddModule_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNewTitle.Text)) return;

            bool success = db.Admin_CreateModule(
                txtNewTitle.Text.Trim(),
                txtNewDesc.Text.Trim(),
                txtNewCategory.Text.Trim(),
                txtNewUrl.Text.Trim()
            );

            if (success)
            {
                pnlAdminGateLocked.Visible = false;
                pnlAdminGateUnlocked.Visible = true;

                lblAddStatus.Text = "Module added successfully!";
                lblAddStatus.Visible = true;
                txtNewTitle.Text = txtNewDesc.Text = txtNewCategory.Text = txtNewUrl.Text = "";
                LoadCoursesDirectory();
            }
        }



        protected void UpdateModule_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUpdateId.Text))
            {
                lblUpdateStatus.Text = "DEBUG: txtUpdateId is empty!";
                lblUpdateStatus.Visible = true;
                return;
            }

            int moduleId = Convert.ToInt32(txtUpdateId.Text.Trim());

            lblUpdateStatus.Text = $"DEBUG: Trying to update ModuleID={moduleId}, Title={txtUpdateTitle.Text}";
            lblUpdateStatus.Visible = true;

            bool success = db.Admin_UpdateModule(
                moduleId,
                txtUpdateTitle.Text.Trim(),
                txtUpdateDesc.Text.Trim(),
                txtUpdateCategory.Text.Trim(),
                txtUpdateUrl.Text.Trim()
            );

            lblUpdateStatus.Text = $"DEBUG: success={success}, ModuleID={moduleId}";
            lblUpdateStatus.Visible = true;

            if (success)
            {
                pnlAdminGateLocked.Visible = false;
                pnlAdminGateUnlocked.Visible = true;
                lblUpdateStatus.Text = "Module updated successfully!";
                LoadCoursesDirectory();
            }
            else
            {
                lblUpdateStatus.Text = "Module failed to update! Check if Module ID exists.";
            }
        }

        protected void DeleteCourse_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int targetModuleId = Convert.ToInt32(btn.CommandArgument); // Securely intercepts the specific row ID string

            try
            {

                bool isDeleted = db.Admin_DeleteModule(targetModuleId);

                if (isDeleted)
                {
                    pnlAdminGateLocked.Visible = false;
                    pnlAdminGateUnlocked.Visible = true;

                    LoadCoursesDirectory();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", "alert('Transaction processing fault: Node could not be removed.');", true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ExceptionAlert", $"alert('Critical database exception sweep: {ex.Message}');", true);
            }
        }

        /*protected void InitiateCourseWizard_Click(object sender, EventArgs e)
        {
            // Leverages ClientScript to pop open the design CSS wizard layout smoothly on postback
            string popupModalScript = "var modal = document.getElementById('courseWizardModal'); if(modal) { modal.style.display = 'flex'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "LaunchWizardModal", popupModalScript, true);
        }*/
    }
}