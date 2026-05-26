using System;
using System.Web.UI;

namespace DataViz_Academy
{
    // THE CRITICAL FIX: Added ": System.Web.UI.Page" so the front-end recognizes it!
    public partial class AlifProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void lnkBackToAbout_Click(object sender, EventArgs e)
        {
            // Root-relative path jump token to bypass folder nesting crashes safely
            Response.Redirect("~/About.aspx");
        }
    }
}