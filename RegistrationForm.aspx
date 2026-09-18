<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="LSMS.RegistrationForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Registration Form - School Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/lead.jfif');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            max-width: 450px;
            margin: 80px auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="number"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .btn-submit {
            background-color: #3498db;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        .btn-submit:hover {
            background-color: #45a049;
        }

        .message {
            text-align: center;
            margin-top: 10px;
            color: green;
            font-weight: bold;
        }

        .error {
            color: red;
            font-size: 14px;
        }
        .link {
    text-align: center;
    margin-top: 10px;
                    }

    .link a {
    color: #3498db;
    text-decoration: none;
    }

    .link a:hover {
    text-decoration: underline;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Admin Registration Form</h2>

            <div class="form-group">
                <label for="txtFullName">Full Name:</label>
                <asp:TextBox ID="txtFullName" runat="server" />
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Full Name is required!" CssClass="error" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" />
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required!" CssClass="error" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required!" CssClass="error" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format!" CssClass="error" Display="Dynamic" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" />
            </div>

            <div class="form-group">
                <label for="txtContactNumber">Contact Number:</label>
                <asp:TextBox ID="txtContactNumber" runat="server" TextMode="Number" />
                <asp:RequiredFieldValidator ID="rfvContactNumber" runat="server" ControlToValidate="txtContactNumber" ErrorMessage="Contact Number is required!" CssClass="error" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revContactNumber" runat="server" ControlToValidate="txtContactNumber" ErrorMessage="Contact Number must be 11 digits!" CssClass="error" Display="Dynamic" ValidationExpression="^\d{11}$" />
            </div>

            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required!" CssClass="error" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtConfirmPassword">Confirm Password:</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" OnTextChanged="txtConfirmPassword_TextChanged" />
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm Password is required!" CssClass="error" Display="Dynamic" />
                <asp:CompareValidator ID="cvPasswords" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match!" CssClass="error" Display="Dynamic" />
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Register Admin" CssClass="btn-submit" OnClick="btnRegister_Click" />
            <div class="link">
    <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="LoginForm.aspx">Already have an account? log in</asp:HyperLink>
</div>
            <div class="message">
                <asp:Label ID="lblMessage" runat="server" />
            </div>
        </div>
    </form>
</body>
</html>
