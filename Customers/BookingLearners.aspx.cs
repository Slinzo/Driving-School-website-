using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace AtThisPoint.Customers
{
    public partial class BookingLearners : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.VisibleDate = DateTime.Today;
            }
            Calendar1.DayRender += new DayRenderEventHandler(Calendar1_DayRender);

            if (!IsPostBack)
            {
                // Retrieve the logged-in client's email or username
                string loggedInUserEmail = User.Identity.Name.ToString(); // Assumes you are using the email as the identifier

                // Initialize the dataset and table adapter
                DataSet1 DS = new DataSet1();
                DataSet1TableAdapters.LearnersBookingTableAdapter TA = new DataSet1TableAdapters.LearnersBookingTableAdapter();

                // Fill the dataset with client details
                TA.Fill(DS.LearnersBooking);

                // Retrieve the specific client's data using LINQ or other logic
                var clientRecord = DS.LearnersBooking.FirstOrDefault(client => client.EmailAddress == loggedInUserEmail);

                if (clientRecord != null)
                {
                    // Display the outstanding balance for the logged-in client
                    Label1.Text = clientRecord.BookingDate.ToShortDateString();
                    InstructorLabel.Text = clientRecord.FirstName.ToString();
                    TimeLabel.Text = clientRecord.TimeSlot.ToString();
                }
                else
                {
                    Label1.Text = "No Booking date found";
                    InstructorLabel.Text = "No Booked instructor found";
                    TimeLabel.Text = "No Booked Time-Slot";

                }
                if (!IsPostBack)
                {
                    // Retrieve the logged-in client's email or username
                    string loggedInUserEmal = User.Identity.Name.ToString(); // Assumes you are using the email as the identifier

                    // Initialize the dataset and table adapter
                    DataSet1 D = new DataSet1();
                    DataSet1TableAdapters.DataTable1TableAdapter T = new DataSet1TableAdapters.DataTable1TableAdapter();

                    // Fill the dataset with client details
                    T.Fill(D.DataTable1);

                    // Retrieve the specific client's data using LINQ or other logic
                    var clientRecor = D.DataTable1.FirstOrDefault(client => client.EmailAddress == loggedInUserEmal);

                    if (clientRecor != null)
                    {
                        // Display the outstanding balance for the logged-in client
                        EnrollmentIDlabel.Text = clientRecor.EnrollmentID.ToString();
                        ClientIDlabel.Text = clientRecor.ClientID.ToString();
                        BookingCountlabel.Text = clientRecor.Duration.ToString();
                    }
                    else
                    {
                        BookingCountlabel.Text = "Eish Boy";
                        ClientIDlabel.Text = "Singaphansi Boy";
                    }
                }

            }   
        
        }
        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            // Disable dates up to and including today
            if (e.Day.Date <= DateTime.Today)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.LightGray; // Set greyed-out appearance
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataInsert.Insert();
                MessageLabel.Text = "Booking successful 🚗💨";
                MessageLabel.ForeColor = Color.Green;
                MessageLabel.Visible = true;
            }
            catch (Exception)
            {

                MessageLabel.ForeColor = Color.Red;
                MessageLabel.Text = "Booking was unsuccessful, please ensure all required fields are selected 🚗💥";
                MessageLabel.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            CancelBookingLabel.Visible = true;
            
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}