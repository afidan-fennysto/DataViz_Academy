using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataViz_Academy
{
    public partial class Forum : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindForumThreads();
            }
        }

        private void BindForumThreads()
        {
            // Simulating your thread datastore collection
            List<ForumThread> threads = new List<ForumThread>
            {
                new ForumThread
                {
                    ThreadId = 1,
                    Author = "Zetty Adleena",
                    TimeAgo = "3 days ago",
                    Title = "Color Palette Saturation Constraints",
                    Content = "Excessive reliance on raw primary saturation thresholds breaks accessible reading scales and user validation pathways.",
                    Votes = 40,
                    ImageUrl = "",
                    Comments = new List<ThreadComment>
                    {
                        new ThreadComment { Author = "Alif", CommentText = "Agreed, high contrast balancing helps when checking multi-tiered star schemas." }
                    }
                }
            };

            lvForumThreads.DataSource = threads;
            lvForumThreads.DataBind();
        }

        // Fired automatically for each row. Finds the inner repeater control and binds nested items.
        protected void lvForumThreads_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                // Extract the modern data blueprint instance
                ForumThread threadData = (ForumThread)e.Item.DataItem;

                // Drill into layout controls to resolve child elements safely
                Repeater rptComments = (Repeater)e.Item.FindControl("rptComments");
                if (rptComments != null)
                {
                    rptComments.DataSource = threadData.Comments;
                    rptComments.DataBind();
                }
            }
        }

        // Concrete server processing routine hook for handling modal input publishing
        protected void btnPublishThread_Click(object sender, EventArgs e)
        {
            string titleValue = txtModalTitle.Text.Trim();
            string contentValue = txtModalContent.Text.Trim();
            string finalSavedImageUrl = "";

            if (fileModalImage.HasFile)
            {
                try
                {
                    // Clean example to upload images straight onto your directory path securely
                    string filename = System.IO.Path.GetFileName(fileModalImage.FileName);
                    string targetFolder = "~/Uploads/";
                    string physicalPath = Server.MapPath(targetFolder + filename);

                    // Ensure the target directory physically exists on the disk architecture
                    System.IO.Directory.CreateDirectory(Server.MapPath(targetFolder));

                    fileModalImage.SaveAs(physicalPath);
                    finalSavedImageUrl = targetFolder + filename;
                }
                catch (Exception ex)
                {
                    // Handle logging infrastructure exceptions elegantly here
                }
            }

            // Execute database insertions or model state update commits right here...

            // Reset modal data clean states and reload the UI component states
            txtModalTitle.Text = "";
            txtModalContent.Text = "";
            BindForumThreads();
        }
    }

    // Strongly-typed Data Model blueprints
    public class ForumThread
    {
        public int ThreadId { get; set; }
        public string Author { get; set; }
        public string TimeAgo { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public int Votes { get; set; }
        public string ImageUrl { get; set; }
        public List<ThreadComment> Comments { get; set; }
    }

    public class ThreadComment
    {
        public string Author { get; set; }
        public string CommentText { get; set; }
    }
}