using System;
using System.Configuration;
using System.Data.SqlClient;

namespace LSMS
{
    public partial class StaffDetails : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DB_ProConnectionString2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["StaffID"] != null)
                {
                    hfStaffID.Value = Request.QueryString["StaffID"];
                    LoadStaffDetails(Convert.ToInt32(hfStaffID.Value));
                }
            }
        }

        private void LoadStaffDetails(int staffID)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM StaffRegistration WHERE StaffID = @StaffID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StaffID", staffID);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtStaffName.Text = reader["StaffName"].ToString();
                    txtGender.Text = reader["Gender"].ToString();
                    txtDOB.Text = reader["DOB"].ToString();
                    txtCNIC.Text = reader["CNIC"].ToString();
                    txtPhoneNumber.Text = reader["PhoneNumber"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    txtDesignation.Text = reader["Designation"].ToString();
                    txtQualification.Text = reader["Qualification"].ToString();
                    txtSalary.Text = reader["Salary"].ToString();
                    txtJoiningDate.Text = reader["JoiningDate"].ToString();
                }
                conn.Close();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtStaffName.ReadOnly = false;
            txtGender.ReadOnly = false;
            txtDOB.ReadOnly = false;
            txtCNIC.ReadOnly = false;
            txtPhoneNumber.ReadOnly = false;
            txtEmail.ReadOnly = false;
            txtDesignation.ReadOnly = false;
            txtQualification.ReadOnly = false;
            txtSalary.ReadOnly = false;
            txtJoiningDate.ReadOnly = false;

            btnUpdate.Enabled = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE StaffRegistration SET StaffName=@StaffName, Gender=@Gender, DOB=@DOB, CNIC=@CNIC, PhoneNumber=@PhoneNumber, Email=@Email, Designation=@Designation, Qualification=@Qualification, Salary=@Salary, JoiningDate=@JoiningDate WHERE StaffID=@StaffID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StaffID", hfStaffID.Value);
                cmd.Parameters.AddWithValue("@StaffName", txtStaffName.Text);
                cmd.Parameters.AddWithValue("@Gender", txtGender.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@CNIC", txtCNIC.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text);
                cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text);
                cmd.Parameters.AddWithValue("@Salary", txtSalary.Text);
                cmd.Parameters.AddWithValue("@JoiningDate", txtJoiningDate.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM StaffRegistration WHERE StaffID=@StaffID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StaffID", hfStaffID.Value);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}
