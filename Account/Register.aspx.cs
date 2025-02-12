using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using AtThisPoint.Models;
using System.Configuration;
using System.Data.SqlClient;

namespace AtThisPoint.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };

            // Create user
            IdentityResult result = manager.Create(user, Password.Text);

            if (result.Succeeded)
            {
                // Assign user role if necessary
                if (!manager.IsInRole(user.Id, "Customer"))
                {
                    result = manager.AddToRole(user.Id, "Customer");
                    if (!result.Succeeded)
                    {
                        ErrorMessage.Text = result.Errors.FirstOrDefault();
                        return;
                    }
                }

                // Sign in the user
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);

                // Redirect to the profile page
                Response.Redirect("~/Customers/Profile.aspx");  // Adjust the URL to your profile page
            }
            else
            {
                // Show error if registration fails
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }

        //private void SaveCustomerDetails(string Name, string Surname, DateTime DateOfBirth, string Gender, string email, string CellPhoneNumber)
        //{
        //    string connectionString = ConfigurationManager.ConnectionStrings["G1Wst2024ConnectionStrings"].ConnectionString;

        //    using (SqlConnection conn = new SqlConnection(connectionString))
        //    {
        //        //check if email already exists
        //        string checkQuery = "SELECT COUNT(1) FROM Patient WHERE Patient_Email = @Email";
        //        using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
        //        {
        //            checkCmd.Parameters.AddWithValue("@Email", email);

        //            conn.Open();
        //            int emailExists = Convert.ToInt32(checkCmd.ExecuteScalar());
        //            conn.Close();

        //            if (emailExists > 0)
        //            {
        //                throw new Exception("Email already exists. Please use a different email.");
        //            }

        //        }

        //        //if email doesn't exist 
        //        string insertQuery = "INSERT INTO ClientDetails (Name, Surname, DateOfBirth, Gender, email, CellPhoneNumber) VALUES(@Name, @Surname, @DateOfBirth, @Gender, @Email, @CellPhoneNumber)";
        //        using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
        //        {
        //            insertCmd.Parameters.AddWithValue("@Name", Name);
        //            insertCmd.Parameters.AddWithValue("@Surname", Surname);
        //            insertCmd.Parameters.AddWithValue("@DateOfBirth", DateOfBirth);
        //            insertCmd.Parameters.AddWithValue("@Gender", Gender);
        //            insertCmd.Parameters.AddWithValue("@Email", Email);
        //            insertCmd.Parameters.AddWithValue("@CellPhoneNumber", CellPhoneNumber);

        //            conn.Open();
        //            insertCmd.ExecuteNonQuery();
        //        }
        //    }
        //}
    }
}