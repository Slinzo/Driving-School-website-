using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AtThisPoint.Instructor
{
    public partial class Schedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = User.Identity.Name.ToString();

            // Extract all digits from the username
            string digits = new string(username.Where(char.IsDigit).ToArray());

            if (!string.IsNullOrEmpty(digits))
            {
                Label1.Text = digits; // Display extracted digits
            }
            else
            {
                Label1.Text = "Instructor has no Bookings"; // Message if no digits are found
            }

        }
    }
}