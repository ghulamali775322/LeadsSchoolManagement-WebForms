using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LSMS
{
    public partial class StaffSalary: Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["DB_ProConnectionString2"].ConnectionString;

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
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT StaffID, StaffName FROM StaffRegistration";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    ddlStaffName.Items.Clear();
                    ddlStaffName.Items.Add(new ListItem("--Select Staff Name--", ""));

                    while (reader.Read())
                    {
                        ddlStaffName.Items.Add(new ListItem(reader["StaffName"].ToString(), reader["StaffID"].ToString()));
                    }

                    conn.Close();
                }
            }
        }

        // Auto-fill staff ID and Salary when staff name is selected
        protected void ddlStaffName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlStaffName.SelectedValue))
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT StaffID, Salary FROM StaffRegistration WHERE StaffID = @StaffID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@StaffID", ddlStaffName.SelectedValue);
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            txtStaffID.Text = reader["StaffID"].ToString();
                            txtSalary.Text = reader["Salary"].ToString(); // Auto-fill salary
                        }
                        else
                        {
                            txtStaffID.Text = "";
                            txtSalary.Text = "";
                        }

                        conn.Close();
                    }
                }
            }
            else
            {
                txtStaffID.Text = "";
                txtSalary.Text = "";
            }
        }

        // Insert salary record into the database
        protected void btnSubmitSalary_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO dbo.StaffSalary (StaffID, StaffName, Salary, PaymentDate, PaymentMode, Status) " +
                                   "VALUES (@StaffID, @StaffName, @Salary, @PaymentDate, @PaymentMode, @Status)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@StaffID", txtStaffID.Text);
                        cmd.Parameters.AddWithValue("@StaffName", ddlStaffName.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@Salary", Convert.ToDecimal(txtSalary.Text));
                        cmd.Parameters.AddWithValue("@PaymentDate", Convert.ToDateTime(txtPaymentDate.Text));
                        cmd.Parameters.AddWithValue("@PaymentMode", ddlPaymentMode.SelectedValue);
                        cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);

                        try
                        {
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();

                            lblMessage.Text = "Salary record saved successfully!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;

                            // Clear fields
                            ClearFields();
                        }
                        catch (Exception ex)
                        {
                            lblMessage.Text = "Error: " + ex.Message;
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
            }
        }

        // Function to clear form fields
        private void ClearFields()
        {
            ddlStaffName.ClearSelection();
            txtStaffID.Text = "";
            txtSalary.Text = "";
            txtPaymentDate.Text = "";
            ddlPaymentMode.ClearSelection();
            ddlStatus.ClearSelection();
        }
    }
}