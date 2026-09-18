<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffAttendance.aspx.cs" Inherits="LSMS.StaffAttendance" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Attendance</title>
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

        .attendance-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 600px;
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
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="attendance-container">
            <a href="Dashboard.aspx" class="back-button">&#8592; Back</a>

            <h2>Staff Attendance</h2>

            <!-- Select Staff Name -->
            <div class="form-group">
                <label for="ddlStaffName">Staff Name:</label>
                <asp:DropDownList ID="ddlStaffName" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlStaffName_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvStaffName" runat="server" ControlToValidate="ddlStaffName" 
                    InitialValue="" ErrorMessage="Please select a staff member." CssClass="validation-message" Display="Dynamic" />
            </div>

            <!-- Staff ID (Auto-filled) -->
            <div class="form-group">
                <label for="txtStaffID">Staff ID:</label>
                <asp:TextBox ID="txtStaffID" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <!-- Staff Designation (Auto-filled) -->
            <div class="form-group">
                <label for="txtDesignation">Designation:</label>
                <asp:TextBox ID="txtDesignation" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <!-- Attendance Date -->
            <div class="form-group">
                <label for="txtAttendanceDate">Attendance Date:</label>
                <asp:TextBox ID="txtAttendanceDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAttendanceDate" runat="server" ControlToValidate="txtAttendanceDate" 
                    ErrorMessage="Please select an attendance date." CssClass="validation-message" Display="Dynamic" />
            </div>

            <!-- Attendance Status -->
            <div class="form-group">
                <label for="ddlStatus">Attendance Status:</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Text="--Select Status--" Value="" />
                    <asp:ListItem Text="Present" Value="Present" />
                    <asp:ListItem Text="Absent" Value="Absent" />
                    <asp:ListItem Text="Leave" Value="Leave" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="ddlStatus" 
                    InitialValue="" ErrorMessage="Please select an attendance status." CssClass="validation-message" Display="Dynamic" />
            </div>

            <asp:Button ID="btnSubmitAttendance" runat="server" Text="Submit Attendance" CssClass="btn-submit" OnClick="btnSubmitAttendance_Click" />
            <asp:Label ID="lblMessage" runat="server" Text="" CssClass="success-message" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>
