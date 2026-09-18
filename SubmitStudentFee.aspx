<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubmitStudentFee.aspx.cs" Inherits="LSMS.SubmitStudentFee" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Submit Student Fee</title>
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

        .fee-container {
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
        <div class="fee-container">
            <a href="Dashboard.aspx" class="back-button">&#8592; Back</a>

            <h2>Submit Student Fee</h2>

            <!-- Student ID Field -->
            <div class="form-group">
                <label for="ddlStudentID">Student ID:</label>
                <asp:DropDownList ID="ddlStudentID" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlStudentID_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvStudentID" runat="server" ControlToValidate="ddlStudentID" 
                    InitialValue="" ErrorMessage="Please select a student ID." CssClass="validation-message" Display="Dynamic" />
            </div>

            <!-- Student Name Field (Auto-filled) -->
            <div class="form-group">
                <label for="txtStudentName">Student Name:</label>
                <asp:TextBox ID="txtStudentName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtStudentClass">Student Class:</label>
                <asp:TextBox ID="txtStudentClass" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>

            </div>

            <!-- Fee Amount Field -->
            <div class="form-group">
                <label for="txtFeeAmount">Fee Amount:</label>
                <asp:TextBox ID="txtFeeAmount" runat="server" CssClass="form-control" placeholder="Enter fee amount"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFeeAmount" runat="server" ControlToValidate="txtFeeAmount" 
                    ErrorMessage="Please enter fee amount." CssClass="validation-message" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revFeeAmount" runat="server" ControlToValidate="txtFeeAmount" 
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
                <label for="ddlPaymentMethod">Payment Method:</label>
                <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="form-control">
                    <asp:ListItem Text="--Select Payment Method--" Value="" />
                    <asp:ListItem Text="Cash" Value="Cash" />
                    <asp:ListItem Text="Bank Transfer" Value="Bank Transfer" />
                    <asp:ListItem Text="Online Payment" Value="Online Payment" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvPaymentMethod" runat="server" ControlToValidate="ddlPaymentMethod" 
                    InitialValue="" ErrorMessage="Please select a payment method." CssClass="validation-message" Display="Dynamic" />
            </div>

            <asp:Button ID="btnSubmitFee" runat="server" Text="Submit Fee" CssClass="btn-submit" OnClick="btnSubmitFee_Click" />
              <asp:Label ID="lblMessage" runat="server" Text="" CssClass="success-message" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>