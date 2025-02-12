<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AtThisPoint.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
<style>
    /* Body Styling */
    body {
        background-color: #f0f4f8;
        font-family: 'Arial', sans-serif;
        color: #333;
        padding: 0;
        margin: 0;
    }

    /* Header */
    h2 {
        text-align: center;
        margin-top: 50px;
        color: #333;
        font-size: 32px;
        font-weight: bold;
    }

    /* Container */
    .row {
        display: flex;
        justify-content: center;
        margin-top: 30px;
    }

    /* Left Column - Login Form */
    #loginForm {
        background-color: #fff;
        padding: 30px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        width: 100%;
        max-width: 500px;
    }

    /* Form Headers */
    #loginForm h4 {
        font-size: 24px;
        color: #333;
        text-align: center;
        margin-bottom: 20px;
    }

    /* Input Fields */
    .form-group {
        margin-bottom: 20px;
    }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-control:focus {
            border-color: #66afe9;
            outline: none;
        }

    /* Error Message */
    .text-danger {
        color: #ff4d4d;
        font-size: 14px;
    }

    /* Remember Me Section */
    .checkbox {
        font-size: 14px;
        color: #555;
    }

    .checkbox label {
        font-weight: normal;
    }

    /* Hyperlinks */
    .text-center p a {
        color: #007bff;
        text-decoration: none;
        font-size: 14px;
    }

    .text-center p a:hover {
        text-decoration: underline;
    }

         /* Button styling */
        .btn {
            display: inline-block;
            padding: 12px 28px;
            font-size: 14px;
            /font-weight: bold;/
            text-align: center;
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #003f7d;
        }


    /* Right Column - Social Media Login (Hidden) */
    #socialLoginForm {
        background-color: #fff;
        padding: 30px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        margin-left: 30px;
        width: 100%;
        max-width: 350px;
        text-align: center;
        display: none; /* Hides the social login form */
    }

    #socialLoginForm h4 {
        font-size: 18px;
        color: #333;
        margin-bottom: 20px;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .row {
            flex-direction: column;
            align-items: center;
        }

        #socialLoginForm {
            margin-left: 0;
            margin-top: 30px;
        }
    }
</style>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Use a local account to log in.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <p>
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                </p>
                <p>
                    <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                    --%>
                </p>
            </section>
        </div>

        <div class="col-md-4" style="display: none;"> <!-- This makes the column hidden -->
            <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>
        </div>
    </div>
</asp:Content>
