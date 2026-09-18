<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewStaff.aspx.cs" Inherits="LSMS.NewStaff" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Staff Registration</title>
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
</head>
<body>
    <form id="form1" runat="server">
        <div class="registration-container">
            <a href="Dashboard.aspx" class="back-button">&#8592; Back</a> 

            <h2>New Staff Registration</h2>


            <div class="form-group">
                <label for="txtStaffName">Full Name:</label>
                <asp:TextBox ID="txtStaffName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvStaffName" runat="server" ControlToValidate="txtStaffName" 
                    ErrorMessage="Please enter full name." CssClass="validation-message" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="ddlGender">Gender:</label>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem Text="--Select Gender--" Value="" />
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" 
                    InitialValue="" ErrorMessage="Please select gender." CssClass="validation-message" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtDOB">Date of Birth:</label>
                <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB" 
                    ErrorMessage="Please select date of birth." CssClass="validation-message" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtCNIC">CNIC:</label>
                <asp:TextBox ID="txtCNIC" runat="server" CssClass="form-control" MaxLength="15" placeholder="XXXXX-XXXXXXX-X"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCNIC" runat="server" ControlToValidate="txtCNIC" 
                    ErrorMessage="Please enter CNIC." CssClass="validation-message" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revCNIC" runat="server" ControlToValidate="txtCNIC" 
                    ValidationExpression="^\d{5}-\d{7}-\d{1}$" 
                    ErrorMessage="Invalid CNIC format. Use XXXXX-XXXXXXX-X." CssClass="validation-message" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtPhone">Phone Number:</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" 
                    ErrorMessage="Please enter phone number." CssClass="validation-message" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                    ErrorMessage="Please enter email." CssClass="validation-message" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                    ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                    ErrorMessage="Invalid email format." CssClass="validation-message" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="ddlDesignation">Designation:</label>
                <asp:DropDownList ID="ddlDesignation" runat="server">
                    <asp:ListItem Text="--Select Designation--" Value="" />
                    <asp:ListItem Text="Teacher" Value="Teacher" />
                    <asp:ListItem Text="Principal" Value="Principal" />
                    <asp:ListItem Text="Accountant" Value="Accountant" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvDesignation" runat="server" ControlToValidate="ddlDesignation" 
                    InitialValue="" ErrorMessage="Please select a designation." CssClass="validation-message" Display="Dynamic" />
            </div>
             <div class="form-group">
                <label for="txtQualification">Qualification:</label>
                <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvQualification" runat="server" ControlToValidate="txtQualification" 
                    ErrorMessage="Please enter qualification." CssClass="validation-message" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtSalary">Salary:</label>
                <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvSalary" runat="server" ControlToValidate="txtSalary" 
                    ErrorMessage="Please enter salary." CssClass="validation-message" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revSalary" runat="server" ControlToValidate="txtSalary" 
                    ValidationExpression="^\d+(\.\d{1,2})?$" ErrorMessage="Invalid salary format." CssClass="validation-message" Display="Dynamic" />
            </div>
            <div class="form-group">
                <label for="txtJoiningDate">Joining Date:</label>
                <asp:TextBox ID="txtJoiningDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvJoiningDate" runat="server" ControlToValidate="txtJoiningDate" 
                    ErrorMessage="Please select joining date." CssClass="validation-message" Display="Dynamic" />
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Register Staff" CssClass="btn-submit" OnClick="btnSubmit_Click" />

            <div class="message">
                <asp:Label ID="lblMessage" runat="server" />
            </div>
        </div>
    </form>
</body>
</html>
