using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace LSMS
{
    public partial class StaffAttendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStaffNames();
            }
        }

        // Load Staff Names into DropDownList
        private void LoadStaffNames()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DB_ProConnectionString2"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT StaffID, StaffName FROM StaffRegistration";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlStaffName.Items.Clear();
                    ddlStaffName.Items.Add(new ListItem("--Select Staff--", "")); // Default item
                    while (reader.Read())
                    {
                        ddlStaffName.Items.Add(new ListItem(reader["StaffName"].ToString(), reader["StaffID"].ToString()));
                    }
                    reader.Close();
                }
            }
        }

        // Auto-fill Staff ID & Designation when Staff is selected
        protected void ddlStaffName_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedStaffID = ddlStaffName.SelectedValue;

            if (!string.IsNullOrEmpty(selectedStaffID))
            {
                string connStr = ConfigurationManager.ConnectionStrings["DB_ProConnectionString2"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT StaffID, Designation FROM StaffRegistration WHERE StaffID = @StaffID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@StaffID", selectedStaffID);
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            txtStaffID.Text = reader["StaffID"].ToString();
                            txtDesignation.Text = reader["Designation"].ToString();
                        }
                        else
                        {
                            txtStaffID.Text = "";
                            txtDesignation.Text = "";
                        }
                        reader.Close();
                    }
                }
            }
            else
            {
                txtStaffID.Text = "";
                txtDesignation.Text = "";
            }
        }

        // Submit Attendance
        protected void btnSubmitAttendance_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlStaffName.SelectedValue))
            {
                lblMessage.Text = "Please select a staff member.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string staffID = txtStaffID.Text;
            string staffName = ddlStaffName.SelectedItem.Text;
            string designation = txtDesignation.Text; // Get the Designation
            string attendanceDate = txtAttendanceDate.Text;
            string status = ddlStatus.SelectedValue;

            if (string.IsNullOrEmpty(designation))
            {
                lblMessage.Text = "Error: Designation cannot be empty.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["DB_ProConnectionString2"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Check if attendance is already marked for this staff on the same date
                string checkQuery = "SELECT COUNT(*) FROM StaffAttendance WHERE StaffID = @StaffID AND AttendanceDate = @AttendanceDate";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@StaffID", staffID);
                    checkCmd.Parameters.AddWithValue("@AttendanceDate", attendanceDate);

                    int existingRecords = (int)checkCmd.ExecuteScalar();
                    if (existingRecords > 0)
                    {
                        lblMessage.Text = "Attendance for this staff member on the selected date has already been recorded.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }

                // Insert new attendance record including Designation
                string insertQuery = "INSERT INTO StaffAttendance (StaffID, StaffName, Designation, AttendanceDate, Status) " +
                                     "VALUES (@StaffID, @StaffName, @Designation, @AttendanceDate, @Status)";
                using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                {
                    insertCmd.Parameters.AddWithValue("@StaffID", staffID);
                    insertCmd.Parameters.AddWithValue("@StaffName", staffName);
                    insertCmd.Parameters.AddWithValue("@Designation", designation); // Now inserting Designation
                    insertCmd.Parameters.AddWithValue("@AttendanceDate", attendanceDate);
                    insertCmd.Parameters.AddWithValue("@Status", status);

                    int rowsAffected = insertCmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Attendance recorded successfully.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        ClearFields(); // Clear the form fields after successful submission
                    }
                    else
                    {
                        lblMessage.Text = "Error recording attendance.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        // Function to clear all fields after submission
        private void ClearFields()
        {
            ddlStaffName.SelectedIndex = 0;
            txtStaffID.Text = "";
            txtDesignation.Text = "";
            txtAttendanceDate.Text = "";
            ddlStatus.SelectedIndex = 0;
        }
    }
}