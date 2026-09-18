using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace LSMS
{
    public partial class StudentPromote : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["DB_ProConnectionString2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudentIDs();
            }
        }

        private void LoadStudentIDs()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT StudentID FROM StudentRegistration", conn);
                SqlDataReader reader = cmd.ExecuteReader();

                ddlStudentID.Items.Clear();
                ddlStudentID.Items.Add(new ListItem("--Select Student ID--", ""));
                while (reader.Read())
                {
                    ddlStudentID.Items.Add(new ListItem(reader["StudentID"].ToString(), reader["StudentID"].ToString()));
                }
                reader.Close();
            }
        }

        protected void ddlStudentID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlStudentID.SelectedValue))
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT StudentName, Class FROM StudentRegistration WHERE StudentID = @StudentID", conn);
                    cmd.Parameters.AddWithValue("@StudentID", ddlStudentID.SelectedValue);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblStudentName.Text = reader["StudentName"].ToString();
                        lblCurrentClass.Text = reader["Class"].ToString();
                    }
                    else
                    {
                        lblStudentName.Text = "Not Found";
                        lblCurrentClass.Text = "Not Found";
                    }
                    reader.Close();
                }
            }
            else
            {
                lblStudentName.Text = "Select a Student ID";
                lblCurrentClass.Text = "Select a Student ID";
            }
        }

        protected void btnPromote_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlStudentID.SelectedValue) && !string.IsNullOrEmpty(ddlPromoteTo.SelectedValue))
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO StudentPromotion (StudentID, StudentName, CurrentClass, PromoteTo, PromotionDate) VALUES (@StudentID, @StudentName, @CurrentClass, @PromoteTo, @PromotionDate)", conn);
                    cmd.Parameters.AddWithValue("@StudentID", ddlStudentID.SelectedValue);
                    cmd.Parameters.AddWithValue("@StudentName", lblStudentName.Text);
                    cmd.Parameters.AddWithValue("@CurrentClass", lblCurrentClass.Text);
                    cmd.Parameters.AddWithValue("@PromoteTo", ddlPromoteTo.SelectedValue);
                    cmd.Parameters.AddWithValue("@PromotionDate", txtPromotionDate.Text);

                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        SqlCommand updateCmd = new SqlCommand("UPDATE StudentRegistration SET Class = @PromoteTo WHERE StudentID = @StudentID", conn);
                        updateCmd.Parameters.AddWithValue("@StudentID", ddlStudentID.SelectedValue);
                        updateCmd.Parameters.AddWithValue("@PromoteTo", ddlPromoteTo.SelectedValue);
                        updateCmd.ExecuteNonQuery();

                        lblSuccess.Text = "Student promoted successfully!";
                        ClearFields();
                    }
                    else
                    {
                        lblSuccess.Text = "Promotion failed. Try again.";
                    }
                }
            }
            else
            {
                lblSuccess.Text = "Please select all required fields.";
            }
        }
        private void ClearFields()
        {
            ddlStudentID.SelectedIndex = 0;
            lblStudentName.Text = "";
            lblCurrentClass.Text = "";
            ddlPromoteTo.SelectedValue = "";
            txtPromotionDate.Text = "";
        }
    }
}