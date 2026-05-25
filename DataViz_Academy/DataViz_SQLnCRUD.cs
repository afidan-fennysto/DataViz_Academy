using System;
using System.Data;
using System.Data.SqlClient;

public class DatabaseHandler
{
    // Using |DataDirectory| makes the project portable across different computers
    private readonly string _connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DatavizBase.mdf;Integrated Security=True;";

    // Helper method to get an open connection safely
    private SqlConnection GetConnection()
    {
        SqlConnection conn = new SqlConnection(_connectionString);
        if (conn.State != ConnectionState.Open)
        {
            conn.Open();
        }
        return conn;
    }

    // FLOW 1: AUTHENTICATION & MEMBERSHIP


    // Added so Guests can register an account
    public bool RegisterUser(string username, string email, string passwordHash, string role)
    {
        using (SqlConnection conn = GetConnection())
        {
            string query = "INSERT INTO [User] (Username, Email, PasswordHash, Role) VALUES (@Username, @Email, @PasswordHash, @Role)";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PasswordHash", passwordHash);
                cmd.Parameters.AddWithValue("@Role", role);
                return cmd.ExecuteNonQuery() > 0;
            }
        }
    }

    public DataTable LoginUser(string username, string email, string passwordHash)
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = GetConnection())
        {
            string query = "SELECT UserID, Username, Email, Role FROM [User] WHERE Username = @Username AND Email = @Email AND PasswordHash = @PasswordHash";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PasswordHash", passwordHash);
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    adapter.Fill(dt);
                }
            }
        }
        return dt;
    }

    // FLOW 2: LEARNING MODULES & PROGRESS TRACKING
    public DataTable GetAllModules()
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = GetConnection())
        {
            string query = "SELECT ModuleID, Title, Description, Category, ContentURL FROM Module";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
            {
                adapter.Fill(dt);
            }
        }
        return dt;
    }

    public bool Admin_CreateModule(string title, string description, string category, string contentUrl)
    {
        using (SqlConnection conn = GetConnection())
        {
            string query = "INSERT INTO Module (Title, Description, Category, ContentURL) VALUES (@Title, @Description, @Category, @ContentURL)";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Description", (object)description ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@ContentURL", contentUrl);
                return cmd.ExecuteNonQuery() > 0;
            }
        }
    }

    public bool Admin_DeleteModule(int moduleId)
    {
        using (SqlConnection conn = GetConnection())
        {
            string query = "DELETE FROM Module WHERE ModuleID = @ModuleID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@ModuleID", moduleId);
                return cmd.ExecuteNonQuery() > 0;
            }
        }
    }

    // Updates student quiz scores and dashboard tracking data
    public bool UpdateUserProgress(int userId, int moduleId, decimal score, string status, int percentage)
    {
        using (SqlConnection conn = GetConnection())
        {
            string query = @"IF EXISTS (SELECT 1 FROM UserProgress WHERE UserID = @UserID AND ModuleID = @ModuleID)
                                UPDATE UserProgress SET Score = @Score, CompletionStatus = @Status, ProgressionPercentage = @Percentage WHERE UserID = @UserID AND ModuleID = @ModuleID
                             ELSE
                                INSERT INTO UserProgress (UserID, ModuleID, Score, CompletionStatus, ProgressionPercentage) VALUES (@UserID, @ModuleID, @Score, @Status, @Percentage)";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@ModuleID", moduleId);
                cmd.Parameters.AddWithValue("@Score", score);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@Percentage", percentage);
                return cmd.ExecuteNonQuery() > 0;
            }
        }
    }

    // FLOW 3: PORTFOLIO / VISUALIZATION CRUD

    public bool Member_CreateVisualization(int userId, string title, string toolUse, string imageUrl)
    {
        using (SqlConnection conn = GetConnection())
        {
            string query = "INSERT INTO Visualization (UserID, Title, ToolUse, ImageURL, Modified) VALUES (@UserID, @Title, @ToolUse, @ImageURL, GETDATE())";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@ToolUse", toolUse);
                cmd.Parameters.AddWithValue("@ImageURL", (object)imageUrl ?? DBNull.Value);
                return cmd.ExecuteNonQuery() > 0;
            }
        }
    }

    // Added Update capability for portfolio entries
    public bool Member_UpdateVisualization(int vizId, int userId, string title, string toolUse, string imageUrl)
    {
        using (SqlConnection conn = GetConnection())
        {
            string query = "UPDATE Visualization SET Title = @Title, ToolUse = @ToolUse, ImageURL = @ImageURL, Modified = GETDATE() WHERE VizID = @VizID AND UserID = @UserID";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@VizID", vizId);
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@ToolUse", toolUse);
                cmd.Parameters.AddWithValue("@ImageURL", (object)imageUrl ?? DBNull.Value);
                return cmd.ExecuteNonQuery() > 0;
            }
        }
    }

    public bool DeleteVisualization(int vizId, int userId, string actorRole)
    {
        using (SqlConnection conn = GetConnection())
        {
            string query;
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            if (actorRole == "Admin")
            {
                query = "DELETE FROM Visualization WHERE VizID = @VizID";
            }
            else
            {
                query = "DELETE FROM Visualization WHERE VizID = @VizID AND UserID = @UserID";
                cmd.Parameters.AddWithValue("@UserID", userId);
            }

            cmd.CommandText = query;
            cmd.Parameters.AddWithValue("@VizID", vizId);
            return cmd.ExecuteNonQuery() > 0;
        }
    }

    // PORTFOLIO READ OPERATOR (For Gallery Display)
    public DataTable GetAllVisualizations()
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = GetConnection())
        {
            // Pulls all student projects to populate the shared Community Gallery
            string query = "SELECT VizID, UserID, Title, ToolUse, ImageURL, Modified FROM Visualization ORDER BY Modified DESC";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
            {
                adapter.Fill(dt);
            }
        }
        return dt;
    }

    // COMMUNITY FORUM FLOW (Create & Read operations)

    // Allows Members to post a new question or topic
    public bool CreateForumPost(int userId, string topic, string content)
    {
        using (SqlConnection conn = GetConnection())
        {
            string query = "INSERT INTO ForumPost (UserID, Topic, Content, Timestamp) VALUES (@UserID, @Topic, @Content, GETDATE())";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@Topic", topic);
                cmd.Parameters.AddWithValue("@Content", content);
                return cmd.ExecuteNonQuery() > 0;
            }
        }
    }

    // Displays the active forum stream for Guests, Members, and Admins alike
    public DataTable GetAllForumPosts()
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = GetConnection())
        {
            string query = @"SELECT f.PostID, u.Username, f.Topic, f.Content, f.Timestamp 
                            FROM ForumPost f 
                            JOIN [User] u ON f.UserID = u.UserID 
                            ORDER BY f.Timestamp DESC";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
            {
                adapter.Fill(dt);
            }
        }
        return dt;
    }

    // Fetch user detail row cleanly based on their unique tracking identifier
    public DataTable GetUserProfile(string email)
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = GetConnection()) // Uses your safe open method
        {
            // Adjust column names (Username, Email, AccentColor) if your [User] schema varies slightly
            string query = "SELECT Username, Email FROM [user] WHERE Email = @Email";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    adapter.Fill(dt);
                }
            }
        }
        return dt;
    }

    // Fetch all collected badges mapped directly to this student account
    /*public DataTable GetUserBadges(string email)
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = GetConnection())
        {
            string query = "SELECT BadgeName, ColorAccent FROM UserBadges WHERE StudentEmail = @Email";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    adapter.Fill(dt);
                }
            }
        }
        return dt;
    }*/

    // Updates student quiz scores and awards badges dynamically upon module completion
    public bool UpdateUserProgress(int userId, int moduleId, decimal score, string status, int percentage)
    {
        using (SqlConnection conn = GetConnection())
        {
            // 1. Update or Insert the progression log record
            string progressQuery = @"IF EXISTS (SELECT 1 FROM UserProgress WHERE UserID = @UserID AND ModuleID = @ModuleID)
                                    UPDATE UserProgress SET Score = @Score, CompletionStatus = @Status, ProgressionPercentage = @Percentage WHERE UserID = @UserID AND ModuleID = @ModuleID
                                 ELSE
                                    INSERT INTO UserProgress (UserID, ModuleID, Score, CompletionStatus, ProgressionPercentage) VALUES (@UserID, @ModuleID, @Score, @Status, @Percentage);";

            using (SqlCommand cmd = new SqlCommand(progressQuery, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@ModuleID", moduleId);
                cmd.Parameters.AddWithValue("@Score", score);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@Percentage", percentage);

                cmd.ExecuteNonQuery();
            }

            // 2. AUTOMATIC BADGE CHECK: If the module is finished, award the badge immediately!
            if (status.Equals("Completed", StringComparison.OrdinalIgnoreCase))
            {
                // This query inserts a badge record only if the user hasn't already earned it
                string badgeQuery = @"INSERT INTO UserBadge (UserID, BadgeID)
                                  SELECT @UserID, BadgeID 
                                  FROM Badge 
                                  WHERE ModuleID = @ModuleID
                                  AND NOT EXISTS (
                                      SELECT 1 FROM UserBadge ub 
                                      JOIN Badge b ON ub.BadgeID = b.BadgeID 
                                      WHERE ub.UserID = @UserID AND b.ModuleID = @ModuleID
                                  );";

                using (SqlCommand badgeCmd = new SqlCommand(badgeQuery, conn))
                {
                    badgeCmd.Parameters.AddWithValue("@UserID", userId);
                    badgeCmd.Parameters.AddWithValue("@ModuleID", moduleId);
                    badgeCmd.ExecuteNonQuery(); // Executes quietly in the background
                }
            }
        }
        return true;
    }

    // Call this to display all earned badges on the Member Profile Page!
    public DataTable GetUserBadges(int userId)
    {
        DataTable dt = new DataTable();
        using (SqlConnection conn = GetConnection())
        {
            string query = @"SELECT b.BadgeName, b.Description, b.IconURL, ub.DateEarned 
                        FROM UserBadge ub
                        JOIN Badge b ON ub.BadgeID = b.BadgeID
                        WHERE ub.UserID = @UserID
                        ORDER BY ub.DateEarned DESC";

            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@UserID", userId);
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    adapter.Fill(dt);
                }
            }
        }
        return dt;
    }

    // Update primary profile texts inside the relational dataset
    public bool UpdateUserProfile(string oldEmail, string newName, string newEmail)
    {
        using (SqlConnection conn = GetConnection())
        {
            string query = "UPDATE [User] SET Username = @Username, Email = @NewEmail WHERE Email = @OldEmail";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Username", newName);
                cmd.Parameters.AddWithValue("@NewEmail", newEmail);
                cmd.Parameters.AddWithValue("@OldEmail", oldEmail);
                return cmd.ExecuteNonQuery() > 0;
            }
        }
    }

    // Wipe tracking markers to reset system flow fields back to layout baselines
    public void ResetProfileData(string email)
    {
        using (SqlConnection conn = GetConnection())
        {
            string query1 = "UPDATE [User] SET Username = '' WHERE Email = @Email";
            using (SqlCommand cmd = new SqlCommand(query1, conn))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.ExecuteNonQuery();
            }

            //string query2 = "DELETE FROM UserBadges WHERE StudentEmail = @Email";
            //using (SqlCommand cmd = new SqlCommand(query2, conn))
            //{
                //cmd.Parameters.AddWithValue("@Email", email);
                //cmd.ExecuteNonQuery();
            //}
        }
    }


}