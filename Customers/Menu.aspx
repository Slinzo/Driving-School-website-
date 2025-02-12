<%@ Page Title="Menu" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="AtThisPoint.Customers.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #f0f4f8;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        /* Page Title Styling */
        .page-title {
            position: absolute;
            top: 5px !important;
            right: 50px !important;
            font-size: 1.8em !important;
            font-weight: bold !important;
            color: #003366 !important;
            letter-spacing: 1px !important;
        }

        /* Menu Container */
        .menu-container {
            display: flex !important;
            flex-direction: column !important;
            align-items: center !important;
            justify-content: center !important;
            min-height: 100vh !important;
            position: relative !important;
            background: linear-gradient(135deg, #f5f7fa, #d1e9fc) !important;
        }

        /* Card Container */
        .card-container {
            display: flex !important;
            justify-content: space-around !important;
            flex-wrap: wrap !important;
            margin: 20px !important;
        }

        /* Card Styling */
        .card {
            background-color: #f4f4f4 !important;
            padding: 20px !important;
            margin: 15px !important;
            width: 220px !important;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15) !important;
            border-radius: 15px !important;
            text-align: center !important;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out !important;
            border-top: 5px solid transparent !important;
        }

        /* Card Hover Effect */
        .card:hover {
            background-color: #e6f7ff !important;
            transform: scale(1.08) !important;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.25) !important;
        }

        /* Card Titles */
        .card h3 {
            margin-bottom: 15px !important;
            font-size: 1.4em !important;
            color: #003366 !important;
        }

        /* Card Paragraphs */
        .card p {
            margin-bottom: 20px !important;
            color: #666 !important;
        }

        /* Themed Border Colors */
        #profile { border-top-color: red !important; }
        #packages { border-top-color: black !important; }
        #bookingdrivers { border-top-color: yellow !important; }
        #bookingdrivers10 { border-top-color: #003366 !important; }
        #bookinglearners { border-top-color: yellow !important; }
        #payment { border-top-color: #003366 !important; }
        #support { border-top-color: red !important; }
        #exit { border-top-color: black !important; }

        /* Button Styling */
        .card button {
            background: linear-gradient(45deg, #007bff, #00c6ff) !important;
            color: white !important;
            border: none !important;
            padding: 12px 25px !important;
            cursor: pointer !important;
            border-radius: 25px !important;
            font-size: 1em !important;
            transition: background 0.3s ease, transform 0.3s ease !important;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1) !important;
        }

        /* Button Hover Effect */
        .card button:hover {
            background: linear-gradient(45deg, #00c6ff, #007bff) !important;
            transform: translateY(-2px) !important;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2) !important;
        }

        /* Mobile Responsiveness */
        /*@media (max-width: 600px) {
            .card-container {
                flex-direction: column !important;
                align-items: center !important;
            }
            .card {
                width: 90% !important;
            }
        }*/
    </style>

    <div class="menu-container">
        <h1 class="page-title">Main Menu</h1>
        <div class="card-container">
            <div class="card" id="profile">
                <h3>Profile</h3>
                <p>Manage your profile details</p>
                <asp:Button ID="ProfileButton" runat="server" Text="Go to Profile" OnClick="ProfileButton_Click" />
            </div>
            <div class="card" id="packages">
                <h3>Pick Your Package</h3>
                <p>Explore Our Packages, Find Your Perfect Fit!</p>
                <asp:Button ID="AvPackagesButton" runat="server" Text="View Packages" OnClick="AvPackagesButton_Click" />
            </div>
            <div class="card" id="bookingdrivers">
                <h3>Small Car Big Skills</h3>
                <p>Book your code 8 appointments</p>
                <asp:Button ID="MakeBookingButton" runat="server" Text="Make a Booking" OnClick="MakeBookingButton_Click" />
            </div>
            <div class="card" id="bookingdrivers10">
                <h3>Go Big Or Code 10</h3>
                <p>Book your code 10 appointments</p>
                <asp:Button ID="Button1" runat="server" Text="Reserve Your Spot" OnClick="Button1_Click"/>
            </div>
            <div class="card" id="bookinglearners">
                <h3>Gear Up for Success</h3>
                <p>Book your learners licence appointments</p>
                <asp:Button ID="LearnersButton" runat="server" Text="Book Now" OnClick="LearnersButton_Click" />
            </div>
            <div class="card" id="payment">
                <h3>Track Payments, Stay Informed</h3>
                <p>View and track your payment history </p>
                <asp:Button ID="PaymentsButton" runat="server" Text="Go to Payments" OnClick="PaymentsButton_Click" />
            </div>

<%--            <div class="card" id="support">
                <h3>Rate Us</h3>
                <p>Help us improve</p>
                <asp:Button ID="SupportButton" runat="server" Text="Support" OnClick="SupportButton_Click" />
            </div>--%>
            <div class="card" id="exit">
                <h3>Back To Home</h3>
                <p>Exit the application</p>
                <asp:Button ID="ExitButton" runat="server" Text="Exit" OnClick="ExitButton_Click" />
            </div>
        </div>
    </div>
</asp:Content>

