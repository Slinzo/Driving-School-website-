using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AtThisPoint.Customers
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ProfileButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void AvPackagesButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Packages.aspx");
        }

        protected void MakeBookingButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookingsDrivers.aspx");
        }

        protected void PaymentsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }

        protected void AboutUsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void SupportButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }

        protected void ExitButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }

        protected void LearnersButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookingLearners.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookingsDrivers10.aspx");
        }
    }
}