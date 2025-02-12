using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;


namespace AtThisPoint.Customers
{
    public partial class Packages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dateTXT.Text = DateTime.Now.ToShortDateString();
            if (!IsPostBack)
            {
                // Retrieve the logged-in client's email or username
                string loggedInUserEmail = User.Identity.Name.ToString(); // Assumes you are using the email as the identifier

                // Initialize the dataset and table adapter
                DataSet1 DS = new DataSet1();
                DataSet1TableAdapters.ClientDetailsTableAdapter TA = new DataSet1TableAdapters.ClientDetailsTableAdapter();

                // Fill the dataset with client details
                TA.Fill(DS.ClientDetails);

                // Retrieve the specific client's data using LINQ or other logic
                var clientRecord = DS.ClientDetails.FirstOrDefault(client => client.EmailAddress == loggedInUserEmail);

                if (clientRecord != null)
                {
                    // Display the outstanding balance for the logged-in client
                    LblClientID.Text = clientRecord.ClientID.ToString();
                }
                else
                {
                    LblClientID.Text = "No record found for the logged-in user.";
                }

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
                   EnrollmentIDlbl.Text = clientRecor.EnrollmentID.ToString();
                  
                }
                else
                {
                    EnrollmentIDlbl.Text = "0";
                }
            }
        }

        protected void LearnersPackageButton_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0)
            {

                GridViewRow firstRow = GridView1.Rows[GridView1.Rows.Count - 1];

                // Retrieve the cell values and assign them to the textboxes
                PackageIDTextBox.Text = firstRow.Cells[0].Text; // Package ID
                CourseIDTextBox.Text = firstRow.Cells[1].Text;  // Course ID
                NoofLessonsTextBox.Text = firstRow.Cells[2].Text;  // Duration
                CostTextBox.Text = firstRow.Cells[3].Text;
            }
        }

        protected void ShortCourseButton_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 0)
            {
                // Access the first row of the GridView1
                GridViewRow secondrow = GridView1.Rows[0];

                // Retrieve the cell values and assign them to the textboxes
                PackageIDTextBox.Text = secondrow.Cells[0].Text; // Package ID
                CourseIDTextBox.Text = secondrow.Cells[1].Text;  // Course ID
                NoofLessonsTextBox.Text = secondrow.Cells[2].Text;  // Duration
                CostTextBox.Text = secondrow.Cells[3].Text;      // Cost
            }

        }

        protected void InterButton_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 1) // Ensure there are at least two rows
            {
                // Access the second row of the GridView
                GridViewRow secondRow = GridView1.Rows[1];

                // Retrieve the cell values and assign them to the textboxes
                PackageIDTextBox.Text = secondRow.Cells[0].Text; // Package ID
                CourseIDTextBox.Text = secondRow.Cells[1].Text;  // Course ID
                NoofLessonsTextBox.Text = secondRow.Cells[2].Text;  // Duration
                CostTextBox.Text = secondRow.Cells[3].Text;      // Cost
            }
        }

        protected void FullButton_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 2) // Ensure there are at least three rows
            {
                // Access the third row of the GridView
                GridViewRow thirdRow = GridView1.Rows[2];

                // Retrieve the cell values and assign them to the textboxes
                PackageIDTextBox.Text = thirdRow.Cells[0].Text; // Package ID
                CourseIDTextBox.Text = thirdRow.Cells[1].Text;  // Course ID
                NoofLessonsTextBox.Text = thirdRow.Cells[2].Text;  // Duration
                CostTextBox.Text = thirdRow.Cells[3].Text;      // Cost
            }
        }

        protected void Short10Button_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 5) // Ensure there are at least four rows
            {
                // Access the fourth row of the GridView
                GridViewRow fourthRow = GridView1.Rows[5];

                // Retrieve the cell values and assign them to the textboxes
                PackageIDTextBox.Text = fourthRow.Cells[0].Text; // Package ID
                CourseIDTextBox.Text = fourthRow.Cells[1].Text;  // Course ID
                NoofLessonsTextBox.Text = fourthRow.Cells[2].Text;  // Duration
                CostTextBox.Text = fourthRow.Cells[3].Text;      // Cost
            }
        }

        protected void inter10Button_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 6) // Ensure there are at least five rows
            {
                // Access the fifth row of the GridView
                GridViewRow fifthRow = GridView1.Rows[6];

                // Retrieve the cell values and assign them to the textboxes
                PackageIDTextBox.Text = fifthRow.Cells[0].Text; // Package ID
                CourseIDTextBox.Text = fifthRow.Cells[1].Text;  // Course ID
                NoofLessonsTextBox.Text = fifthRow.Cells[2].Text;  // Duration
                CostTextBox.Text = fifthRow.Cells[3].Text;      // Cost
            }
        }

        protected void Full10Button_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count > 7) // Ensure there are at least five rows
            {
                // Access the fifth row of the GridView
                GridViewRow fifthRow = GridView1.Rows[7];

                // Retrieve the cell values and assign them to the textboxes
                PackageIDTextBox.Text = fifthRow.Cells[0].Text; // Package ID
                CourseIDTextBox.Text = fifthRow.Cells[1].Text;  // Course ID
                NoofLessonsTextBox.Text = fifthRow.Cells[2].Text;  // Duration
                CostTextBox.Text = fifthRow.Cells[3].Text;      // Cost
            }
        }

        protected void dateTXT_TextChanged(object sender, EventArgs e)
        {

        }

        protected void EnrolButton_Click(object sender, EventArgs e)
        {
           
            try
            {
                if (EnrollmentIDlbl.Text=="0")
                {
                    SqlDataSource2.Insert();
                    DSUpdate.Update();
                    messageLabel.Text = "Client has Successfully Enrolled";
                    messageLabel.ForeColor = Color.Green;
                    messageLabel.Visible = true;

                }
                else
                {
                    messageLabel.Text = "Client cannot Enroll more than once";
                    messageLabel.ForeColor = Color.Red;
                    messageLabel.Visible = true;
                }
            }
            catch (Exception)
            {

                messageLabel.Text = "Client was not Enrolled please ensure you selected a package";
                messageLabel.ForeColor = Color.Red;
                messageLabel.Visible = true;
            }
        }

        protected void Code8DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customers/Payment.aspx");
        }



        //if (Code8DropDownList.SelectedItem != null)
        //{
        //    // Assuming the DropDownList is bound to a DataTable or DataView
        //    DataRowView selectedRow = (DataRowView)Code8DropDownList.SelectedItem;

        //    // Retrieve the values from the selected item
        //    string packageID = selectedRow["PackageID"].ToString();
        //    decimal costValue = Convert.ToDecimal(selectedRow["Cost"]);
        //    string cost = costValue.ToString("F2");
        //    string noLessons = selectedRow["NumberOfLessons"].ToString();
        //    string courseID = selectedRow["CourseID"].ToString();

        //    // Assign values to the textboxes
        //    costTXT.Text = cost;
        //    durationTXT.Text = noLessons;
        //    courseTXT.Text = courseID;
        //    textBox2.Text = packageID;
        //}
    }
}
