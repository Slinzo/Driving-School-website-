<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingsDrivers10.aspx.cs" Inherits="AtThisPoint.Customers.BookingsDrivers10" %>
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


        .date-selector label {
            font-size: 16px;
            color: #333;
            font-weight: bold;
            margin-bottom: 10px;
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

        .customButton {
            background-color: #4CAF50; /* Green background */
            color: white;              /* White text */
            padding: 10px 20px;        /* Padding around the text */
            border: none;              /* No borders */
            border-radius: 5px;        /* Rounded corners */
            font-size: 16px;           /* Font size */
            cursor: pointer;          /* Pointer cursor on hover */
            transition: background-color 0.3s ease; /* Smooth background transition */
        }

        .customButton:hover {
            background-color: #45a049; /* Darker green on hover */
        }

        .cancelButton {
            background-color: #f44336; /* Red background */
            color: white;              /* White text */
            padding: 10px 20px;        /* Padding around the text */
            border: none;              /* No borders */
            border-radius: 5px;        /* Rounded corners */
            font-size: 16px;           /* Font size */
            cursor: pointer;          /* Pointer cursor on hover */
            transition: background-color 0.3s ease; /* Smooth background transition */
        }

        .cancelButton:hover {
            background-color: #e53935; /* Darker red on hover */
        }

            .customGridView {
        border-collapse: collapse; /* Collapse table borders */
        width: 100%;                /* Make it responsive */
        font-family: Arial, sans-serif;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow for better depth */
    }

    .customGridView th, .customGridView td {
        padding: 12px;             /* Add padding to cells for spacing */
        text-align: left;          /* Align text to the left */
        border-bottom: 1px solid #ddd; /* Light grey border between rows */
    }

    .customGridView th {
        background-color: #507CD1; /* Header background color */
        color: white;              /* White text color for header */
        font-size: 16px;           /* Set header font size */
        font-weight: bold;         /* Bold header text */
    }

    .customGridView tr:nth-child(even) {
        background-color: #F9F9F9; /* Alternating row background */
    }

    .customGridView tr:hover {
        background-color: #f1f1f1; /* Light grey background on hover */
        cursor: pointer;           /* Change cursor to pointer for interactivity */
    }

    .customGridView .footerStyle, .customGridView .pagerStyle {
        background-color: #2461BF; /* Footer and pager background */
        color: white;              /* White text color */
        font-weight: bold;
    }

    .customGridView .selectedRowStyle {
        background-color: #D1DDF1; /* Highlight selected row */
        font-weight: bold;
    }

    .customGridView .sortedAscendingHeaderStyle, .customGridView .sortedDescendingHeaderStyle {
        background-color: #6D95E1; /* Change sorted header color */
    }

    .customGridView .sortedAscendingCellStyle, .customGridView .sortedDescendingCellStyle {
        background-color: #F5F7FB; /* Cell background when sorted */
    }

 
    .message-label {
        display: block;
        font-family: Arial, sans-serif;
        font-size: 14px;
        line-height: 1.6;
        color: #333;
        background-color: #fdfdfd;
        border: 1px solid #ccc;
        padding: 15px;
        border-radius: 5px;
        width: 90%;
        max-width: 800px;
        margin: 20px auto;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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
            <h2>Code 10 Session Bookings</h2>
        </div>

        <!-- Booking Overview Section -->
        <div class="booking-overview">
            <div class="next-lesson">
                <p>Next Lesson: <asp:Label ID="dateLabel" runat="server" Text="Label" Visible="True"></asp:Label></p>
                <p>Instructor: <asp:Label ID="InstructorLabel" runat="server" Text="Label" Visible="True"></asp:Label></p>   
                <p>Vehicle: <asp:Label ID="VehicleLabel" runat="server" Text="Label" Visible="True"></asp:Label></p>
                <p>Time: <asp:Label ID="timeLabel" runat="server" Text="Label" Visible="True"></asp:Label></p>
            </div>
            <a href="BookingsDrivers10.aspx" class="view-bookings-btn">Refresh</a>
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

        <!-- Instructor & Vehicle Details Section -->
        <div class="details-section">
            <label for="instructor">Choose Instructor:</label>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="InstructorID"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT * FROM [DInstructorTbl]"></asp:SqlDataSource>
            <label for="vehicle">Choose Vehicle:</label>
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Make" DataValueField="VehicleID"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT * FROM [AvailCode10Cars]"></asp:SqlDataSource>
        </div>

        <asp:Label ID="enrolmentIdLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="clientIdLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="bookingCountLabel" runat="server" Text="Label" Visible="False"></asp:Label>

        <!-- Confirm Booking Button -->   

        <asp:Button ID="book10Button" runat="server" Text="Book Now" OnClick="book10Button_Click" CssClass="customButton" />

        

        <!-- Booking History Section -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT TimeID, TimeSlot FROM Time WHERE (TimeID NOT IN (SELECT TimeSlotID FROM LicenseBooking WHERE (CONVERT (date, BookingDate, 120) = @BookingDate)))">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="BookingDate" PropertyName="SelectedDate" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Button ID="Button1" runat="server" Text="Cancel Booking" OnClick="Button1_Click" CssClass="cancelButton" />

        <div>
            <asp:Label ID="booKingLabel" runat="server" Text="Label" Visible="True"></asp:Label>
        </div>
        <asp:SqlDataSource ID="CancelSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT ClientDetails.ClientID, ClientDetails.Name, ClientDetails.Surname, ClientDetails.EmailAddress, LicenseBooking.BookingDate, LicenseBooking.BookingCount, Time.TimeSlot FROM ClientDetails INNER JOIN LicenseBooking ON ClientDetails.ClientID = LicenseBooking.ClientID INNER JOIN Time ON LicenseBooking.TimeSlotID = Time.TimeID WHERE (ClientDetails.ClientID = @ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="clientIdLabel" Name="ID" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="CancelGridView" runat="server" Visible="False" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ClientID" DataSourceID="CancelSqlDataSource" ForeColor="#333333" GridLines="None" Width="100%" CssClass="customGridView">
            <AlternatingRowStyle BackColor="#F9F9F9" />
            <Columns>
                <asp:BoundField DataField="ClientID" HeaderText="ClientID" InsertVisible="False" ReadOnly="True" SortExpression="ClientID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
                <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" />
                <asp:BoundField DataField="BookingCount" HeaderText="BookingCount" SortExpression="BookingCount" />
                <asp:BoundField DataField="TimeSlot" HeaderText="TimeSlot" SortExpression="TimeSlot" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="40px" Font-Size="14px" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" Font-Size="14px" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

          <asp:Label ID="Label1" runat="server" Text="Dear Client ,

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

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" BorderWidth="1px" GridLines="Both" Width="889px">
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" DeleteCommand="DELETE FROM [LicenseBooking] WHERE [DBookingID] = @original_DBookingID AND [BookingDate] = @original_BookingDate AND [BookingCount] = @original_BookingCount AND [EnrollmentID] = @original_EnrollmentID AND [InstructorID] = @original_InstructorID AND [ClientID] = @original_ClientID AND [VehicleNum] = @original_VehicleNum AND [TimeSlotID] = @original_TimeSlotID" InsertCommand="INSERT INTO [LicenseBooking] ([BookingDate], [BookingCount], [EnrollmentID], [InstructorID], [ClientID], [VehicleNum], [TimeSlotID]) VALUES (@BookingDate, @BookingCount, @EnrollmentID, @InstructorID, @ClientID, @VehicleNum, @TimeSlotID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [LicenseBooking]" UpdateCommand="UPDATE [LicenseBooking] SET [BookingDate] = @BookingDate, [BookingCount] = @BookingCount, [EnrollmentID] = @EnrollmentID, [InstructorID] = @InstructorID, [ClientID] = @ClientID, [VehicleNum] = @VehicleNum, [TimeSlotID] = @TimeSlotID WHERE [DBookingID] = @original_DBookingID AND [BookingDate] = @original_BookingDate AND [BookingCount] = @original_BookingCount AND [EnrollmentID] = @original_EnrollmentID AND [InstructorID] = @original_InstructorID AND [ClientID] = @original_ClientID AND [VehicleNum] = @original_VehicleNum AND [TimeSlotID] = @original_TimeSlotID">
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
                <asp:ControlParameter ControlID="bookingCountLabel" Name="BookingCount" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="enrolmentIdLabel" Name="EnrollmentID" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList2" Name="InstructorID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="clientIdLabel" Name="ClientID" PropertyName="Text" Type="Int32" />
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

        <!-- Footer Section -->
        <div class="booking-footer">
            <p>&copy; 2024 Ikhwezi Driving School. All Rights Reserved.</p>
        </div>
    </div>
</asp:Content>
