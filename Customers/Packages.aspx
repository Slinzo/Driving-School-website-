<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Packages.aspx.cs" Inherits="AtThisPoint.Customers.Packages" Debug="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* General Body Styling */
        body {
            background-color: #f0f4f8;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        /* Container for all packages */
        .packages-container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Section header */
        .packages-header {
            text-align: center;
            margin-bottom: 40px;
            color: #0056b3;
        }

        .packages-header h1 {
            font-size: 28px;
            font-weight: bold;
            color: #ff5722;
        }

        /* Package sections styling */
        .package-section {
            margin-bottom: 50px;
            border-left: 5px solid #ffc107;
            padding-left: 15px;
        }

        .package-section h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
        }

        /* Package grid */
        .package-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-around;
        }

        /* Individual package card */
        .package-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 280px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .package-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            border: 2px solid #ffc107;
        }

        /* Package title */
        .package-title {
            font-size: 20px;
            color: #333;
            margin-bottom: 10px;
        }

        /* Package price */
        .package-price {
            font-size: 24px;
            color: #ff5722;
            margin: 10px 0;
        }

        /* Package description */
        .package-description {
            font-size: 16px;
            color: #666;
            margin-bottom: 20px;
        }

        /* Enrol Button Styling */
        .enrol-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #28a745; /* Green button */
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1em;
            border: none;
            transition: background-color 0.3s;
            cursor: pointer;
        }

        .enrol-button:hover {
            background-color: #218838; /* Darker green on hover */
        }

        /* Textboxes container */
        .textboxes-container {
            margin-top: 30px;
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .textboxes-container input[type="text"], .textboxes-container .asp-textbox {
            width: 200px;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        /* Mobile responsiveness */
        /*@media (max-width: 768px) {
            .package-grid {
                flex-direction: column;
                align-items: center;
            }

            .package-card {
                width: 100%;
            }
        }*/
    </style>

    <div class="packages-container">
        <!-- Page Header -->
        <div class="packages-header">
            <h1>Our Driving School Packages</h1>
            <p>Choose from our variety of driving lessons and learner's courses tailored to your needs!</p>
        </div>

       <div class="textboxes-container">
            <asp:TextBox ID="PackageIDTextBox" runat="server" CssClass="asp-textbox" placeholder="Package ID" Visible="False"></asp:TextBox>
            <asp:TextBox ID="CourseIDTextBox" runat="server" CssClass="asp-textbox" placeholder="Course ID" Visible="False"></asp:TextBox>
            <asp:TextBox ID="NoofLessonsTextBox" runat="server" CssClass="asp-textbox" placeholder="Number of Lessons"></asp:TextBox>
            <asp:TextBox ID="CostTextBox" runat="server" CssClass="asp-textbox" placeholder="Cost"></asp:TextBox>            
            <asp:Label ID="LblClientID" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:TextBox ID="dateTXT" runat="server" OnTextChanged="dateTXT_TextChanged" ReadOnly="True"></asp:TextBox>
           
           <asp:SqlDataSource ID="DSUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" DeleteCommand="DELETE FROM [ClientDetails] WHERE [ClientID] = @ClientID" InsertCommand="INSERT INTO [ClientDetails] ([Name], [Surname], [IDNumber], [Gender], [Nationality], [Age], [DateOfBirth], [CellphoneNumber], [EmailAddress], [StreetName], [City], [PostalCode], [Outstanding Balance]) VALUES (@Name, @Surname, @IDNumber, @Gender, @Nationality, @Age, @DateOfBirth, @CellphoneNumber, @EmailAddress, @StreetName, @City, @PostalCode, @Outstanding_Balance)" SelectCommand="SELECT * FROM [ClientDetails]" UpdateCommand="UPDATE ClientDetails SET [Outstanding Balance] = @Outstanding_Balance WHERE (ClientID = @ClientID)">
               <DeleteParameters>
                   <asp:Parameter Name="ClientID" Type="Int32" />
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
                   <asp:ControlParameter ControlID="CostTextBox" Name="Outstanding_Balance" PropertyName="Text" />
                   <asp:ControlParameter ControlID="LblClientID" Name="ClientID" PropertyName="Text" Type="Int32" />
               </UpdateParameters>
            </asp:SqlDataSource>
           <asp:Button ID="EnrolButton" runat="server" Text="Enrol" CssClass="enrol-button" OnClick="EnrolButton_Click" />
            <asp:Label ID="messageLabel" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="EnrollmentIDlbl" runat="server" Text="0" Visible="False"></asp:Label>
        </div>


        <!-- Learners License Packages -->
        <div class="package-section">
            <h2>Learners License Packages</h2>
            <div class="package-grid">
                <div class="package-card">
                    <h3 class="package-title">Learners</h3>
                    <p class="package-price">R500</p>
                    <p class="package-description">30 Lessons to prepare for your learner's test.</p>
                    <asp:Button ID="LearnersPackageButton" runat="server" Text="Select" OnClick="LearnersPackageButton_Click" />
                </div>

            </div>
        </div>

        <!-- Code 8 Driving Lessons Packages -->
        <div class="package-section">
            <h2>Code 8 Driving Lessons Packages</h2>
            <div class="package-grid">
                <div class="package-card">
                    <h3 class="package-title">Short Course</h3>
                    <p class="package-price">R1500</p>
                    <p class="package-description">10 Lessons to get you familiar with basic code 8 driving skills.</p>
                    <asp:Button ID="ShortCourseButton" runat="server" Text="Select" OnClick="ShortCourseButton_Click" />
                </div>
                <div class="package-card">
                    <h3 class="package-title">Intermediate Course</h3>
                    <p class="package-price">R1900</p>
                    <p class="package-description">15 Lessons with road test preparation.</p>
                    <asp:Button ID="InterButton" runat="server" Text="Select" OnClick="InterButton_Click" />
                </div>
                <div class="package-card">
                    <h3 class="package-title">Full Course</h3>
                    <p class="package-price">R2300</p>
                    <p class="package-description">20 Lessons with professional driving techniques.</p>
                    <asp:Button ID="FullButton" runat="server" Text="Select" OnClick="FullButton_Click" />
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT * FROM [Code08Packages]"></asp:SqlDataSource>
            <br />
        </div>

        <!-- Code 10 Driving Lessons Packages -->
        <div class="package-section">
            <h2>Code 10 Driving Lessons Packages</h2>
            <div class="package-grid">
                <div class="package-card">
                    <h3 class="package-title">Short Course</h3>
                    <p class="package-price">R1700</p>
                    <p class="package-description">10 Lessons for large vehicle control and maneuvering.</p>
                    <asp:Button ID="Short10Button" runat="server" Text="Select" OnClick="Short10Button_Click" />
                </div>
                <div class="package-card">
                    <h3 class="package-title">Intermediate Course</h3>
                    <p class="package-price">R2100</p>
                    <p class="package-description">15 Lessons covering road test and driving fundamentals.</p>
                    <asp:Button ID="inter10Button" runat="server" Text="Select" OnClick="inter10Button_Click" />
                </div>
                <div class="package-card">
                    <h3 class="package-title">Advanced Course</h3>
                    <p class="package-price">R2500</p>
                    <p class="package-description">20 Lessons with in-depth driving and parking practice.</p>
                    <asp:Button ID="Full10Button" runat="server" Text="Select" OnClick="Full10Button_Click" />
                </div>
            </div>
             <br />
        </div>

        <asp:Button ID="btnNext" runat="server" Text="Next>" OnClick="btnNext_Click" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PackageID" DataSourceID="SqlDataSource1" Visible="False">
            <Columns>
                <asp:BoundField DataField="PackageID" HeaderText="PackageID" InsertVisible="False" ReadOnly="True" SortExpression="PackageID" />
                <asp:BoundField DataField="CourseID" HeaderText="CourseID" SortExpression="CourseID" />
                <asp:BoundField DataField="NumberofLessons" HeaderText="NumberofLessons" SortExpression="NumberofLessons" />
                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" InsertCommand="INSERT INTO Enrollment(PackageID, ClientID, Cost, Duration, DateOfEnrollment, CourseID) VALUES (@Package, @ClientID, @Cost, @Duration, @DateOfEnrollment, @CourseID)" SelectCommand="SELECT * FROM [Enrollment]">
            <InsertParameters>
                <asp:ControlParameter ControlID="PackageIDTextBox" Name="Package" PropertyName="Text" />
                <asp:ControlParameter ControlID="LblClientID" Name="ClientID" PropertyName="Text" />
                <asp:ControlParameter ControlID="CostTextBox" Name="Cost" PropertyName="Text" />
                <asp:ControlParameter ControlID="NoofLessonsTextBox" Name="Duration" PropertyName="Text" />
                <asp:ControlParameter ControlID="dateTXT" Name="DateOfEnrollment" PropertyName="Text" />
                <asp:ControlParameter ControlID="CourseIDTextBox" Name="CourseID" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT * FROM [Package]" DeleteCommand="DELETE FROM [Package] WHERE [PackageID] = @original_PackageID AND [CourseID] = @original_CourseID AND [NumberofLessons] = @original_NumberofLessons AND [Cost] = @original_Cost" InsertCommand="INSERT INTO [Package] ([CourseID], [NumberofLessons], [Cost]) VALUES (@CourseID, @NumberofLessons, @Cost)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Package] SET [CourseID] = @CourseID, [NumberofLessons] = @NumberofLessons, [Cost] = @Cost WHERE [PackageID] = @original_PackageID AND [CourseID] = @original_CourseID AND [NumberofLessons] = @original_NumberofLessons AND [Cost] = @original_Cost">
            <DeleteParameters>
                <asp:Parameter Name="original_PackageID" Type="Int32" />
                <asp:Parameter Name="original_CourseID" Type="Int32" />
                <asp:Parameter Name="original_NumberofLessons" Type="Int32" />
                <asp:Parameter Name="original_Cost" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CourseID" Type="Int32" />
                <asp:Parameter Name="NumberofLessons" Type="Int32" />
                <asp:Parameter Name="Cost" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CourseID" Type="Int32" />
                <asp:Parameter Name="NumberofLessons" Type="Int32" />
                <asp:Parameter Name="Cost" Type="Decimal" />
                <asp:Parameter Name="original_PackageID" Type="Int32" />
                <asp:Parameter Name="original_CourseID" Type="Int32" />
                <asp:Parameter Name="original_NumberofLessons" Type="Int32" />
                <asp:Parameter Name="original_Cost" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>

