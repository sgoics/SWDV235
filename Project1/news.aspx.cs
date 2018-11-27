using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Project1
{
    public partial class news : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
        protected void submitButton_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {

                // Code that uses the data entered by the user
                // Define data objects
                SqlConnection conn;
                SqlCommand comm;
                // Read the connection string from Web.config
                string connectionString =
                    ConfigurationManager.ConnectionStrings["roadTrip"].ConnectionString;
                // Initialize connection
                conn = new SqlConnection(connectionString);
                // Create command 
                comm = new SqlCommand("EXEC InsertVisitor @visitor_email, @visitor_fName", conn);
                comm.Parameters.Add("@visitor_email", System.Data.SqlDbType.NChar, 50);
                comm.Parameters["@visitor_email"].Value = visitor_email.Text;
                comm.Parameters.Add("@visitor_fName", System.Data.SqlDbType.NChar, 50);
                comm.Parameters["@visitor_fName"].Value = visitor_fName.Text;
                
                // Enclose database code in Try-Catch-Finally
                try
                {
                    // Open the connection
                    conn.Open();
                    // Execute the command
                    comm.ExecuteNonQuery();
                    // Reload page if the query executed successfully
                    Response.Redirect("join.html");
                }
                catch (SqlException ex)
                {
                    // Display error message
                    dbErrorMessage.Text = "Error submitting the data!" + ex.Message.ToString();

                }
                finally
                {
                    // Close the connection
                    conn.Close();
                }
            }

        }

        protected void resetButton_Click(object sender, EventArgs e)
        {
            visitor_email.Text = "";
            visitor_fName.Text = "";
        }

    }
}
    
