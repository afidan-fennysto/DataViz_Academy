using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataViz_Academy
{
    public partial class ZettyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Explicitly compiling structural list data via backend array streams
                string[] aedBullets = {
                "Architected a custom Power BI Customer Service Index (CSI) simulation framework, modernizing manual data gathering into automated corporate analytical assets.",
                "Presented complex operational performance trends to PMO leadership to support data-led process alignment."
            };
                bltAeroDarat.DataSource = aedBullets;
                bltAeroDarat.DataBind();

                string[] homeBullets = {
                "Manages granular performance tracking models, milestone charting, and structural progress metrics for KSSM and SPM Additional Mathematics students.",
                "Deconstructs complex algebraic structures and quantitative concepts into systematic logical frameworks to improve accuracy and optimize exam results."
            };
                bltHome.DataSource = homeBullets;
                bltHome.DataBind();
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string category = btn.CommandArgument;

            btnAll.CssClass = "filter-btn";
            btnTech.CssClass = "filter-btn";
            btnProj.CssClass = "filter-btn";
            btnLang.CssClass = "filter-btn";

            btn.CssClass = "filter-btn active";

            pnlTechnical.Visible = (category == "All" || category == "Tech");
            pnlProject.Visible = (category == "All" || category == "Proj");
            pnlLanguages.Visible = (category == "All" || category == "Lang");
        }
    }
}