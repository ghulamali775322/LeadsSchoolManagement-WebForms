using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace LSMS
{
    public partial class StaffsList : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStaffData();
            }
        }

        private void LoadStaffData()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DB_ProConnectionString2"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT StaffID, StaffName, Gender, Designation, PhoneNumber FROM StaffRegistration";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            gvStaffList.DataSource = dt;
                            gvStaffList.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions (log error or display message)
                    Response.Write("<script>alert('Error loading data: " + ex.Message + "');</script>");
                }
            }
        }
    }
}
