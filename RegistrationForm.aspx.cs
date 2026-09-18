using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace LSMS
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text;
            string username = txtUsername.Text;
            string email = txtEmail.Text;
            string contactNumber = txtContactNumber.Text;
            string password = txtPassword.Text;
            string C_ps = txtConfirmPassword.Text;

            String cnstr = "Server=DESKTOP-8BL3MIG\\SQLEXPRESS01;initial catalog=DB_Pro;Integrated Security=true ";
            String query = " Insert into registration (Fullname,username,email,cn,passwod,con_passwod) values (@Fullname,@username,@email,@cn,@passwod,@con_passwod)";
            using (SqlConnection connection = new SqlConnection(cnstr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {

                    // Add parameters to prevent SQL injection
                    command.Parameters.AddWithValue("@Fullname", fullName);
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@cn", contactNumber);
                    command.Parameters.AddWithValue("@passwod", password);
                    command.Parameters.AddWithValue("@con_passwod", C_ps);



                    // Open the connection
                    connection.Open();

                    // Execute the query
                    int result = command.ExecuteNonQuery();

                    // Check result to see if the insert was successful
                    if (result > 0)
                    {
                        Response.Redirect("LoginForm.aspx");
                        // Optionally, you could redirect to another page or display a success message
                        lblMessage.Text=("Data inserted successfully.");
                    }
                    else
                    {
                        // Optionally, handle the error or display a message
                        lblMessage.Text=("Error inserting data.");
                    }
                }
            }
        }

        

        protected void txtConfirmPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}