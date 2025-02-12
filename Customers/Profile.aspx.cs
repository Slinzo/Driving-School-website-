using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AtThisPoint.Customers
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            txtHiddenUser.Text = User.Identity.Name.ToString();
            SqlDataSource2.SelectParameters["EmailAddress"].DefaultValue = txtHiddenUser.Text;
            GridView1.DataBind();
            EmailTextBox.Text=  User.Identity.Name.ToString();
            EmailTextBox.Enabled = false;

            if (!IsPostBack)
            {
                string logggedInUserEmail = User.Identity.Name.ToString();

                DataSet2 DS = new DataSet2();
                DataSet2TableAdapters.ClientDetailsTableAdapter TA = new DataSet2TableAdapters.ClientDetailsTableAdapter();

                TA.FillByName(DS.ClientDetails);

                var clientRecord = DS.ClientDetails.FirstOrDefault(client => client.EmailAddress == logggedInUserEmail);

                if (clientRecord != null)
                {
                    txtClientID.Text = clientRecord.ClientID.ToString();
                    txtName.Text = clientRecord.Name.ToString();
                    txtSurname.Text = clientRecord.Surname.ToString();
                    txtid.Text = clientRecord.IDNumber.ToString();
                    txtGender.Text = clientRecord.Gender.ToString();
                    txtNationality.Text = clientRecord.Nationality.ToString();
                    TxtAge.Text = clientRecord.Age.ToString();
                    TxtDOB.Text = clientRecord.DateOfBirth.ToShortDateString();
                    TxtContact.Text = clientRecord.CellphoneNumber.ToString();
                    TxtEmail.Text = clientRecord.EmailAddress.ToString();
                    TxtCity.Text = clientRecord.City.ToString();
                    TxtStrt.Text = clientRecord.StreetName.ToString();
                    TxtPostalCode.Text = clientRecord.PostalCode.ToString();
                    txtOB.Text = clientRecord.Outstanding_Balance.ToString();
                }
                else
                {
                    LblResponse.Text = "No record found of Client.CREATE PROFILE FIRST";
                    LblResponse.ForeColor = System.Drawing.Color.Red;
                }
            }

          BtnUpdate.Visible = false; 

        }
      
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
           
         
           

        }

        protected void ContactsTextBox_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {

        }

       protected void UpdateButton_Click(object sender, EventArgs e)
        {
            txtName.ReadOnly = false;
            txtName.BorderColor = System.Drawing.Color.Red;
            txtSurname.ReadOnly = false;
            txtSurname.BorderColor = System.Drawing.Color.Red;
            TxtContact.ReadOnly = false;
            TxtContact.BorderColor = System.Drawing.Color.Red;
            TxtEmail.ReadOnly = false;
            TxtEmail.BorderColor = System.Drawing.Color.Red;
            TxtStrt.ReadOnly = false;
            TxtStrt.BorderColor = System.Drawing.Color.Red;
            TxtCity.ReadOnly = false;
            TxtStrt.BorderColor = System.Drawing.Color.Red;
            TxtPostalCode.ReadOnly = false;
            TxtPostalCode.BorderColor = System.Drawing.Color.Red;

          //  BtnUpdate.Visible = true;
           
        } 

        protected void StreetNameTextBox_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            //query
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            txtName.ReadOnly = true;
            txtSurname.ReadOnly = true;
            TxtContact.ReadOnly = false;
            TxtContact.BorderColor = System.Drawing.Color.Red;
            TxtEmail.ReadOnly = true;
          //  TxtEmail.BorderColor = System.Drawing.Color.Red;
            TxtStrt.ReadOnly = false;
            TxtStrt.BorderColor = System.Drawing.Color.Red;
            TxtCity.ReadOnly = false;
            TxtCity.BorderColor = System.Drawing.Color.Red;
            TxtPostalCode.ReadOnly = false;
            TxtPostalCode.BorderColor = System.Drawing.Color.Red;
            txtClientID.ReadOnly = true; 

            BtnUpdate.Visible = true;
            //  BtnDelete.Visible = true;
            LblResponse.Visible = true;
            LblResponse.ForeColor = System.Drawing.Color.Red;
            LblResponse.Text = "HI" + " "+ txtName.Text + ", SCROLL DOWN TO UPDATED IN HIGHLIGHTED TEXTBOXES!";
        }

        protected void DSUpdate_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void BtnUpdate_Click1(object sender, EventArgs e)
        {
            DSUpdate.Update();
            //Lindani please put Message box here for the successful update and a refresh button to load the page again
            LblResponse.Visible = true; 
            LblResponse.ForeColor = System.Drawing.Color.Green; 
            LblResponse.Text = txtName.Text + ", YOU HAVE SUCCESSFULLY UPDATED YOUR INFORMATION!";
        }

        protected void BtnView_Click(object sender, EventArgs e)
        {
           
        }

        protected void BtnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customers/Packages.aspx");
        }
    }
}