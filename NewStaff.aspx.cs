using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Xml.Linq;

namespace LSMS
{
    public partial class NewStaff : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string staffName = txtStaffName.Text;
            string gender = ddlGender.SelectedValue;
            string dob = txtDOB.Text;
            string cnic = txtCNIC.Text;
            string phoneNumber = txtPhone.Text;
            string email = txtEmail.Text;
            string designation = ddlDesignation.SelectedValue;
            string qualification = txtQualification.Text;
            string joiningDate = txtJoiningDate.Text;
            string salary = txtSalary.Text;

            if (string.IsNullOrEmpty(staffName) || string.IsNullOrEmpty(gender) || string.IsNullOrEmpty(dob) ||
                string.IsNullOrEmpty(cnic) || string.IsNullOrEmpty(phoneNumber) || string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(designation) || string.IsNullOrEmpty(qualification) || string.IsNullOrEmpty(joiningDate) ||
                string.IsNullOrEmpty(salary))
            {
                lblMessage.Text = "Please fill all required fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["DB_ProConnectionString2"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO StaffRegistration (StaffName, Gender, DOB, CNIC, PhoneNumber, Email, Designation, Qualification, Salary,JoiningDate) " +
                               "VALUES (@StaffName, @Gender, @DOB, @CNIC, @PhoneNumber, @Email, @Designation, @Qualification, @Salary, @JoiningDate)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@StaffName", staffName);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@DOB", dob);
                    cmd.Parameters.AddWithValue("@CNIC", cnic);
                    cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Designation", designation);
                    cmd.Parameters.AddWithValue("@Qualification", qualification);
                    cmd.Parameters.AddWithValue("@Salary", salary);
                    cmd.Parameters.AddWithValue("@JoiningDate", joiningDate);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            lblMessage.Text = "Staff registered successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            ClearFields();
        }

        private void ClearFields()
        {
            txtStaffName.Text = "";
            ddlGender.SelectedIndex = 0;
            txtDOB.Text = "";
            txtCNIC.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            ddlDesignation.SelectedIndex = 0;
            txtQualification.Text = "";
            txtJoiningDate.Text = "";
            txtSalary.Text = "";
        }
    }
}
