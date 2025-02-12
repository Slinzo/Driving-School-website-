<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="AtThisPoint.Customers.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
        body {
            background-color: #f0f4f8;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            /*background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);*/
        }
        /* Registration form styling */
        .registration-container {
            max-width: 500px;
            margin: auto;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .registration-container h2 {
            text-align: center;
            color: #333;
        }

        .form-pair {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .logo-container {
            margin-bottom: 20px; /* Adds space between the logo and form elements */
        }

        .logo {
            max-width: 150px; /* Adjust as needed */
            height: auto;
        }

        .button-group {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 15px;
        }

        .btn-register, .btn-clear, .btn-cancel {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-register {
            background-color: #007bff;
            color: #fff;
        }

        .btn-register:hover {
            background-color: #0056b3;
        }

        .btn-cancel {
            background-color: red;
            color: #fff;
        }

        .btn-cancel:hover {
            background-color: #d9534f;
        }

        .btn-clear {
            background-color: yellow;
            color: #333;
        }

        .btn-clear:hover {
            background-color: #e6c300;
        }

        #emailError {
            color: red;
            font-size: 12px;
            margin-bottom: 10px;
        }

        #phoneError {
            color: red;
            font-size: 12px;
            margin-bottom: 10px;
        }

        #idError {
            color: red;
            font-size: 12px;
            margin-bottom: 10px;
        }

        /* Profile Container */
        .profile-container {
            width: 400px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 0; /* Remove margin for top-left alignment */
            position: absolute; /* Allows positioning relative to the screen */
            top: 10; /* Align to the top */
            left: 0; /* Align to the left */
            max-height: 90vh;
            overflow-y: auto;
            transition: transform 0.2s;
        }

        .profile-container:hover {
            transform: scale(1.02); /* Slightly scale up on hover */
        }

        /* Profile Header */
        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-header h2 {
            color: #333;
            font-size: 24px;
            font-weight: bold;
        }

        /* Profile Card */
        .profile-card {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            border-left: 4px solid; /* Left border color will alternate */
            transition: box-shadow 0.2s ease-in-out;
        }

        .profile-card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        /* Correct Alternating Border Colors */
        .profile-card:nth-child(1) {
            border-left-color: yellow;
        }

        .profile-card:nth-child(2) {
            border-left-color: red;
        }

        .profile-card:nth-child(3) {
            border-left-color: yellow; /* Darker blue */
        }

        .profile-card:nth-child(4) {
            border-left-color: #003366;
        }

        /* Buttons Update */
        asp\:Button {
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            margin: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        asp\:Button:hover {
            opacity: 0.9;
        }

        #BtnEdit {
            background-color: #ffc107; /* Yellow */
            color: yellow;
        }

        #BtnUpdate {
            background-color: #007bff; /* Blue */
            color: #fff;
        }

        #BtnDelete {
            background-color: #dc3545; /* Red */
            color: #fff;
        }

        /* Inputs Styling */
        input[type="text"] {
            border: 1px solid #ccc;
            padding: 8px;
            width: 95%;
            margin: 5px 0;
            border-radius: 4px;
            box-sizing: border-box;
            transition: border 0.3s ease-in-out;
        }

        input[type="text"]:focus {
            border: 1px solid #007bff; /* Highlight border on focus */
            outline: none;
        }

 


            /* Table styling for all GridView tables */
            .modern-table {
                width: 60%;                  
                margin: 20px auto;
                border-collapse: collapse;
                margin-top: 20px;
                font-size: 16px;
                text-align: left;
                background-color: #fff;
                border: 1px solid #ddd;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
                overflow: hidden;
            }

            .modern-table th,
            .modern-table td {
                padding: 12px 15px;
                border-bottom: 1px solid #ddd;
            }

            .modern-table th {
                background-color: #f4f4f4;
                font-weight: bold;
                text-align: left;
                border-bottom: 2px solid #ccc;
            }

            .modern-table tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .modern-table tr:hover {
                background-color: #f1f1f1;
                cursor: pointer;
            }
        

    </style>

    <script type="text/javascript">

        function validateAndAutofillID() {
            var idNumber = document.getElementById('<%= IDTextBox.ClientID %>').value;
            var idErrorElement = document.getElementById('idError');
            var registerButton = document.getElementById('<%= RegisterButton.ClientID %>');
            var isValid = true;
            var message = "";

            // Basic length and numeric check
            if (idNumber.length !== 13 || isNaN(idNumber)) {
                isValid = false;
                message = "Please enter a valid 13-digit South African ID number.";
            } else {
                // Luhn algorithm check for validity
                var checksum = 0;
                var evenPosition = false;

                for (var i = idNumber.length - 1; i >= 0; i--) {
                    var digit = parseInt(idNumber.charAt(i), 10);
                    if (evenPosition) {
                        digit *= 2;
                        if (digit > 9) digit -= 9;
                    }
                    checksum += digit;
                    evenPosition = !evenPosition;
                }

                if (checksum % 10 !== 0) {
                    isValid = false;
                    message = "Invalid South African ID number.";
                }
            }

            // Display error message and update button state
            idErrorElement.innerText = message;
            registerButton.disabled = !isValid;

            // Proceed with autofill if valid
            if (isValid) {
                // Autofill fields
                var year = idNumber.substring(0, 2);
                var month = idNumber.substring(2, 4);
                var day = idNumber.substring(4, 6);
                var genderCode = idNumber.charAt(6);
                var nationalityCode = idNumber.charAt(10);
                var fullYear = parseInt(year) < 22 ? '20' + year : '19' + year;
                var dob = fullYear + '-' + month + '-' + day;

                document.getElementById('<%= DOBTextBox.ClientID %>').value = dob;
                document.getElementById('<%= NationalityTextBox.ClientID %>').value = (nationalityCode === '0') ? 'South African' : 'Other';
                document.getElementById('<%= GenderTextBox.ClientID %>').value = (genderCode < '5') ? 'Female' : 'Male';

                // Calculate age
                var birthDate = new Date(dob);
                var age = new Date().getFullYear() - birthDate.getFullYear();
                var monthDifference = new Date().getMonth() - birthDate.getMonth();
                if (monthDifference < 0 || (monthDifference === 0 && new Date().getDate() < birthDate.getDate())) {
                    age--;
                    }
                    document.getElementById('<%= AgeTextBox.ClientID %>').value = age;

                    // Check age restriction
                if (age < 16) {
                    registerButton.disabled = true;
                    alert("You must be at least 16 years old to register.");
                } else {
                    registerButton.disabled = false;
                }
            }

            // Clear error message if input is empty
            if (idNumber === "") {
                idErrorElement.innerText = "";
                registerButton.disabled = true;
            }
        }


        function validateEmail() {
            var email = document.getElementById('<%= EmailTextBox.ClientID %>').value;
            var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            var message = emailPattern.test(email) ? "" : "Please enter a valid email address.";
            document.getElementById('emailError').innerText = message;
            document.getElementById('<%= RegisterButton.ClientID %>').disabled = message !== "";
            if (email === "") {
                document.getElementById('emailError').innerText = "";
            }
        }

        function validatePhoneNumber() {
            var phoneNumber = document.getElementById('<%= ContactsTextBox.ClientID %>').value;
            var saPhoneNumberPattern = /^(0\d{9}|(\+27)\d{9})$/;
            var message = saPhoneNumberPattern.test(phoneNumber) ? "" : "Please enter a valid South African phone number.";
            document.getElementById('phoneError').innerText = message;
            document.getElementById('<%= RegisterButton.ClientID %>').disabled = message !== "";
            if (phoneNumber === "") {
                document.getElementById('phoneError').innerText = "";
            }
        }




        function autofillAreaCode() {
            var area = document.getElementById('<%= AreaDropdown.ClientID %>').value;
            var areaCode = area === "Durban" ? "4000" :
                           area === "Pietermaritzburg" ? "3201" :
                           area === "Glenwood" ? "4001":
                           area === "Westville" ? "3629":
                           area === "Glenwood" ? "4001":
                           area === "Chatsworth" ? "4901":
                           area === "Berea" ? "4003" :
                               "Other";
            document.getElementById('<%= AreaCodeTextBox.ClientID %>').value = areaCode;
        }

        function clearAllFields() {
            document.querySelectorAll('.form-control').forEach(field => field.value = '');
            document.getElementById('<%= AreaDropdown.ClientID %>').selectedIndex = 0;
            clearErrorMessages();
        }

        function clearErrorMessages() {
            document.getElementById('emailError').innerText = "";
            document.getElementById('<%= RegisterButton.ClientID %>').disabled = false;
        }

        window.onload = function () {
            // Retrieve the value of the ClientID textbox in the profile card
            var clientID = document.getElementById('<%= txtClientID.ClientID %>');

        // Retrieve the registration container
        var registrationContainer = document.querySelector('.registration-container');

        // Check if the ClientID text box is not empty
        if (clientID && clientID.value.trim() !== "") {
            // Hide the registration container if ClientID is not empty
            registrationContainer.style.display = "none";
        }
        };
    </script>

</head>
<body>
        <div class="profile-container">
            <!-- Profile Header Section -->
            <div class="profile-header">
                <h2>User Profile</h2>
            </div>

            <!-- User Information Section -->
            <div class="profile-card">
                <h3>Personal Information</h3>
                <br />
                <asp:Label ID="LblResponse" runat="server" Visible="False"></asp:Label>
                <br />
                <p><strong>Client ID:</strong> </p> <asp:TextBox ID="txtClientID" runat="server" ReadOnly="True"></asp:TextBox>
                <p><strong>Name:</strong> </p> <asp:TextBox ID="txtName" runat="server" ReadOnly="True"></asp:TextBox>
                <p><strong>Surname:</strong> </p> <asp:TextBox ID="txtSurname" runat="server" ReadOnly="True"></asp:TextBox>
                <p><strong>ID Number:</strong> </p> <asp:TextBox ID="txtid" runat="server" ReadOnly="True"></asp:TextBox>
                <p><strong>Gender:</strong> </p><asp:TextBox ID="txtGender" runat="server" ReadOnly="True"></asp:TextBox>
                <p><strong>Nationality:</strong> </p> <asp:TextBox ID="txtNationality" runat="server" ReadOnly="True"></asp:TextBox>
                <p><strong>Age:</strong> </p> <asp:TextBox ID="TxtAge" runat="server" ReadOnly="True"></asp:TextBox>
                <p><strong>Date of Birth:</strong> </p> <asp:TextBox ID="TxtDOB" runat="server" ReadOnly="True"></asp:TextBox>
                <p><strong>Contact:</strong> </p><asp:TextBox ID="TxtContact" runat="server" ReadOnly="True"></asp:TextBox>
                <p><strong>Email:</strong> </p>  <asp:TextBox ID="TxtEmail" runat="server" ReadOnly="True"></asp:TextBox>     
                <p><strong>Street Name:</strong> </p> <asp:TextBox ID="TxtStrt" runat="server" ReadOnly="True"></asp:TextBox>
                <p><strong>City:</strong> </p> <asp:TextBox ID="TxtCity" runat="server" ReadOnly="True"></asp:TextBox>
                <p><strong>Postal Code:</strong> </p> <asp:TextBox ID="TxtPostalCode" runat="server" ReadOnly="True"></asp:TextBox>
                <p><strong></strong></p> <asp:TextBox ID="txtOB" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>

                <br
                    /> 
                <div>
                <asp:Button ID="BtnEdit" runat="server" Text="EDIT?" OnClick="BtnEdit_Click" /> <asp:Button ID="BtnUpdate" runat="server" Text="UPDATE" BackColor="Blue" ForeColor="White" OnClick="BtnUpdate_Click1" /> <asp:Button ID="BtnView" runat="server" Text="VIEW DETAILS" BackColor="Red" ForeColor="White" OnClick="BtnView_Click" Visible="False" Width="130px" />
                </div>
                

                <br />

            </div>

        </div>

        <div class="registration-container">
            <div class="logo" style="text-align: center;">
                <img src="~/photos/logo.png" alt="Logo" runat="server" style="width: 50px; margin-bottom: 20px;" />
            </div>

            <h2 <%--style="color:black; font:bold 30px arial;"--%>> Register </h2>

            <div class="form-pair">
                <asp:TextBox ID="FnameTextBox" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                <asp:TextBox ID="LnameTextBox" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
            </div>
            <div class="form-pair">
                <asp:TextBox ID="IDTextBox" runat="server" CssClass="form-control" placeholder="ID Number" onkeyup="validateAndAutofillID()"></asp:TextBox>

                <asp:TextBox ID="DOBTextBox" runat="server" CssClass="form-control" placeholder="Date of Birth"></asp:TextBox>
            </div>
            <div class="form-pair">
                <asp:TextBox ID="NationalityTextBox" runat="server" CssClass="form-control" placeholder="Nationality"></asp:TextBox>
                <asp:TextBox ID="GenderTextBox" runat="server" CssClass="form-control" placeholder="Gender"></asp:TextBox>
            </div>
            <div class="form-pair">
                <asp:TextBox ID="AgeTextBox" runat="server" CssClass="form-control" placeholder="Age"></asp:TextBox>
                <asp:TextBox ID="ContactsTextBox" runat="server" CssClass="form-control" placeholder="Contact" onkeyup="validatePhoneNumber()"></asp:TextBox>

            </div>
            <div class="form-pair">
                <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" placeholder="Email Address" onkeyup="validateEmail()"></asp:TextBox>
                <asp:TextBox ID="StreetNameTextBox" runat="server" CssClass="form-control" placeholder="Street Name" OnTextChanged="StreetNameTextBox_TextChanged"></asp:TextBox>
            </div>
            <div class="form-pair">
                <asp:DropDownList ID="AreaDropdown" runat="server" CssClass="form-control" onchange="autofillAreaCode()">
                    <asp:ListItem Text="Select Area" Value=""></asp:ListItem>
                    <asp:ListItem Text="Durban" Value="Durban"></asp:ListItem>
                    <asp:ListItem Text="Pietermaritzburg" Value="Pietermaritzburg"></asp:ListItem>
                    <asp:ListItem Text="Glenwood" Value="Glenwood"></asp:ListItem>
                    <asp:ListItem Text="Westville" Value="Westville"></asp:ListItem>
                    <asp:ListItem Text="Chatsworth" Value="Chatsworth"></asp:ListItem>
                    <asp:ListItem Text="Berea" Value="Berea"></asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="AreaCodeTextBox" runat="server" CssClass="form-control" placeholder="Area Code"></asp:TextBox>
            </div>
 
            <asp:TextBox ID="OutstandingBalanceTextBox" runat="server" CssClass="form-control" Text="0" Visible="false"></asp:TextBox>

            <div id="emailError"></div>
            <div id="phoneError"></div>
            <div id="idError"></div>

            <div class="button-group">
                <asp:Button ID="RegisterButton" runat="server" CssClass="btn-register" Text="Create Profile" OnClick="RegisterButton_Click" />
                <asp:Button ID="CancelButton" runat="server" CssClass="btn-cancel" Text="Cancel" PostBackUrl="~/CoverPage.aspx" OnClick="CancelButton_Click" />
                <asp:Button ID="ClearButton" runat="server" CssClass="btn-clear" Text="Clear" OnClientClick="clearAllFields(); return false;" />
                <asp:Label ID="LblConfirmation" runat="server" Text="Label"></asp:Label>
            </div>
        </div>

            <asp:GridView ID="EnrollmentGridView" runat="server" DataSourceID="SqlDataSource5" AutoGenerateColumns="False" CssClass="modern-table">
                <Columns>
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                    <asp:BoundField DataField="CourseDescription" HeaderText="CourseDescription" SortExpression="CourseDescription" />
                    <asp:BoundField DataField="DateOfEnrollment" HeaderText="DateOfEnrollment" SortExpression="DateOfEnrollment" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                    <asp:BoundField DataField="ClientID" HeaderText="ClientID" SortExpression="ClientID" Visible="False" />
                </Columns>
            </asp:GridView>

    <asp:Button ID="BtnNext" runat="server" Text="Next>" OnClick="BtnNext_Click" />

        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT Enrollment.ClientID, Enrollment.Cost, Enrollment.Duration, Course2.CourseName, Course2.CourseDescription, Enrollment.DateOfEnrollment FROM Enrollment INNER JOIN Course2 ON Enrollment.CourseID = Course2.CourseID WHERE (Enrollment.ClientID = @ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtClientID" Name="ID" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="DSUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" DeleteCommand="DELETE FROM [ClientDetails] WHERE [ClientID] = @original_ClientID" InsertCommand="INSERT INTO [ClientDetails] ([Name], [Surname], [IDNumber], [Gender], [Nationality], [Age], [DateOfBirth], [CellphoneNumber], [EmailAddress], [StreetName], [City], [PostalCode], [Outstanding Balance]) VALUES (@Name, @Surname, @IDNumber, @Gender, @Nationality, @Age, @DateOfBirth, @CellphoneNumber, @EmailAddress, @StreetName, @City, @PostalCode, @Outstanding_Balance)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ClientDetails]" UpdateCommand="UPDATE ClientDetails SET Name = @Name, Surname = @Surname, CellphoneNumber = @CellphoneNumber, StreetName = @StreetName, City = @City, PostalCode = @PostalCode WHERE (ClientID = @original_ClientID)" OnSelecting="DSUpdate_Selecting">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ClientID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Surname" Type="String" />
                        <asp:Parameter Name="IDNumber" Type="String" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="Nationality" Type="String" />
                        <asp:Parameter Name="Age" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="DateOfBirth" />
                        <asp:Parameter Name="CellphoneNumber" Type="String" />
                        <asp:Parameter Name="EmailAddress" Type="String" />
                        <asp:Parameter Name="StreetName" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="PostalCode" Type="String" />
                        <asp:Parameter Name="Outstanding_Balance" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtSurname" Name="Surname" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtContact" Name="CellphoneNumber" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtEmail" Name="EmailAddress" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtStrt" Name="StreetName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtCity" Name="City" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="TxtPostalCode" Name="PostalCode" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtClientID" Name="original_ClientID" PropertyName="Text" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT ClientID, Name, Surname, IDNumber, Gender, Nationality, Age, DateOfBirth, CellphoneNumber, EmailAddress, StreetName, City, PostalCode, [Outstanding Balance] FROM ClientDetails WHERE (EmailAddress = @EmailAddress)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtHiddenUser" Name="EmailAddress" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ClientID" DataSourceID="SqlDataSource2" Visible="False">
                            <Columns>
                                <asp:BoundField DataField="ClientID" HeaderText="ClientID" InsertVisible="False" ReadOnly="True" SortExpression="ClientID" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                                <asp:BoundField DataField="IDNumber" HeaderText="IDNumber" SortExpression="IDNumber" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                <asp:BoundField DataField="Nationality" HeaderText="Nationality" SortExpression="Nationality" />
                                <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                                <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
                                <asp:BoundField DataField="CellphoneNumber" HeaderText="CellphoneNumber" SortExpression="CellphoneNumber" />
                                <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
                                <asp:BoundField DataField="StreetName" HeaderText="StreetName" SortExpression="StreetName" />
                                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
                                <asp:BoundField DataField="Outstanding Balance" HeaderText="Outstanding Balance" SortExpression="Outstanding Balance" />
                            </Columns>
                        </asp:GridView> <asp:TextBox ID="txtHiddenUser" runat="server" Visible="False"></asp:TextBox>            

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT * FROM [ClientDetails]" InsertCommand="INSERT INTO ClientDetails(Name, Surname, IDNumber, Gender, Nationality, Age, DateOfBirth, CellphoneNumber, EmailAddress, StreetName, City, PostalCode, [Outstanding Balance]) VALUES (@Name, @Surname, @IDNumber, @Gender, @Nationality, @Age, @DateOfBirth, @CellphoneNumber, @EmailAddress, @Streetname, @City, @PostalCode, @OutstandingBalance)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="FnameTextBox" Name="Name" PropertyName="Text" />
                        <asp:ControlParameter ControlID="LnameTextBox" Name="Surname" PropertyName="Text" />
                        <asp:ControlParameter ControlID="IDTextBox" Name="IDNumber" PropertyName="Text" />
                        <asp:ControlParameter ControlID="GenderTextBox" Name="Gender" PropertyName="Text" />
                        <asp:ControlParameter ControlID="NationalityTextBox" Name="Nationality" PropertyName="Text" />
                        <asp:ControlParameter ControlID="AgeTextBox" Name="Age" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DOBTextBox" Name="DateOfBirth" PropertyName="Text" />
                        <asp:ControlParameter ControlID="ContactsTextBox" Name="CellphoneNumber" PropertyName="Text" />
                        <asp:ControlParameter ControlID="EmailTextBox" Name="EmailAddress" PropertyName="Text" />
                        <asp:ControlParameter ControlID="StreetNameTextBox" Name="Streetname" PropertyName="Text" />
                        <asp:ControlParameter ControlID="AreaDropdown" Name="City" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="AreaCodeTextBox" Name="PostalCode" PropertyName="Text" />
                        <asp:ControlParameter ControlID="OutstandingBalanceTextBox" Name="OutstandingBalance" PropertyName="Text" />
                    </InsertParameters>
            </asp:SqlDataSource>
</body>

</asp:Content>
