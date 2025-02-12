using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;
using System.Web.Configuration;

namespace AtThisPoint.Customers
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    // Retrieve the logged-in client's email or username
                    string loggedInUserEmail = User.Identity.Name.ToString(); // Assumes you are using the email as the identifier

                    // Initialize the dataset and table adapter for ClientDetails
                    DataSet1 DS = new DataSet1();
                    DataSet1TableAdapters.ClientDetailsTableAdapter clientDetailsAdapter = new DataSet1TableAdapters.ClientDetailsTableAdapter();
                    clientDetailsAdapter.Fill(DS.ClientDetails);

                    // Retrieve the specific client's data
                    var clientRecord = DS.ClientDetails.FirstOrDefault(client => client.EmailAddress == loggedInUserEmail);

                    if (clientRecord != null)
                    {
                        // Display the outstanding balance for the logged-in client
                        Label3.Text = clientRecord.Outstanding_Balance.ToString("c2");
                        clientIdLabel.Text = clientRecord.ClientID.ToString();
                    }
                    else
                    {
                        Label3.Text = "N/A";
                        clientIdLabel.Text = "No record";
                    }

                    // Initialize the dataset and table adapter for DataTable1
                    DataSet1TableAdapters.DataTable1TableAdapter dataTable1Adapter = new DataSet1TableAdapters.DataTable1TableAdapter();
                    dataTable1Adapter.Fill(DS.DataTable1);

                    // Retrieve the specific client's enrollment data
                    var clientRecor = DS.DataTable1.FirstOrDefault(client => client.EmailAddress == loggedInUserEmail);

                    if (clientRecor != null)
                    {
                        enrolementIdLabel.Text = clientRecor.EnrollmentID.ToString();
                    }
                    else
                    {
                        enrolementIdLabel.Text = "No enrollment record found.";
                    }

                    // Set the current date
                    dateTextBox.Text = DateTime.Now.ToShortDateString();
                }
            }
            catch (Exception)
            {
                // Show an error message if something goes wrong
                MessageLabel.Visible = true;
                MessageLabel.Text = "Please ensure that you are registered and enrolled before proceeding to payment.";
                MessageLabel.ForeColor = Color.Red;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            txtEmail.Text = User.Identity.Name.ToString();
            SqlDataSource1.SelectParameters["EmailAddress"].DefaultValue = txtEmail.Text;
            GridView1.DataBind();
            //    Label2.Text= GridView1.
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex== 0)
            {
                ccnoTextBox.Visible = true;
                dcnoTextBox.Visible = false;
                ccnoTextBox.BorderColor = Color.Green;
            }
            else
            {
                ccnoTextBox.Visible = false;

            }
            if (DropDownList1.SelectedIndex==1)
            {
                dcnoTextBox.Visible = true;
                ccnoTextBox.Visible = false;
                dcnoTextBox.BorderColor = Color.Blue;
            }
            else
            {
                dcnoTextBox.Visible = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSourceInsert.Insert();
                //SqlUpdate.Update();
                MessageLabel.Text = "You payment was successful";
                MessageLabel.ForeColor = Color.Green;
                MessageLabel.Visible = true;
            }
            catch (Exception)
            {

                MessageLabel.Text = "Payment Unsuccessful,please contact the main office for help";
                MessageLabel.ForeColor = Color.Red;
                MessageLabel.Visible = true;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int clientId;
            decimal amount;
           //  SqlUpdate.Update();
            if (int.TryParse(clientIdLabel.Text, out clientId) && decimal.TryParse(amntTextBox.Text, out amount))
            {
                if (amount >= 0) // Ensure the amount is valid
                {
                    UpdateOutstandingBalance(clientId, amount); 
                }
                else
                {
                    Response.Write("<script>alert('Amount cannot be negative!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid input! Please check your entries.');</script>");
            }
        }

        protected void UpdateOutstandingBalance(int clientId, decimal amount)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["G1Wst2024ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Update query to adjust the outstanding balance
                string query = @"
                UPDATE Clients
                SET OutstandingBalance = OutstandingBalance - @Amount
                WHERE ClientID = @ClientID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Amount", amount);
                    command.Parameters.AddWithValue("@ClientID", clientId);
                    
                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Outstanding balance updated successfully!');</script>");
                            
                            

                        }
                        else
                        {
                            Response.Write("<script>alert('No matching client found!');</script>");
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
                    }
                }
            }
        }


        /*   private void GetAmountDetails(string PaymentID)
           {
               string query = "SELECT * FROM Payment ";

               using (SqlConnection conn = new SqlConnection(ConnString))
               {
                   SqlCommand cmd = new SqlCommand(query, conn);
                   cmd.Parameters.AddWithValue("@Amount", amount);

                   conn.Open();
                   SqlDataAdapter reader = cmd.ExecuteReader();

                   if (reader.Read())
                   {
                       amt = reader["EmailAddress"].ToString();
                   }
               } 
           }*/



    }
}