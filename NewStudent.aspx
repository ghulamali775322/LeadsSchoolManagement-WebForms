<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewStudent.aspx.cs" Inherits="LSMS.NewStudent" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Student Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/Leads3.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            padding: 20px;
        }

        .registration-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 800px;
            margin: auto;
            padding: 30px;
            position: relative;
        }

        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            text-decoration: none;
            color: #333;
            font-size: 18px;
            font-weight: bold;
        }

        .back-button:hover {
            color: #4CAF50;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-submit:hover {
            background-color: #45a049;
        }

        .validation-message {
            color: red;
            font-size: 0.9em;
        }
        .message {
    text-align: center;
    margin-top: 10px;
    color: green;
    font-weight: bold;
}
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="registration-container">
            <a href="Dashboard.aspx" class="back-button">&#8592; Back</a> <!-- Back Arrow Button -->

            <h2>New Student Registration</h2>

            <div class="form-group">
                <label for="txtName">Student Name:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                    ErrorMessage="Please enter student name." CssClass="validation-message" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtDOB">Date of Birth:</label>
                <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB" 
                    ErrorMessage="Please select date of birth." CssClass="validation-message" Display="Dynamic" />
            </div>
            <div class="form-group">
                <label for="txtGender">Gender:</label>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem>Select Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="txtFatherName">Father's Name:</label>
                <asp:TextBox ID="txtFatherName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFatherName" runat="server" ControlToValidate="txtFatherName" 
                    ErrorMessage="Please enter father's name." CssClass="validation-message" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtFatherCNIC">Father's CNIC:</label>
                <asp:TextBox ID="txtFatherCNIC" runat="server" CssClass="form-control" MaxLength="15" 
                             placeholder="XXXXX-XXXXXXX-X"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFatherCNIC" runat="server" ControlToValidate="txtFatherCNIC" 
                    ErrorMessage="Please enter CNIC." CssClass="validation-message" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revFatherCNIC" runat="server" ControlToValidate="txtFatherCNIC" 
                    ValidationExpression="^\d{5}-\d{7}-\d{1}$" 
                    ErrorMessage="Invalid CNIC format. Use XXXXX-XXXXXXX-X." CssClass="validation-message" Display="Dynamic" />
            </div>

            <!-- New Class Field -->
            <div class="form-group">
                <label for="ddlClass">Select Class:</label>
                <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control">
                    <asp:ListItem Text="--Select Class--" Value="" />
                    <asp:ListItem Text="Class 1" Value="Class 1" />
                    <asp:ListItem Text="Class 2" Value="Class 2" />
                    <asp:ListItem Text="Class 3" Value="Class 3" />
                    <asp:ListItem Text="Class 4" Value="Class 4" />
                    <asp:ListItem Text="Class 5" Value="Class 5" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvClass" runat="server" ControlToValidate="ddlClass" 
                    InitialValue="" ErrorMessage="Please select a class." CssClass="validation-message" Display="Dynamic" />
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Register Student" CssClass="btn-submit" OnClick="btnSubmit_Click" />
        
         <div class="message">
     <asp:Label ID="lblMessage" runat="server" />
 </div>
            </div>
    </form>
</body>
</html>
