using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace LSMS
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = string.Empty;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Retrieve username and password from the form
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            String cnstr = "Server=DESKTOP-8BL3MIG\\SQLEXPRESS01;initial catalog=DB_Pro;Integrated Security=true ";
            String query = " select count(1) from registration where username=@username and passwod=@passwod ";
            using (SqlConnection connection = new SqlConnection(cnstr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {

                    // Add parameters to prevent SQL injection
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@passwod", password);


                    // Open the connection
                    connection.Open();

                    // Execute the query
                    object result = command.ExecuteScalar();
                    int userExists = (result == null) ? 0 : Convert.ToInt32(result);


                    // Check result to see if the insert was successful
                    if (userExists > 0)
                    {
                        // Optionally, you could redirect to another page or display a success message
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        // Optionally, handle the error or display a message
                        lblMessage.Text = ("wrong credentials ");
                    }
                }
            }


        }
 

        // Dummy authentication method (you should replace it with actual database verification)
        private bool AuthenticateAdmin(string username, string password)
        {
            // For demonstration, we're using hardcoded values.
            // Replace this with real database authentication logic.
            return username == "admin" && password == "admin123";
        }

        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {

        }
    }
}