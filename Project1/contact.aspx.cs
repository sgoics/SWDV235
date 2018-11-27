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
    public partial class contact : System.Web.UI.Page
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
                comm = new SqlCommand("exec InsertContact @contact_phone, @contact_country, @contact_type, @terms, @comments, @email", conn);
                comm.Parameters.Add("@email", System.Data.SqlDbType.VarChar, 50);
                comm.Parameters["@email"].Value = email.Text;
                comm.Parameters.Add("@contact_phone", System.Data.SqlDbType.VarChar, 20);
                comm.Parameters["@contact_phone"].Value = phone.Text;
                comm.Parameters.Add("@contact_country", System.Data.SqlDbType.NChar, 50);
                comm.Parameters["@contact_country"].Value = country.Text;
                comm.Parameters.Add("@contact_type", System.Data.SqlDbType.Int);
                comm.Parameters["@contact_type"].Value = Int32.Parse(prefferedContact.Text);
                comm.Parameters.Add("@terms", System.Data.SqlDbType.Int);
                comm.Parameters["@terms"].Value = terms.Checked ? 1 : 0;
                comm.Parameters.Add("@comments", System.Data.SqlDbType.VarChar, 250);
                comm.Parameters["@comments"].Value = comment.Text;


                // Enclose database code in Try-Catch-Finally
                try
                {
                    // Open the connection
                    conn.Open();
                    // Execute the command
                    comm.ExecuteNonQuery();
                    // Reload page if the query executed successfully
                    Response.Redirect("contact_thanks.html");
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
            email.Text = "";
            phone.Text = "";
            country.SelectedIndex = 0;
            prefferedContact.SelectedIndex = -1;
            terms.Checked = false;
            comment.Text = "";
            

        }
       
    }
}