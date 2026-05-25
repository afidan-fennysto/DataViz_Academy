using System;
using System.Collections.Generic;
using System.Web.UI;

namespace DataViz_Academy
{
    public partial class Home : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Ensures data isn't wastefully rebound on page postbacks
            if (!IsPostBack)
            {
                BindFeatures();
            }
        }

        private void BindFeatures()
        {
            var featureList = new List<FeatureItem>
            {
                new FeatureItem
                {
                    Title = "Guided Modules",
                    Description = "Step-by-step documentation paired with localized assessment forms."
                },
                new FeatureItem
                {
                    Title = "Upvote Forum Channels",
                    Description = "Share chart layout snapshots, query metrics, and upvote insights."
                },
                new FeatureItem
                {
                    Title = "Gamified Badging",
                    Description = "Verify system competence parameters. Earn verification credentials."
                }
            };

            // Bind the dataset directly to your repeater control
            rptFeatures.DataSource = featureList;
            rptFeatures.DataBind();
        }
    }

    // A lightweight object blueprint for your dashboard items
    public class FeatureItem
    {
        public string Title { get; set; }
        public string Description { get; set; }
    }
}