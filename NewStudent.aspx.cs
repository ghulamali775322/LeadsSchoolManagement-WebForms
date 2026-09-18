using System;
using System.Data.SqlClient;

namespace LSMS
{
    public partial class NewStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get form data
            string studentName = txtName.Text.Trim();
            string dob = txtDOB.Text.Trim();
            string gender = ddlGender.SelectedValue;
            string fatherName = txtFatherName.Text.Trim();
            string fatherCnic = txtFatherCNIC.Text.Trim();
            string cls = ddlClass.SelectedValue;

            if (cls == "--Select Class--" || cls == "")
            {
                lblMessage.Text = "Please select a valid class.";
                return;
            }

            string studentID = GenerateStudentID(cls); // Generate Student ID

            // Database connection string
            string cnstr = "Server=DESKTOP-8BL3MIG\\SQLEXPRESS01;initial catalog=DB_Pro;Integrated Security=True";
            string query = "INSERT INTO StudentRegistration (StudentID, StudentName, DOB, Gender, FatherName, FatherCnic, Class) " +
                           "VALUES (@StudentID, @StudentName, @DOB, @Gender, @FatherName, @FatherCnic, @Class)";

            using (SqlConnection connection = new SqlConnection(cnstr))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@StudentID", System.Data.SqlDbType.VarChar).Value = studentID;
                    command.Parameters.Add("@StudentName", System.Data.SqlDbType.VarChar).Value = studentName;
                    command.Parameters.Add("@DOB", System.Data.SqlDbType.Date).Value = dob;
                    command.Parameters.Add("@Gender", System.Data.SqlDbType.VarChar).Value = gender;
                    command.Parameters.Add("@FatherName", System.Data.SqlDbType.VarChar).Value = fatherName;
                    command.Parameters.Add("@FatherCnic", System.Data.SqlDbType.VarChar).Value = fatherCnic;
                    command.Parameters.Add("@Class", System.Data.SqlDbType.VarChar).Value = cls;

                    connection.Open();
                    int result = command.ExecuteNonQuery();

                    lblMessage.Text = result > 0 ? "Student Registered Successfully!" : "Error inserting data.";
                    if (result > 0)
                    {
                        ClearForm();
                    }
                }
            }
        }

        private string GenerateStudentID(string studentClass)
        {
            string newStudentID = "";
            string cnstr = "Server=DESKTOP-8BL3MIG\\SQLEXPRESS01;initial catalog=DB_Pro;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(cnstr))
            {
                connection.Open();
                string query = "SELECT MAX(StudentID) FROM StudentRegistration WHERE Class = @Class";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Class", studentClass);
                    object result = command.ExecuteScalar();

                    int lastNumber = 0;
                    if (result != DBNull.Value && result != null && result.ToString() != "")
                    {
                        string lastID = result.ToString();
                        string[] parts = lastID.Split('-');
                        if (parts.Length == 2 && int.TryParse(parts[1], out int parsedNumber))
                        {
                            lastNumber = parsedNumber;
                        }
                    }

                    lastNumber++;
                    newStudentID = $"{studentClass}-{lastNumber:D4}"; // Format: CLASS1-0001
                }
            }
            return newStudentID;
        }

        private void ClearForm()
        {
            txtName.Text = "";
            txtDOB.Text = "";
            ddlGender.SelectedIndex = 0;
            txtFatherName.Text = "";
            txtFatherCNIC.Text = "";
            ddlClass.SelectedIndex = 0;
        }
    }
}
