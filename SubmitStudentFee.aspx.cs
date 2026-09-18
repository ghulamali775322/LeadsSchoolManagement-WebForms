using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LSMS
{
    public partial class SubmitStudentFee : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudentIDs();
            }
        }

        // Method to load Student IDs into dropdown
        private void LoadStudentIDs()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DB_ProConnectionString2"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT StudentID FROM StudentRegistration";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlStudentID.Items.Clear();
                    ddlStudentID.Items.Add(new ListItem("--Select Student ID--", ""));

                    while (reader.Read())
                    {
                        ddlStudentID.Items.Add(new ListItem(reader["StudentID"].ToString(), reader["StudentID"].ToString()));
                    }
                    conn.Close();
                }
            }
        }

        // Event to auto-fill Student Name and Class based on Student ID selection
        protected void ddlStudentID_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedID = ddlStudentID.SelectedValue;

            if (!string.IsNullOrEmpty(selectedID))
            {
                string connStr = ConfigurationManager.ConnectionStrings["DB_ProConnectionString2"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT StudentName, Class FROM StudentRegistration WHERE StudentID = @StudentID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@StudentID", selectedID);
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            txtStudentName.Text = reader["StudentName"].ToString();
                            txtStudentClass.Text = reader["Class"].ToString();  // Retrieve Student Class
                        }
                        else
                        {
                            txtStudentName.Text = "";
                            txtStudentClass.Text = "";
                        }
                        conn.Close();
                    }
                }
            }
            else
            {
                txtStudentName.Text = "";
                txtStudentClass.Text = "";
            }
        }

        // Method to submit fee details
        protected void btnSubmitFee_Click(object sender, EventArgs e)
        {
            string studentID = ddlStudentID.SelectedValue;
            string studentName = txtStudentName.Text;
            string studentClass = txtStudentClass.Text;  // Get Student Class
            string feeAmount = txtFeeAmount.Text;
            string paymentDate = txtPaymentDate.Text;
            string paymentMethod = ddlPaymentMethod.SelectedValue;

            if (string.IsNullOrEmpty(studentID) || string.IsNullOrEmpty(studentClass) || string.IsNullOrEmpty(feeAmount) || string.IsNullOrEmpty(paymentDate) || string.IsNullOrEmpty(paymentMethod))
            {
                lblMessage.Text = "Please fill all required fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["DB_ProConnectionString2"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO StudentFee (StudentID, StudentName, StudentClass, FeeAmount, PaymentDate, PaymentMethod) " +
                               "VALUES (@StudentID, @StudentName, @StudentClass, @FeeAmount, @PaymentDate, @PaymentMethod)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StudentID", studentID);
                    cmd.Parameters.AddWithValue("@StudentName", studentName);
                    cmd.Parameters.AddWithValue("@StudentClass", studentClass);  // Added StudentClass field
                    cmd.Parameters.AddWithValue("@FeeAmount", feeAmount);
                    cmd.Parameters.AddWithValue("@PaymentDate", paymentDate);
                    cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            lblMessage.Text = "Fee submitted successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            ClearFields();
        }

        // Method to clear form fields after submission
        private void ClearFields()
        {
            ddlStudentID.SelectedIndex = 0;
            txtStudentName.Text = "";
            txtStudentClass.Text = "";  // Reset Student Class field
            txtFeeAmount.Text = "";
            txtPaymentDate.Text = "";
            ddlPaymentMethod.SelectedIndex = 0;
        }
    }
}