<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="AtThisPoint.Instructor.Schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <style>
            /* Container styling */
            .container {
                margin-top: 20px;
            }

            /* Table styling for all GridView tables */
            .modern-table {
                width: 100%;
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

            /* Search bar styling */
            #txtSearch {
                margin-right: 10px;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
                width: calc(100% - 20px);
            }

            #btnSearch {
                padding: 8px 16px;
                border: none;
                background-color: #007bff;
                color: white;
                border-radius: 5px;
                cursor: pointer;
            }

            #btnSearch:hover {
                background-color: #0056b3;
            }
        </style>

        <div class="container">
            <h2 class="mt-4">Driver Schedules</h2>

            <!-- Search Bar -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                </div>
            </div>

            <!-- Schedule Table 1 -->
            <asp:GridView ID="GridView1" runat="server" CssClass="modern-table"></asp:GridView>

            <br />

            <!-- Schedule Table 2 -->
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="InstructorID" DataSourceID="SqlDataSource4" CssClass="modern-table">
                <Columns>
                    <asp:BoundField DataField="InstructorID" HeaderText="InstructorID" InsertVisible="False" ReadOnly="True" SortExpression="InstructorID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" />
                    <asp:BoundField DataField="TimeSlot" HeaderText="TimeSlot" SortExpression="TimeSlot" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT InstructorLtbl.InstructorID, InstructorLtbl.FirstName, InstructorLtbl.LastName, LearnersBooking.BookingDate, Time.TimeSlot, ClientDetails.Name FROM ClientDetails INNER JOIN LearnersBooking ON ClientDetails.ClientID = LearnersBooking.ClientID INNER JOIN InstructorLtbl ON LearnersBooking.InstructorID = InstructorLtbl.InstructorID INNER JOIN Time ON LearnersBooking.TimeSlotID = Time.TimeID WHERE (InstructorLtbl.InstructorID = @ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="ID" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" 
                SelectCommand="SELECT InstructorLtbl.InstructorID, InstructorLtbl.FirstName, InstructorLtbl.LastName, LearnersBooking.LBookingID, LearnersBooking.BookingDate, LearnersBooking.BookingCount, LearnersBooking.EnrollmentID, LearnersBooking.ClientID, LearnersBooking.TimeSlotID FROM LearnersBooking INNER JOIN InstructorLtbl ON LearnersBooking.InstructorID = InstructorLtbl.InstructorID WHERE (InstructorLtbl.InstructorID = @id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="id" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br />

            <!-- Schedule Table 3 -->
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" CssClass="modern-table">
                <Columns>
                    <asp:BoundField DataField="InstructorID" HeaderText="InstructorID" InsertVisible="False" ReadOnly="True" SortExpression="InstructorID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" />
                    <asp:BoundField DataField="TimeSlot" HeaderText="TimeSlot" SortExpression="TimeSlot" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT DInstructorTbl.InstructorID, DInstructorTbl.FirstName, DInstructorTbl.LastName, ClientDetails.ClientID, ClientDetails.Name, LicenseBooking.BookingDate, Time.TimeSlot FROM ClientDetails INNER JOIN LicenseBooking ON ClientDetails.ClientID = LicenseBooking.ClientID INNER JOIN Time ON LicenseBooking.TimeSlotID = Time.TimeID INNER JOIN DInstructorTbl ON LicenseBooking.InstructorID = DInstructorTbl.InstructorID WHERE (DInstructorTbl.InstructorID = @ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="ID" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" 
                SelectCommand="SELECT DInstructorTbl.InstructorID, DInstructorTbl.FirstName, DInstructorTbl.LastName, LicenseBooking.DBookingID, LicenseBooking.BookingDate, LicenseBooking.BookingCount, LicenseBooking.EnrollmentID, LicenseBooking.InstructorID AS Expr1, LicenseBooking.VehicleNum, LicenseBooking.ClientID, LicenseBooking.TimeSlotID FROM LicenseBooking INNER JOIN DInstructorTbl ON LicenseBooking.InstructorID = DInstructorTbl.InstructorID WHERE (DInstructorTbl.InstructorID = @ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="ID" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>

