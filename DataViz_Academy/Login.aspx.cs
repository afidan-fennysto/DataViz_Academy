using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace DataViz_Academy
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUname.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connstr = ConfigurationManager.ConnectionStrings["DataViz"].ConnectionString;

            string query = "SELECT COUNT(*) FROM Students WHERE email=@email AND password=@password";

            using (SqlConnection conn = new SqlConnection(connstr))
            {
                using (SqlCommand comm = new SqlCommand(query, conn))
                {
                    comm.Parameters.AddWithValue("@email", username);
                    comm.Parameters.AddWithValue("@password", password);

                    conn.Open();
                    int count = (int)comm.ExecuteScalar();

                    if (count > 0)
                    {
                        Response.Write("Login Successful");
                    } else
                    {
                        Response.Write("Login Failed");
                    }

                    conn.Close();
                    conn.Dispose();

                }
            }


        }
    }
}