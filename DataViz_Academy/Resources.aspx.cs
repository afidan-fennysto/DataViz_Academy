using System;
using System.Collections.Generic;
using System.Web.UI;

namespace DataViz_Academy
{
    public partial class Resources : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only bind the data on the initial load, not on postbacks
            if (!IsPostBack)
            {
                BindResources();
            }
        }

        private void BindResources()
        {
            var resourceList = new List<ResourceItem>
            {
                new ResourceItem {
                    Badge = "JavaScript",
                    Title = "D3.js Graph Gallery",
                    Description = "Vanilla JavaScript framework blueprints and clean layout calculations.",
                    Url = "https://d3-graph-gallery.com/"
                },
                new ResourceItem {
                    Badge = "Data Science",
                    Title = "From Data to Viz",
                    Description = "An interactive decision tree linking precise dataset formats to layouts.",
                    Url = "https://www.data-to-viz.com/"
                },
                new ResourceItem {
                    Badge = "Python",
                    Title = "Python Graph Gallery",
                    Description = "Clean structural mapping guides useful for parsing multidimensional inputs.",
                    Url = "https://python-graph-gallery.com/"
                },
                new ResourceItem {
                    Badge = "Power BI",
                    Title = "Microsoft Power BI Documentation",
                    Description = "Official enterprise architecture guidelines for modeling DAX expressions and star schemas.",
                    Url = "https://learn.microsoft.com/en-us/power-bi/"
                },
                new ResourceItem {
                    Badge = "Tableau",
                    Title = "Tableau Knowledge Base",
                    Description = "Comprehensive dashboard formatting blueprints, Level of Detail (LOD) calculations, and optimization strategies.",
                    Url = "https://www.tableau.com/developer"
                }
            };

            // Bind the strongly-typed list to the Repeater control
            rptResources.DataSource = resourceList;
            rptResources.DataBind();
        }
    }

    // A simple, clean class to hold your resource data structure
    public class ResourceItem
    {
        public string Badge { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
    }
}