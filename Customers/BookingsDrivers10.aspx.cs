using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace AtThisPoint.Customers
{
    public partial class BookingsDrivers10 : System.Web.UI.Page
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
                DataSet1TableAdapters.DriversBookingTableAdapter TA = new DataSet1TableAdapters.DriversBookingTableAdapter();

                // Fill the dataset with client details
                TA.Fill(DS.DriversBooking);

                // Retrieve the specific client's data using LINQ or other logic
                var clientRecord = DS.DriversBooking.FirstOrDefault(client => client.EmailAddress == loggedInUserEmail);

                if (clientRecord != null)
                {
                    // Display the outstanding balance for the logged-in client
                    InstructorLabel.Text = clientRecord.FirstName.ToString();
                    dateLabel.Text = clientRecord.BookingDate.ToShortDateString();
                    timeLabel.Text = clientRecord.TimeSlot.ToString();
                    VehicleLabel.Text = clientRecord.Make.ToString();
                }
                else
                {
                    InstructorLabel.Text = "No Booked Instructor ";
                    dateLabel.Text = "No Booked Date";
                    timeLabel.Text = "No Booked Time";
                    VehicleLabel.Text = "No Booked Vehicle";
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
                        enrolmentIdLabel.Text = clientRecor.EnrollmentID.ToString();
                        clientIdLabel.Text = clientRecor.ClientID.ToString();
                        bookingCountLabel.Text = clientRecor.Duration.ToString();
                    }
                    else
                    {
                        bookingCountLabel.Text = "Eish Boy";
                        clientIdLabel.Text = "Singaphansi Boy";
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

        protected void book10Button_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource4.Insert();
                booKingLabel.Text = "Booking has been successfully made! 🚗💨";
                booKingLabel.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception)
            {

                booKingLabel.Text = "Error: Unable to make booking. Please ensure all required fields are selected. 🚗💥";
                booKingLabel.ForeColor = System.Drawing.Color.Red;
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CancelGridView.Visible = true;
            Label1.Visible = true;
            Label1.BorderColor = Color.Green;
        }
    }
}