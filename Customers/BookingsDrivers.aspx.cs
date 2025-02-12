using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AtThisPoint.Customers
{
    public partial class BookingsDrivers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.VisibleDate = DateTime.Today;
                LoadClientDetails();
            }

            Calendar1.DayRender += new DayRenderEventHandler(Calendar1_DayRender);
        }

        private void LoadClientDetails()
        {
            string loggedInUserEmail = User.Identity.Name.ToString(); // Assumes email as identifier

            // Load DriversBooking details
            DataSet1 DS = new DataSet1();
            DataSet1TableAdapters.DriversBookingTableAdapter TA = new DataSet1TableAdapters.DriversBookingTableAdapter();
            TA.Fill(DS.DriversBooking);
            var clientRecord = DS.DriversBooking.FirstOrDefault(client => client.EmailAddress == loggedInUserEmail);

            if (clientRecord != null)
            {
                InstructorLabel.Text = clientRecord.FirstName.ToString();
                Label1.Text = clientRecord.BookingDate.ToShortDateString();
                timeLabel.Text = clientRecord.TimeSlot.ToString();
                VehicleLabel.Text = clientRecord.Make.ToString();
            }
            else
            {
                InstructorLabel.Text = "No Booked Instructor";
                Label1.Text = "No Booked Date";
                timeLabel.Text = "No Booked Time";
                VehicleLabel.Text = "No Booked Vehicle";
            }

            // Load additional client details
            DataSet1 D = new DataSet1();
            DataSet1TableAdapters.DataTable1TableAdapter T = new DataSet1TableAdapters.DataTable1TableAdapter();
            T.Fill(D.DataTable1);
            var clientRecor = D.DataTable1.FirstOrDefault(client => client.EmailAddress == loggedInUserEmail);

            if (clientRecor != null)
            {
                enrolmentidLabel.Text = clientRecor.EnrollmentID.ToString();
                clientidLabel.Text = clientRecor.ClientID.ToString();
                bookingcountLabel.Text = clientRecor.Duration.ToString();
            }
            else
            {
                enrolmentidLabel.Text = "Eish Boy";
                clientidLabel.Text = "Singaphansi Boy";
            }
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date <= DateTime.Today)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.LightGray;
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            try
            {
                // Perform insertion
                SqlDataSource6.Insert();

                // Refresh client details after booking
                LoadClientDetails();

                // Notify user of successful booking
                BookingStatusLabel.Text = "Booking has been successfully made! 🚗💨";
                BookingStatusLabel.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                // Handle any potential issues
                BookingStatusLabel.Text = "Error: Unable to make booking. Please ensure all required fields are selected. 🚗💥";
                BookingStatusLabel.ForeColor = System.Drawing.Color.Red;
                BookingStatusLabel.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CancelGridView.Visible = true;
            MessageLabel.Visible = true;
        }
    }
}