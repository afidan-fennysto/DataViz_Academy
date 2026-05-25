using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataViz_Academy
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnZetty_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ZettyProfile.aspx");
        }

        protected void BtnRaif_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RaifProfile.aspx");
        }

        protected void BtnAlif_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AlifProfile.aspx");
        }

        protected void BtnAleeya_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AleeyaProfile.aspx");
        }

        protected void BtnAfi_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AfiProfile.aspx");
        }

    }
}