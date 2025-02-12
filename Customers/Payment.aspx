<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="AtThisPoint.Customers.Payment" %>
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
        .payment-container {
            width: 800px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
        }

        /* Header Section */
        .payment-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .payment-header h2 {
            color: #333;
            font-size: 28px;
            font-weight: bold;
        }

        /* Payment Overview Section */
        .payment-overview {
            display: flex;
            justify-content: space-between;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .payment-overview .amount-due {
            font-size: 24px;
            color: #e74c3c;
            font-weight: bold;
        }

        .payment-overview button, 
        .payment-overview .make-payment-btn {
            background-color: #007bff;
            color: #fff;
            padding: 12px 20px;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .payment-overview button:hover, 
        .payment-overview .make-payment-btn:hover {
            background-color: #0056b3;
        }

        /* Payment History Section */
        .payment-history {
            margin-bottom: 30px;
        }

        .payment-history h3 {
            color: #333;
            font-size: 20px;
            margin-bottom: 10px;
        }

        /* Input Fields */
        .payment-history input[type="text"], 
        .payment-history select, 
        .payment-history .asp-textbox {
            width: 100%;
            max-width: 300px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 5px 0;
            font-size: 14px;
        }

        .payment-history .view-btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .payment-history .view-btn:hover {
            background-color: #0056b3;
        }

        /* Table Styling */
        .payment-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            font-size: 14px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .payment-table th, .payment-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .payment-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .payment-table tr:hover {
            background-color: #f9f9f9;
        }

        /* Footer Section */
        .payment-footer {
            text-align: center;
            color: #555;
            font-size: 14px;
            margin-top: 40px;
        }

        /* Mobile Responsiveness */
        @media (max-width: 600px) {
            .payment-container {
                width: 100%;
                padding: 10px;
            }

            .payment-overview {
                flex-direction: column;
                align-items: center;
            }

            .payment-overview button, 
            .payment-overview .make-payment-btn, 
            .payment-history .view-btn {
                margin-top: 10px;
                width: 100%;
            }
        }
    </style>

    <script type="text/javascript">
        function allowOnlyIntegers(event) {
            // Allow: Backspace, Delete, Tab, Escape, Enter, and Arrow keys
            if (event.key === "Backspace" || event.key === "Delete" || event.key === "Tab" || event.key === "Escape" || event.key === "Enter" || (event.key.length === 1 && /[0-9]/.test(event.key))) {
                return true; // Allow key
            }
            // Prevent any other input
            event.preventDefault();
            return false;
        }
    </script>


    <!-- Main Payment Container -->
    <div class="payment-container">
        <!-- Header Section -->
        <div class="payment-header">
            <h2>Manage Payments</h2>
        </div>

        <!-- Payment Overview Section -->
        <div class="payment-overview">
            <div>
                <p class="amount-due">Amount Due: <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></p>
            </div>
            <asp:Button ID="Button3" runat="server" CssClass="make-payment-btn" Text="DummyPay" OnClick="Button3_Click" Visible="False" />
            <asp:Button ID="Button2" runat="server" CssClass="make-payment-btn" OnClick="Button2_Click" Text="Pay Now" />
            <a href="Payment.aspx" class="make-payment-btn">Refresh</a>
        </div>

        <asp:Label ID="MessageLabel" runat="server" Text="Label" Visible="False"></asp:Label>

        <!-- Payment History Section -->
        <div class="payment-history">
            <h3>
                Payment History
            </h3>
            <asp:Label ID="Label1" runat="server" Text="Payment History of: "></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" Width="231px" ReadOnly="True"></asp:TextBox>


            <asp:Button ID="Button1" runat="server" Text="Press here to view..." CssClass="view-btn" OnClick="Button1_Click" />

            <div>
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>Debit Card</asp:ListItem>
                    <asp:ListItem>Credit Card</asp:ListItem>
                </asp:DropDownList>
                <!-- Apply onkeypress event to restrict input -->
                <asp:TextBox ID="dcnoTextBox" runat="server" placeholder="Credit Card No." Visible="False" onkeypress="return allowOnlyIntegers(event);"></asp:TextBox>
                <asp:TextBox ID="ccnoTextBox" runat="server" placeholder="Debit Card No." Visible="False" onkeypress="return allowOnlyIntegers(event);"></asp:TextBox>
                <asp:TextBox ID="exprnoTextBox" runat="server" placeholder="Expiry No." onkeypress="return allowOnlyIntegers(event);"></asp:TextBox>
                <asp:TextBox ID="amntTextBox" runat="server" placeholder="Enter Amount" onkeypress="return allowOnlyIntegers(event);"></asp:TextBox>
                <asp:TextBox ID="dateTextBox" runat="server" Visible="False"></asp:TextBox>
            </div>



            <!-- Payment Table -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PaymentID" DataSourceID="SqlDataSource1" CssClass="payment-table">
                <Columns>
                    <asp:BoundField DataField="PaymentID" HeaderText="PaymentID" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="EnrollmentID" HeaderText="EnrollmentID" Visible="False" />
                    <asp:BoundField DataField="ClientID" HeaderText="ClientID" Visible="False" />
                    <asp:BoundField DataField="PaymentMode" HeaderText="PaymentMode" />
                    <asp:BoundField DataField="CreditCardNo" HeaderText="CreditCardNo" Visible="False" />
                    <asp:BoundField DataField="DebitCardNo" HeaderText="DebitCardNo" Visible="False" />
                    <asp:BoundField DataField="ExpiryNo" HeaderText="ExpiryNo" Visible="False" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:C2}" />
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" Visible="False" />
                    <asp:BoundField DataField="Outstanding Balance" HeaderText="Outstanding Balance" DataFormatString="{0:C2}" Visible="False" />
                </Columns>
            </asp:GridView>
        </div>

        <asp:Label ID="clientIdLabel" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="enrolementIdLabel" runat="server" Text="Label" Visible="False"></asp:Label>

                <asp:SqlDataSource ID="SqlUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT * FROM [ClientDetails]" DeleteCommand="DELETE FROM [ClientDetails] WHERE [ClientID] = @ClientID" InsertCommand="INSERT INTO [ClientDetails] ([Name], [Surname], [IDNumber], [Gender], [Nationality], [Age], [DateOfBirth], [CellphoneNumber], [EmailAddress], [StreetName], [City], [PostalCode], [Outstanding Balance]) VALUES (@Name, @Surname, @IDNumber, @Gender, @Nationality, @Age, @DateOfBirth, @CellphoneNumber, @EmailAddress, @StreetName, @City, @PostalCode, @Outstanding_Balance)" UpdateCommand="UPDATE ClientDetails SET [Outstanding Balance] = @Outstanding_Balance - @Amount WHERE (ClientID = @ClientID)">
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
                        <asp:ControlParameter ControlID="Label3" Name="Outstanding_Balance" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="clientIdLabel" Name="ClientID" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="amntTextBox" Name="Amount" PropertyName="Text" />
                    </UpdateParameters>
                </asp:SqlDataSource>

        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>

        <asp:SqlDataSource ID="SqlDataSourceInsert" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" DeleteCommand="DELETE FROM [Payment] WHERE [PaymentID] = @original_PaymentID AND [EnrollmentID] = @original_EnrollmentID AND [ClientID] = @original_ClientID AND [PaymentMode] = @original_PaymentMode AND (([CreditCardNo] = @original_CreditCardNo) OR ([CreditCardNo] IS NULL AND @original_CreditCardNo IS NULL)) AND (([DebitCardNo] = @original_DebitCardNo) OR ([DebitCardNo] IS NULL AND @original_DebitCardNo IS NULL)) AND (([ExpiryNo] = @original_ExpiryNo) OR ([ExpiryNo] IS NULL AND @original_ExpiryNo IS NULL)) AND [Amount] = @original_Amount AND [Date] = @original_Date" InsertCommand="INSERT INTO [Payment] ([EnrollmentID], [ClientID], [PaymentMode], [CreditCardNo], [DebitCardNo], [ExpiryNo], [Amount], [Date]) VALUES (@EnrollmentID, @ClientID, @PaymentMode, @CreditCardNo, @DebitCardNo, @ExpiryNo, @Amount, @Date)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Payment]" UpdateCommand="UPDATE [Payment] SET [EnrollmentID] = @EnrollmentID, [ClientID] = @ClientID, [PaymentMode] = @PaymentMode, [CreditCardNo] = @CreditCardNo, [DebitCardNo] = @DebitCardNo, [ExpiryNo] = @ExpiryNo, [Amount] = @Amount, [Date] = @Date WHERE [PaymentID] = @original_PaymentID AND [EnrollmentID] = @original_EnrollmentID AND [ClientID] = @original_ClientID AND [PaymentMode] = @original_PaymentMode AND (([CreditCardNo] = @original_CreditCardNo) OR ([CreditCardNo] IS NULL AND @original_CreditCardNo IS NULL)) AND (([DebitCardNo] = @original_DebitCardNo) OR ([DebitCardNo] IS NULL AND @original_DebitCardNo IS NULL)) AND (([ExpiryNo] = @original_ExpiryNo) OR ([ExpiryNo] IS NULL AND @original_ExpiryNo IS NULL)) AND [Amount] = @original_Amount AND [Date] = @original_Date">
                <DeleteParameters>
                    <asp:Parameter Name="original_PaymentID" Type="Int32" />
                    <asp:Parameter Name="original_EnrollmentID" Type="Int32" />
                    <asp:Parameter Name="original_ClientID" Type="Int32" />
                    <asp:Parameter Name="original_PaymentMode" Type="String" />
                    <asp:Parameter Name="original_CreditCardNo" Type="Int32" />
                    <asp:Parameter Name="original_DebitCardNo" Type="Int32" />
                    <asp:Parameter Name="original_ExpiryNo" Type="Int32" />
                    <asp:Parameter Name="original_Amount" Type="Decimal" />
                    <asp:Parameter DbType="Date" Name="original_Date" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="enrolementIdLabel" Name="EnrollmentID" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="clientIdLabel" Name="ClientID" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="PaymentMode" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="ccnoTextBox" Name="CreditCardNo" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="dcnoTextBox" Name="DebitCardNo" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="exprnoTextBox" Name="ExpiryNo" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="amntTextBox" Name="Amount" PropertyName="Text" Type="Decimal" />
                    <asp:ControlParameter ControlID="dateTextBox" DbType="Date" Name="Date" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EnrollmentID" Type="Int32" />
                    <asp:Parameter Name="ClientID" Type="Int32" />
                    <asp:Parameter Name="PaymentMode" Type="String" />
                    <asp:Parameter Name="CreditCardNo" Type="Int32" />
                    <asp:Parameter Name="DebitCardNo" Type="Int32" />
                    <asp:Parameter Name="ExpiryNo" Type="Int32" />
                    <asp:Parameter Name="Amount" Type="Decimal" />
                    <asp:Parameter DbType="Date" Name="Date" />
                    <asp:Parameter Name="original_PaymentID" Type="Int32" />
                    <asp:Parameter Name="original_EnrollmentID" Type="Int32" />
                    <asp:Parameter Name="original_ClientID" Type="Int32" />
                    <asp:Parameter Name="original_PaymentMode" Type="String" />
                    <asp:Parameter Name="original_CreditCardNo" Type="Int32" />
                    <asp:Parameter Name="original_DebitCardNo" Type="Int32" />
                    <asp:Parameter Name="original_ExpiryNo" Type="Int32" />
                    <asp:Parameter Name="original_Amount" Type="Decimal" />
                    <asp:Parameter DbType="Date" Name="original_Date" />
                </UpdateParameters>
                </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:G1Wst2024ConnectionString %>" SelectCommand="SELECT Payment.PaymentID, Payment.EnrollmentID, Payment.ClientID, Payment.PaymentMode, Payment.CreditCardNo, Payment.DebitCardNo, Payment.ExpiryNo, Payment.Amount, Payment.Date, ClientDetails.EmailAddress, ClientDetails.[Outstanding Balance] FROM ClientDetails INNER JOIN Payment ON ClientDetails.ClientID = Payment.ClientID WHERE (ClientDetails.EmailAddress = @EmailAddress)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtEmail" Name="EmailAddress" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

        <!-- Footer Section -->
        <div class="payment-footer">
            <p>For any queries, please contact support at <strong>kumalonesh@gmail.com</strong></p>
        </div>
    </div>

</asp:Content>
