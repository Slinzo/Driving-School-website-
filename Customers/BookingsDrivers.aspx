<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingsDrivers.aspx.cs" Inherits="AtThisPoint.Customers.BookingsDrivers" %>
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


        asp:Calendar {
            width: 100%;
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            background-color: #ffffff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Calendar Date Cells */
        asp:Calendar td, asp:Calendar th {
            padding: 10px;
            border: 1px solid #eee;
            text-align: center;
            font-size: 14px;
            color: #555;
        }

        asp:Calendar .dayHeader {
            background-color: #007bff;
            color: white;
            padding: 5px;
            border: 1px solid #ccc;
        }

        asp:Calendar .selectedDate, asp:Calendar .today {
            background-color: #28a745;
            color: white;
            border-radius: 50%;
            padding: 5px;
        }

        /* Hover Effect */
        asp:Calendar td:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }

        /* Disable dates in past */
        asp:Calendar .disabled-date {
            color: #ccc;
            cursor: not-allowed;
            text-decoration: line-through;
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

        /* Modern button styling */
button, input[type="button"], input[type="submit"] {
    font-family: Arial, sans-serif; /* Clean and professional font */
    background-color: #007BFF; /* Primary blue color */
    color: #fff; /* White text */
    border: none; /* Remove default border */
    padding: 10px 20px; /* Comfortable padding */
    border-radius: 5px; /* Rounded corners for a modern look */
    cursor: pointer; /* Pointer cursor on hover */
    font-size: 14px; /* Readable font size */
    transition: all 0.3s ease; /* Smooth transitions */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
}

/* Hover effect */
button:hover, input[type="button"]:hover, input[type="submit"]:hover {
    background-color: #0056b3; /* Darker shade on hover */
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15); /* Slightly larger shadow */
    transform: translateY(-2px); /* Lift effect */
}

/* Active effect */
button:active, input[type="button"]:active, input[type="submit"]:active {
    background-color: #004085; /* Even darker shade when clicked */
    transform: translateY(0); /* Neutralize lift effect */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Return to original shadow */
}


   .styled-gridview {
        border-collapse: collapse;
        width: 100%;
        margin: 20px 0;
        font-size: 16px;
        text-align: left;
    }

    .styled-gridview th, .styled-gridview td {
        border: 1px solid #ddd;
        padding: 12px 15px;
    }

    .header-style {
        background-color: #4CAF50;
        color: white;
        font-weight: bold;
        text-transform: uppercase;
    }

    .footer-style {
        background-color: #4CAF50;
        color: white;
        font-weight: bold;
    }

    .row-style {
        background-color: #f9f9f9;
    }

    .alt-row {
        background-color: #f1f1f1;
    }

    .row-style:hover, .alt-row:hover {
        background-color: #ddd;
    }

    .selected-row-style {
        background-color: #6c7ae0;
        color: white;
        font-weight: bold;
    }

    .edit-row-style {
        background-color: #ffecb3;
        font-style: italic;
    }

    .pager-style {
        background-color: #f1f1f1;
        text-align: center;
        padding: 10px;
    }

    .styled-gridview th {
        position: sticky;
        top: 0;
        z-index: 1;
    }

    .message-label {
        display: block;
        font-family: Arial, sans-serif;
        font-size: 14px;
        line-height: 1.6;
        color: #333;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        padding: 15px;
        border-radius: 5px;
        width: 90%;
        margin: 20px auto;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

/* Responsive Design */
@media (max-width: 768px) {
    .styled-grid-view {
        font-size: 14px;
    }

    .styled-grid-view td, .styled-grid-view th {
        padding: 8px;
    }
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
            <h2>Code 8 Session Bookings</h2>
        </div>

        <!-- Booking Overview Section -->
        <div class="booking-overview">
            <div class="next-lesson">
                <p>Next Lesson: <asp:Label ID="Label1" runat="server" Text="Label" Visible="True"></asp:Label></p>
                <p>Instructor: <asp:Label ID="InstructorLabel" runat="server" Text="Label" Visible="True"></asp:Label></p>   
                <p>Vehicle: <asp:Label ID="VehicleLabel" runat="server" Text="Label" Visible="True"></asp:Label></p>
                <p>Time: <asp:Label ID="timeLabel" runat="server" Text="Label" Visible="True"></asp:Label></p>
            </div>
            <a href="BookingsDrivers.aspx" class="view-bookings-btn">Refresh</a>
        </div>

        <!-- Date Selector Section -->
        <div class="date-selector">
            <label for="calendar">Select a Date for Booking:</label>
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        </div>

        <!-- Time Slot Dropdown Selector -->
        <div class="time-slots">
            <label for="time-dropdown">Available Time Slots:</label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="TimeSlot" DataValueField="TimeID"></asp:DropDownList>
        </div>

        <asp:Label ID="enrolmentidLabel" runat="server" Text="Label" Visible="True"></asp:Label>
        <asp:Label ID="clientidLabel" runat="server" Text="Label" Visible="True"></asp:Label>
        <asp:Label ID="bookingcountLabel" runat="server" Text="Label" Visible="True"></asp:Label>
        <!-- Instructor & Vehicle Details Section -->
        <div class="details-section">
            <label for="instructor">Choose Instructor:</label>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="InstructorID"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT * FROM [DInstructorTbl]"></asp:SqlDataSource>
            <label for="vehicle">Choose Vehicle:</label>
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="Make" DataValueField="VehicleID"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT * FROM [Code8Vehicle]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT * FROM [AvailCode10Cars]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" DeleteCommand="DELETE FROM [LicenseBooking] WHERE [DBookingID] = @original_DBookingID AND [BookingDate] = @original_BookingDate AND [BookingCount] = @original_BookingCount AND [EnrollmentID] = @original_EnrollmentID AND [InstructorID] = @original_InstructorID AND [ClientID] = @original_ClientID AND [VehicleNum] = @original_VehicleNum AND [TimeSlotID] = @original_TimeSlotID" InsertCommand="INSERT INTO LicenseBooking(BookingDate, BookingCount, EnrollmentID, InstructorID, ClientID, VehicleNum, TimeSlotID) VALUES (@BookingDate, @BookingCount, @EnrollmentID, @InstructorID, @ClientID, @VehicleNum, @TimeSlotID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [LicenseBooking]" UpdateCommand="UPDATE [LicenseBooking] SET [BookingDate] = @BookingDate, [BookingCount] = @BookingCount, [EnrollmentID] = @EnrollmentID, [InstructorID] = @InstructorID, [ClientID] = @ClientID, [VehicleNum] = @VehicleNum, [TimeSlotID] = @TimeSlotID WHERE [DBookingID] = @original_DBookingID AND [BookingDate] = @original_BookingDate AND [BookingCount] = @original_BookingCount AND [EnrollmentID] = @original_EnrollmentID AND [InstructorID] = @original_InstructorID AND [ClientID] = @original_ClientID AND [VehicleNum] = @original_VehicleNum AND [TimeSlotID] = @original_TimeSlotID">
                <DeleteParameters>
                    <asp:Parameter Name="original_DBookingID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="original_BookingDate" />
                    <asp:Parameter Name="original_BookingCount" Type="Int32" />
                    <asp:Parameter Name="original_EnrollmentID" Type="Int32" />
                    <asp:Parameter Name="original_InstructorID" Type="Int32" />
                    <asp:Parameter Name="original_ClientID" Type="Int32" />
                    <asp:Parameter Name="original_VehicleNum" Type="Int32" />
                    <asp:Parameter Name="original_TimeSlotID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="BookingDate" PropertyName="SelectedDate" />
                    <asp:ControlParameter ControlID="bookingcountLabel" Name="BookingCount" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="enrolmentidLabel" Name="EnrollmentID" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="InstructorID" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="clientidLabel" Name="ClientID" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList3" Name="VehicleNum" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="TimeSlotID" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Date" Name="BookingDate" />
                    <asp:Parameter Name="BookingCount" Type="Int32" />
                    <asp:Parameter Name="EnrollmentID" Type="Int32" />
                    <asp:Parameter Name="InstructorID" Type="Int32" />
                    <asp:Parameter Name="ClientID" Type="Int32" />
                    <asp:Parameter Name="VehicleNum" Type="Int32" />
                    <asp:Parameter Name="TimeSlotID" Type="Int32" />
                    <asp:Parameter Name="original_DBookingID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="original_BookingDate" />
                    <asp:Parameter Name="original_BookingCount" Type="Int32" />
                    <asp:Parameter Name="original_EnrollmentID" Type="Int32" />
                    <asp:Parameter Name="original_InstructorID" Type="Int32" />
                    <asp:Parameter Name="original_ClientID" Type="Int32" />
                    <asp:Parameter Name="original_VehicleNum" Type="Int32" />
                    <asp:Parameter Name="original_TimeSlotID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:Button runat="server" Text="Button" OnClick="Unnamed1_Click" />

        

        <!-- Confirm Booking Button -->
        <%--<a href="#" class="confirm-booking-btn">Confirm Booking--%><asp:SqlDataSource ID="SqlDataSource5" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" DeleteCommand="DELETE FROM [LicenseBooking] WHERE [DBookingID] = @original_DBookingID AND [BookingDate] = @original_BookingDate AND [BookingCount] = @original_BookingCount AND [EnrollmentID] = @original_EnrollmentID AND [InstructorID] = @original_InstructorID AND [ClientID] = @original_ClientID AND [VehicleNum] = @original_VehicleNum AND [TimeSlotID] = @original_TimeSlotID" InsertCommand="INSERT INTO [LicenseBooking] ([BookingDate], [BookingCount], [EnrollmentID], [InstructorID], [ClientID], [VehicleNum], [TimeSlotID]) VALUES (@BookingDate, @BookingCount, @EnrollmentID, @InstructorID, @ClientID, @VehicleNum, @TimeSlotID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [LicenseBooking]" UpdateCommand="UPDATE [LicenseBooking] SET [BookingDate] = @BookingDate, [BookingCount] = @BookingCount, [EnrollmentID] = @EnrollmentID, [InstructorID] = @InstructorID, [ClientID] = @ClientID, [VehicleNum] = @VehicleNum, [TimeSlotID] = @TimeSlotID WHERE [DBookingID] = @original_DBookingID AND [BookingDate] = @original_BookingDate AND [BookingCount] = @original_BookingCount AND [EnrollmentID] = @original_EnrollmentID AND [InstructorID] = @original_InstructorID AND [ClientID] = @original_ClientID AND [VehicleNum] = @original_VehicleNum AND [TimeSlotID] = @original_TimeSlotID">

            

            <DeleteParameters>
                <asp:Parameter Name="original_DBookingID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_BookingDate" />
                <asp:Parameter Name="original_BookingCount" Type="Int32" />
                <asp:Parameter Name="original_EnrollmentID" Type="Int32" />
                <asp:Parameter Name="original_InstructorID" Type="Int32" />
                <asp:Parameter Name="original_ClientID" Type="Int32" />
                <asp:Parameter Name="original_VehicleNum" Type="Int32" />
                <asp:Parameter Name="original_TimeSlotID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="BookingDate" />
                <asp:Parameter Name="BookingCount" Type="Int32" />
                <asp:Parameter Name="EnrollmentID" Type="Int32" />
                <asp:Parameter Name="InstructorID" Type="Int32" />
                <asp:Parameter Name="ClientID" Type="Int32" />
                <asp:Parameter Name="VehicleNum" Type="Int32" />
                <asp:Parameter Name="TimeSlotID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="BookingDate" />
                <asp:Parameter Name="BookingCount" Type="Int32" />
                <asp:Parameter Name="EnrollmentID" Type="Int32" />
                <asp:Parameter Name="InstructorID" Type="Int32" />
                <asp:Parameter Name="ClientID" Type="Int32" />
                <asp:Parameter Name="VehicleNum" Type="Int32" />
                <asp:Parameter Name="TimeSlotID" Type="Int32" />
                <asp:Parameter Name="original_DBookingID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_BookingDate" />
                <asp:Parameter Name="original_BookingCount" Type="Int32" />
                <asp:Parameter Name="original_EnrollmentID" Type="Int32" />
                <asp:Parameter Name="original_InstructorID" Type="Int32" />
                <asp:Parameter Name="original_ClientID" Type="Int32" />
                <asp:Parameter Name="original_VehicleNum" Type="Int32" />
                <asp:Parameter Name="original_TimeSlotID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <asp:Button ID="Button1" runat="server" Text="Cancel Booking" OnClick="Button1_Click" />

        <div>
            <asp:Label ID="BookingStatusLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
            <asp:SqlDataSource ID="CancelSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT ClientDetails.ClientID, ClientDetails.Name, ClientDetails.Surname, ClientDetails.EmailAddress, LicenseBooking.BookingDate, LicenseBooking.BookingCount, Time.TimeSlot FROM ClientDetails INNER JOIN LicenseBooking ON ClientDetails.ClientID = LicenseBooking.ClientID INNER JOIN Time ON LicenseBooking.TimeSlotID = Time.TimeID WHERE (ClientDetails.ClientID = @id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="clientidLabel" Name="id" PropertyName="Text" />
                </SelectParameters>
        </asp:SqlDataSource>
          <asp:GridView ID="CancelGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="ClientID" DataSourceID="CancelSqlDataSource" Visible="False" 
    CellPadding="4" ForeColor="#333333" GridLines="None" Width="829px" CssClass="styled-gridview">
    <AlternatingRowStyle CssClass="alt-row" />
    <Columns>
        <asp:BoundField DataField="ClientID" HeaderText="ClientID" InsertVisible="False" ReadOnly="True" SortExpression="ClientID" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
        <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
        <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" />
        <asp:BoundField DataField="BookingCount" HeaderText="BookingCount" SortExpression="BookingCount" />
        <asp:BoundField DataField="TimeSlot" HeaderText="TimeSlot" SortExpression="TimeSlot" />
    </Columns>
    <HeaderStyle CssClass="header-style" />
    <FooterStyle CssClass="footer-style" />
    <RowStyle CssClass="row-style" />
    <EditRowStyle CssClass="edit-row-style" />
    <SelectedRowStyle CssClass="selected-row-style" />
    <PagerStyle CssClass="pager-style" />
</asp:GridView>
            <asp:Label ID="MessageLabel" runat="server" Text="Dear Client ,

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

Thank you for choosing Khwezi Driving School." Visible="False" CssClass="message-label"></asp:Label>

        </a>&nbsp;<!-- Booking History Section --><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT TimeID, TimeSlot FROM Time WHERE (TimeID NOT IN (SELECT TimeSlotID FROM LicenseBooking WHERE (CONVERT (date, BookingDate, 120) = @BookingDate)))">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="BookingDate" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" BorderWidth="1px" Width="889px">
        </asp:GridView>


        <!-- Footer Section -->
        <div class="booking-footer">
            <p>&copy; 2024 Ikhwezi Driving School. All Rights Reserved.</p>
        </div>
    </div>
</asp:Content>
