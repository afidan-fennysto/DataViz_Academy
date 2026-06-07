using System;
using System.Linq;
using System.Data;
using System.Security.Cryptography;
using System.Text;


namespace DataViz_Academy
{
    public partial class Login : System.Web.UI.Page
    {

        public DatabaseHandler db = new DatabaseHandler();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                
            }

            if (!IsPostBack && Session["Role"] != null)
            {
                Response.Redirect("Profile.aspx");
            }
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

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            // Capture inputs from the .aspx server controls
            string username = loginName.Text.Trim();
            string email = loginEmail.Text.Trim();
            string password = loginPass.Text.Trim();

            // Hash the user input password before sending it to the database query
            string hashedPassword = ComputeHash(password);

            // Call your friend's class. It runs the query safely and returns the data wrapped in a table
            DataTable userTable = db.LoginUser(username, email, hashedPassword);

            // HERE IS THE "LOGIN PROGRESS": Check if the database found a matching record row
            if (userTable != null && userTable.Rows.Count > 0)
            {
                DataRow userRow = userTable.Rows[0];

                Session["UserID"] = Convert.ToInt32(userRow["UserID"]);
                Session["Username"] = userRow["Username"].ToString();
                Session["Email"] = userRow["Email"].ToString();
                Session["Role"] = userRow["Role"].ToString();

                // Direct the authenticated user out of the gateway into their profile dashboard
                Response.Redirect("~/Profile.aspx");
            }
            else
            {
                lblLoginError.Text = "Login Failed: Invalid credentials or profile handles do not match.";
                lblLoginError.Visible = true;

            }

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string username = regName.Text.Trim();
            string email = regEmail.Text.Trim();
            string password = regPass.Text.Trim();

            // Validate APU email domain
            if (!email.EndsWith("@apu.edu.my") && !email.EndsWith("@mail.apu.edu.my"))
            {
                lblLoginError.Text = "Registration Failed: Must use an APU email address.";
                lblLoginError.Visible = true;
                return;
            }

            // Validate password: min 6 chars, 1 uppercase, 1 digit
            if (password.Length < 6 || !password.Any(char.IsUpper) || !password.Any(char.IsDigit))
            {
                lblLoginError.Text = "Registration Failed: Password must be ≥6 chars, include 1 uppercase and 1 number.";
                lblLoginError.Visible = true;
                return;
            }

            string hashedPassword = ComputeHash(password);
            bool success = db.RegisterUser(username, email, hashedPassword, "Member");

            if (success)
            {
                // Auto-login after registration
                Session["Username"] = username;
                Session["Email"] = email;
                Session["Role"] = "Member";
                Response.Redirect("~/Profile.aspx");
            }
            else
            {
                lblLoginError.Text = "Registration Failed: Email may already be registered.";
                lblLoginError.Visible = true;
            }
        }

    }
     
}