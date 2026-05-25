using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;


namespace DataViz_Academy
{
    public partial class Login : System.Web.UI.Page
    {

        private DatabaseHandler db = new DatabaseHandler();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional check: If user is already logged in, skip auth screen
            if (!IsPostBack && Session["Role"] != null)
            {
                Response.Redirect("Profile.aspx");
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string username = loginName.Text.Trim();
            string password = loginPass.Text.Trim();
            string email = loginEmail.Text.Trim();

            DataTable userTable = db.LoginUser(username, password);

            string connstr = ConfigurationManager.ConnectionStrings["DataViz"].ConnectionString;

            string query = "SELECT Username, Email, PasswordHash, Role FROM [User] WHERE email = @email AND username = @username";

            using (SqlConnection conn = new SqlConnection(connstr))
            {
                using (SqlCommand comm = new SqlCommand(query, conn))
                {
                    try
                    {
                        conn.Open();
                        comm.Parameters.AddWithValue("@username", username);
                        comm.Parameters.AddWithValue("@email", email);
                        comm.Parameters.AddWithValue("@password", password);

                        //int count = (int)comm.ExecuteScalar();

                        SqlDataReader reader = comm.ExecuteReader();
                        if (reader.Read())
                        {
                            string storedHash = reader["PasswordHash"].ToString();
                            string userRole = reader["Role"].ToString();

                            if (VerifyPassword(password, storedHash))
                            {
                                Response.Write("Login Successful for Email " + reader["Email"].ToString());

                                //Session["Email"] = reader["Email"].ToString();
                                Session["Role"] = userRole;

                                Response.Redirect("Profile.aspx");
                            }
                            else { Response.Write("Login Failed"); }

                        }
                        else { Response.Write("Account not registered under that username"); }

                        conn.Close();
                        conn.Dispose();
                    }
                    catch (Exception ex)
                    {
                        // Safely print system exceptions for local debugging logs
                        Response.Write("Database connection exception encountered: " + ex.Message);
                    }
                }
            }

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            // Insert your registration SQL queries here.
        }

        private string ComputeHash(string rawHash)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawHash));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        private bool VerifyPassword(string inputPassword, string storedHash)
        {
            string computedInputHash = ComputeHash(inputPassword);
            return string.Equals(computedInputHash, storedHash, StringComparison.OrdinalIgnoreCase);
        }

    }
     
}