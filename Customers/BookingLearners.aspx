<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingLearners.aspx.cs" Inherits="AtThisPoint.Customers.BookingLearners" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
        /* General Page Styling */
        body {
            background-color: #f0f4f8;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        /* Main Container */
        .booking-container {
            width: 900px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Header Section */
        .booking-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .booking-header h2 {
            color: #333;
            font-size: 28px;
            font-weight: bold;
        }

        /* Booking Overview Section */
        .booking-overview {
            display: flex;
            justify-content: space-between;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .next-lesson {
            font-size: 16px;
            color: #333;
        }

        .next-lesson .highlight {
            font-weight: bold;
            color: #28a745;
        }

        .view-bookings-btn {
            background-color: #ffc107; /* Yellow color */
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1em;
            transition: background-color 0.3s ease;
        }

        .view-bookings-btn:hover {
            background-color: #e0a800; /* Darker yellow on hover */
        }


        /* Date Selector Section */
        .date-selector {
            margin-bottom: 30px;
        }

        .date-selector label {
            display: block;
            font-size: 16px;
            color: #333;
            margin-bottom: 10px;
        }

        .calendar {
            width: 100%;
            padding: 10px;
            font-size: 16px;
        }

        /* Time Slot Dropdown Selector */
        .time-slots {
            margin-bottom: 30px;
        }

        .time-slots label {
            font-size: 16px;
            color: #333;
            margin-bottom: 10px;
            display: block;
        }

        .time-slots select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        /* Instructor & Vehicle Details */
        .details-section {
            margin-bottom: 30px;
        }

        .details-section label {
            display: block;
            font-size: 16px;
            color: #333;
            margin-bottom: 10px;
        }

        .details-section select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        /* Confirm Booking Button */
        .confirm-booking-btn {
            display: block;
            background-color: #28a745;
            color: white;
            padding: 12px 20px;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1em;
            transition: background-color 0.3s ease;
            margin: 20px auto; /* Center the button */
        }

        .confirm-booking-btn:hover {
            background-color: #218838;
        }

        /* Booking History Section */
        .booking-history {
            margin-bottom: 30px;
        }

        .booking-history h3 {
            color: #333;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .datagrid-view {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .datagrid-view th, .datagrid-view td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .datagrid-view th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .datagrid-view tr:hover {
            background-color: #f9f9f9;
        }

        /* Footer Section */
        .booking-footer {
            text-align: center;
            color: #777;
            font-size: 14px;
            margin-top: 40px;
        }

        /* Cancel Booking Label */
        .cancel-booking-label {
            display: inline-block;
            font-size: 16px;
            color: #333;
            margin-right: 15px;
            vertical-align: middle;
        }

        /* Cancel Booking Button */
        .cancel-booking-btn {
            display: inline-block;
            background-color: #dc3545; /* Bootstrap-style red */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .cancel-booking-btn:hover {
            background-color: #c82333; /* Darker red */
            transform: scale(1.05); /* Slight zoom effect */
        }

        /* Center elements if needed */
        .cancel-booking-container {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 30px;
        }

        /* Styled Button */
        .styled-button {
            display: inline-block;
            background-color: #007bff; /* Blue color similar to primary button style */
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .styled-button:hover {
            background-color: #0056b3; /* Darker blue on hover */
            transform: scale(1.05); /* Slight zoom effect */
        }

        /* Styled Label for Message */
        .styled-message-label {
            display: inline-block;
            font-size: 16px;
            color: #333;
            margin-left: 10px;
            vertical-align: middle;
            font-weight: normal; /* Ensure the label text doesn't stand out too much */
        }

        .styled-button-container {
            text-align: center; /* Centers the button and label horizontally */
            margin-top: 20px;
            margin-bottom: 20px;
        }

        /* Styled GridView */
        .styled-gridview {
            width: 100%; /* Makes the grid take up the full width of the parent container */
            margin-top: 20px; /* Adds spacing from elements above */
            margin-bottom: 20px; /* Adds spacing below the grid */
            border-collapse: collapse; /* Ensures no space between table cells */
            border: 1px solid #ddd; /* Light border around the table */
            background-color: #fff; /* White background for the grid */
        }

        /* Grid Header Styling */
        .styled-gridview th {
            background-color: #5D7B9D; /* Header background color */
            color: white; /* Text color in header */
            padding: 12px 15px;
            text-align: left;
            font-weight: bold;
        }

        /* Grid Row Styling */
        .styled-gridview td {
            padding: 10px;
            text-align: left;
            vertical-align: middle;
            border-top: 1px solid #ddd; /* Border between rows */
        }

        /* Alternating row colors */
        .styled-gridview tr:nth-child(odd) {
            background-color: #F7F6F3;
        }

        .styled-gridview tr:nth-child(even) {
            background-color: white;
        }

        /* Selected Row Styling */
        .styled-gridview tr.selected-row {
            background-color: #E2DED6;
            font-weight: bold;
        }

        /* Hover effect on rows */
        .styled-gridview tr:hover {
            background-color: #f1f1f1; /* Light gray on hover */
        }

        /* Footer Styling */
        .styled-gridview tfoot {
            background-color: #5D7B9D;
            color: white;
            font-weight: bold;
            text-align: center;
            padding: 10px;
        }

        /* Pagination Controls */
        .styled-gridview .pager {
            background-color: #284775;
            color: white;
            padding: 10px;
            text-align: center;
        }

        .styled-gridview .pager a {
            color: white;
            padding: 8px 15px;
            margin: 0 5px;
            border-radius: 4px;
            text-decoration: none;
        }

        .styled-gridview .pager a:hover {
            background-color: #506C8C;
        }

        /* Ensure correct alignment of the grid inside its container */
        .styled-gridview-container {
            width: 100%; /* Full-width container */
            padding: 10px;
            margin-top: 20px;
            box-sizing: border-box;
        }

        /* Styling for the Cancel Booking Label */
        .cancel-booking-message {
            display: block;
            padding: 20px;
            margin: 20px 0;
            border: 1px solid #5D7B9D;  /* Border to separate the message */
            background-color: #F1F8FF;  /* Light blue background for readability */
            color: #333;  /* Dark text color for contrast */
            font-size: 16px;  /* Comfortable text size */
            line-height: 1.6;  /* Line height for better readability */
            border-radius: 8px;  /* Rounded corners for a soft appearance */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);  /* Soft shadow for emphasis */
            font-family: Arial, sans-serif;  /* Clean font for clarity */
        }

        .cancel-booking-message strong {
            font-weight: bold;  /* Bold text for section headings */
            color: #5D7B9D;  /* Consistent color with border for headings */
        }

        .cancel-booking-message ul {
            list-style-type: disc;
            margin-left: 20px;
            color: #555;  /* Slightly lighter text for list items */
        }

        .cancel-booking-message a {
            color: #5D7B9D;  /* Link color that matches the overall theme */
            text-decoration: none;
        }

        .cancel-booking-message a:hover {
            text-decoration: underline;  /* Underline links on hover for better UX */
        }


        /* Mobile responsiveness */
        @media (max-width: 600px) {
            .booking-container {
                width: 100%;
                padding: 10px;
            }

            .confirm-booking-btn {
                width: 100%;
            }
        }
        </style>

    <div class="booking-container">
        <!-- Header Section -->
        <div class="booking-header">
            <h2>Learner's Lessons Bookings</h2>
        </div>

        <!-- Booking Overview Section -->
        <div class="booking-overview">
            <div class="next-lesson">
                <p>Next Lesson: <asp:Label ID="Label1" runat="server" Text="Label" Visible="True"></asp:Label></p>
                <p>Instructor: <asp:Label ID="InstructorLabel" runat="server" Text="Label" Visible="True"></asp:Label></p> 
                <p>Time: <asp:Label ID="TimeLabel" runat="server" Text="Label" Visible="True"></asp:Label></p>
            </div>
            <a href="BookingLearners.aspx" class="view-bookings-btn">Refresh</a>
        </div>

        <!-- Date Selector Section -->
        <div class="date-selector">
            <label for="calendar">Select a Date for Booking:</label>
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        </div>

        <!-- Time Slot Dropdown Selector -->
        <div class="time-slots">
            <label for="time-dropdown">Available Time Slots:</label>
            <asp:DropDownList ID="TimeDropDown" runat="server" DataSourceID="SqlDataSource1" DataTextField="TimeSlot" DataValueField="TimeID"></asp:DropDownList>
            <asp:Label ID="EnrollmentIDlabel" runat="server" Text="Label"></asp:Label><asp:Label ID="ClientIDlabel" runat="server" Text="Label"></asp:Label><asp:Label ID="BookingCountlabel" runat="server" Text="Label"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT TimeID, TimeSlot FROM Time WHERE (TimeID NOT IN (SELECT TimeSlotID FROM LearnersBooking WHERE (CONVERT (date, BookingDate, 120) = @BookingDate)))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Calendar1" Name="BookingDate" PropertyName="SelectedDate" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <!-- Instructor & Vehicle Details Section -->
        <div class="details-section">
            <label for="instructor">Choose Instructor:</label>
            <asp:DropDownList ID="InstructorDropDownList" runat="server" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="InstructorID"></asp:DropDownList>
            <div class="styled-button-container">
                <asp:Button ID="Button1" runat="server" Text="Confirm Booking" CssClass="styled-button" OnClick="Button1_Click" />           
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT * FROM [InstructorLtbl]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataInsert" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" DeleteCommand="DELETE FROM [LearnersBooking] WHERE [LBookingID] = @original_LBookingID AND [BookingDate] = @original_BookingDate AND [BookingCount] = @original_BookingCount AND [EnrollmentID] = @original_EnrollmentID AND [InstructorID] = @original_InstructorID AND [ClientID] = @original_ClientID AND [TimeSlotID] = @original_TimeSlotID" InsertCommand="INSERT INTO [LearnersBooking] ([BookingDate], [BookingCount], [EnrollmentID], [InstructorID], [ClientID], [TimeSlotID]) VALUES (@BookingDate, @BookingCount, @EnrollmentID, @InstructorID, @ClientID, @TimeSlotID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [LearnersBooking]" UpdateCommand="UPDATE [LearnersBooking] SET [BookingDate] = @BookingDate, [BookingCount] = @BookingCount, [EnrollmentID] = @EnrollmentID, [InstructorID] = @InstructorID, [ClientID] = @ClientID, [TimeSlotID] = @TimeSlotID WHERE [LBookingID] = @original_LBookingID AND [BookingDate] = @original_BookingDate AND [BookingCount] = @original_BookingCount AND [EnrollmentID] = @original_EnrollmentID AND [InstructorID] = @original_InstructorID AND [ClientID] = @original_ClientID AND [TimeSlotID] = @original_TimeSlotID">
                <DeleteParameters>
                    <asp:Parameter Name="original_LBookingID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="original_BookingDate" />
                    <asp:Parameter Name="original_BookingCount" Type="Int32" />
                    <asp:Parameter Name="original_EnrollmentID" Type="Int32" />
                    <asp:Parameter Name="original_InstructorID" Type="Int32" />
                    <asp:Parameter Name="original_ClientID" Type="Int32" />
                    <asp:Parameter Name="original_TimeSlotID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="BookingDate" PropertyName="SelectedDate" />
                    <asp:ControlParameter ControlID="BookingCountlabel" Name="BookingCount" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="EnrollmentIDlabel" Name="EnrollmentID" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="InstructorDropDownList" Name="InstructorID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="ClientIDlabel" Name="ClientID" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="TimeDropDown" Name="TimeSlotID" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Date" Name="BookingDate" />
                    <asp:Parameter Name="BookingCount" Type="Int32" />
                    <asp:Parameter Name="EnrollmentID" Type="Int32" />
                    <asp:Parameter Name="InstructorID" Type="Int32" />
                    <asp:Parameter Name="ClientID" Type="Int32" />
                    <asp:Parameter Name="TimeSlotID" Type="Int32" />
                    <asp:Parameter Name="original_LBookingID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="original_BookingDate" />
                    <asp:Parameter Name="original_BookingCount" Type="Int32" />
                    <asp:Parameter Name="original_EnrollmentID" Type="Int32" />
                    <asp:Parameter Name="original_InstructorID" Type="Int32" />
                    <asp:Parameter Name="original_ClientID" Type="Int32" />
                    <asp:Parameter Name="original_TimeSlotID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

        <!-- Confirm Booking Button -->
        <%--<a href="#" class="confirm-booking-btn">Confirm Booking</a>--%>
        <div class="cancel-booking-container">
            <asp:Button ID="Button2" runat="server" Text="Cancel Booking" CssClass="cancel-booking-btn" OnClick="Button2_Click" />
        </div>

        <div>
            <asp:Label ID="MessageLabel" runat="server" Text="Label" CssClass="styled-message-label" Visible="False"></asp:Label>
        </div>

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="CancelTableLSqlDataSource" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Visible="False" CssClass="styled-gridview" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ClientID" HeaderText="ClientID" InsertVisible="False" ReadOnly="True" SortExpression="ClientID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
                <asp:BoundField DataField="TimeSlot" HeaderText="TimeSlot" SortExpression="TimeSlot" />
                <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" />
                <asp:BoundField DataField="BookingCount" HeaderText="BookingCount" SortExpression="BookingCount" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <asp:SqlDataSource ID="CancelTableLSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT ClientDetails.ClientID, ClientDetails.Name, ClientDetails.Surname, ClientDetails.EmailAddress, Time.TimeSlot, LearnersBooking.* FROM ClientDetails INNER JOIN LearnersBooking ON ClientDetails.ClientID = LearnersBooking.ClientID INNER JOIN Time ON LearnersBooking.TimeSlotID = Time.TimeID WHERE (ClientDetails.ClientID = @ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ClientIDlabel" Name="ID" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="CancelBookingLabel" runat="server" 
            Text="Dear Client,

        Thank you for reaching out to us regarding your booking with Khwezi Driving School. We are here to assist you with canceling your booking.

        To proceed with the cancellation, kindly follow the steps below:

        Contact Us:

        Call us at 063 402 0199, or
        Email us at khweziDrivingSchool1@gmail.com.
        Provide Required Information:
        Please ensure you include the following details to help us process your cancellation efficiently:

        Your Client ID (e.g., [Client ID])
        Date of Booking (e.g., [Booking Date])
        Time of Booking (e.g., [Booking Time])
        Wait for Confirmation:
        Once we receive your request, we will confirm the cancellation and update you accordingly.

        We appreciate your cooperation and understanding. If you have any further questions or need assistance, feel free to contact us.

        Thank you for choosing Khwezi Driving School." 
            Visible="False" CssClass="cancel-booking-message"></asp:Label>


        <!-- Booking History Section -->
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" BorderWidth="1px" GridLines="Both" Width="889px">
        </asp:GridView>


        <!-- Footer Section -->
        <div class="booking-footer">
            <p>&copy; 2024 Ikhwezi Driving School. All Rights Reserved.</p>
        </div>
    </div>
</asp:Content>
