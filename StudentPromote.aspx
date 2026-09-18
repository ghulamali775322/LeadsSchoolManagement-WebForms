<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentPromote.aspx.cs" Inherits="LSMS.StudentPromote" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Promotion</title>
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

        .promotion-container {
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

        select, input {
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
        <div class="promotion-container">
            <a href="Dashboard.aspx" class="back-button">&#8592; Back</a> <!-- Back Arrow Button -->

            <h2>Promote Student</h2>

            <!-- Student ID Dropdown -->
            <div class="form-group">
                <label for="ddlStudentID">Select Student ID:</label>
                <asp:DropDownList ID="ddlStudentID" runat="server" CssClass="form-control" AutoPostBack="true" 
                                  OnSelectedIndexChanged="ddlStudentID_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvStudentID" runat="server" ControlToValidate="ddlStudentID" 
                    InitialValue="" ErrorMessage="Please select a student ID." CssClass="validation-message" Display="Dynamic" />
            </div>

            <!-- Student Name (Auto-filled) -->
            <div class="form-group">
                <label>Student Name:</label>
                <asp:Label ID="lblStudentName" runat="server" Text="Select a Student ID" CssClass="form-control"></asp:Label>
            </div>

            <!-- Current Class (Auto-filled) -->
            <div class="form-group">
                <label>Current Class:</label>
                <asp:Label ID="lblCurrentClass" runat="server" Text="Select a Student ID" CssClass="form-control"></asp:Label>
            </div>

            <!-- Promote To Dropdown -->
            <div class="form-group">
                <label for="ddlPromoteTo">Promote To:</label>
                <asp:DropDownList ID="ddlPromoteTo" runat="server" CssClass="form-control">
                    <asp:ListItem Text="--Select Class--" Value="" />
                    <asp:ListItem Text="Class 1" Value="Class 1" />
                    <asp:ListItem Text="Class 2" Value="Class 2" />
                    <asp:ListItem Text="Class 3" Value="Class 3" />
                    <asp:ListItem Text="Class 4" Value="Class 4" />
                    <asp:ListItem Text="Class 5" Value="Class 5" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvPromoteTo" runat="server" ControlToValidate="ddlPromoteTo" 
                    InitialValue="" ErrorMessage="Please select a class to promote to." CssClass="validation-message" Display="Dynamic" />
            </div>

            <!-- Promotion Date -->
            <div class="form-group">
                <label>Promotion Date:</label>
                <asp:TextBox ID="txtPromotionDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- Submit Button -->
            <asp:Button ID="btnPromote" runat="server" Text="Promote Student" CssClass="btn-submit" OnClick="btnPromote_Click" />

            <!-- Success Message -->
          <asp:Label ID="lblSuccess" runat="server" Text="" CssClass="success-message" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>
