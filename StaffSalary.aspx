<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffSalary.aspx.cs" Inherits="LSMS.StaffSalary" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Salary</title>
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

        .salary-container {
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
        .success-message {
            text-align: center;
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="salary-container">
            <a href="Dashboard.aspx" class="back-button">&#8592; Back</a>

            <h2>Staff Salary</h2>

            <!-- Staff Name Field (Dropdown) -->
            <div class="form-group">
                <label for="ddlStaffName">Staff Name:</label>
                <asp:DropDownList ID="ddlStaffName" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlStaffName_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvStaffName" runat="server" ControlToValidate="ddlStaffName" 
                    InitialValue="" ErrorMessage="Please select a staff name." CssClass="validation-message" Display="Dynamic" />
            </div>

            <!-- Staff ID Field (Auto-filled) -->
            <div class="form-group">
                <label for="txtStaffID">Staff ID:</label>
                <asp:TextBox ID="txtStaffID" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <!-- Salary Amount Field -->
            <div class="form-group">
                <label for="txtSalary">Salary Amount:</label>
                <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" placeholder="Enter salary amount"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvSalary" runat="server" ControlToValidate="txtSalary" 
                    ErrorMessage="Please enter salary amount." CssClass="validation-message" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revSalary" runat="server" ControlToValidate="txtSalary" 
                    ValidationExpression="^\d+(\.\d{1,2})?$" 
                    ErrorMessage="Invalid amount. Only numeric values allowed." CssClass="validation-message" Display="Dynamic" />
            </div>

            <!-- Payment Date Field -->
            <div class="form-group">
                <label for="txtPaymentDate">Payment Date:</label>
                <asp:TextBox ID="txtPaymentDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPaymentDate" runat="server" ControlToValidate="txtPaymentDate" 
                    ErrorMessage="Please select payment date." CssClass="validation-message" Display="Dynamic" />
            </div>

            <!-- Payment Method Field -->
            <div class="form-group">
                <label for="ddlPaymentMode">Payment Mode:</label>
                <asp:DropDownList ID="ddlPaymentMode" runat="server" CssClass="form-control">
                    <asp:ListItem Text="--Select Payment Mode--" Value="" />
                    <asp:ListItem Text="Cash" Value="Cash" />
                    <asp:ListItem Text="Bank Transfer" Value="Bank Transfer" />
                    <asp:ListItem Text="Cheque" Value="Cheque" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvPaymentMode" runat="server" ControlToValidate="ddlPaymentMode" 
                    InitialValue="" ErrorMessage="Please select a payment mode." CssClass="validation-message" Display="Dynamic" />
            </div>

            <!-- Status Field -->
            <div class="form-group">
                <label for="ddlStatus">Payment Status:</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Text="--Select Status--" Value="" />
                    <asp:ListItem Text="Paid" Value="Paid" />
                    <asp:ListItem Text="Pending" Value="Pending" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="ddlStatus" 
                    InitialValue="" ErrorMessage="Please select a status." CssClass="validation-message" Display="Dynamic" />
            </div>

            <asp:Button ID="btnSubmitSalary" runat="server" Text="Submit Salary" CssClass="btn-submit" OnClick="btnSubmitSalary_Click" />
            <asp:Label ID="lblMessage" runat="server" Text="" CssClass="success-message" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>
