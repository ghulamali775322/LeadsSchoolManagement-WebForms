<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffDetails.aspx.cs" Inherits="LSMS.StaffDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('<%= ResolveUrl("~/images/Leads3.jpg") %>');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            padding: 20px;
        }
        .details-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            margin: auto;
            padding: 30px;
            text-align: left;
        }
        .btn {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            margin-top: 10px;
            display: inline-block;
            text-align: center;
            text-decoration: none;
        }
        .btn-edit { background-color: #f39c12; }
        .btn-update { background-color: #3498db; }
        .btn-delete { background-color: #e74c3c; }
        .btn-back { background-color: #2ecc71; }
        .btn:hover { opacity: 0.8; }
        .input-field {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="details-container">
            <h2>Staff Details</h2>

            <!-- Hidden Field to Store StaffID -->
            <asp:HiddenField ID="hfStaffID" runat="server" />

            <label>Staff Name:</label>
            <asp:TextBox ID="txtStaffName" runat="server" CssClass="input-field" ReadOnly="true"></asp:TextBox>

            <label>Gender:</label>
            <asp:TextBox ID="txtGender" runat="server" CssClass="input-field" ReadOnly="true"></asp:TextBox>

            <label>Date of Birth:</label>
            <asp:TextBox ID="txtDOB" runat="server" CssClass="input-field" ReadOnly="true"></asp:TextBox>

            <label>CNIC:</label>
            <asp:TextBox ID="txtCNIC" runat="server" CssClass="input-field" ReadOnly="true"></asp:TextBox>

            <label>Phone Number:</label>
            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="input-field" ReadOnly="true"></asp:TextBox>

            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" ReadOnly="true"></asp:TextBox>

            <label>Designation:</label>
            <asp:TextBox ID="txtDesignation" runat="server" CssClass="input-field" ReadOnly="true"></asp:TextBox>

            <label>Qualification:</label>
            <asp:TextBox ID="txtQualification" runat="server" CssClass="input-field" ReadOnly="true"></asp:TextBox>

            <label>Salary:</label>
            <asp:TextBox ID="txtSalary" runat="server" CssClass="input-field" ReadOnly="true"></asp:TextBox>

            <label>Joining Date:</label>
            <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="input-field" ReadOnly="true"></asp:TextBox>

            <br />
            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-edit" OnClick="btnEdit_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-update" OnClick="btnUpdate_Click" Enabled="false" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-delete" OnClick="btnDelete_Click" />
            <a href="StaffsList.aspx" class="btn btn-back">Back to List</a>
        </div>
    </form>
</body>
</html>
