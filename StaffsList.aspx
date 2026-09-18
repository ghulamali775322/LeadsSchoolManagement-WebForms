<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffsList.aspx.cs" Inherits="LSMS.StaffsList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Staff List</title>
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
        .list-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 1000px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: green;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn-view {
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
        }
        .btn-view:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="list-container">
            <a href="Dashboard.aspx" class="back-button">&#8592; Back</a> 
            <h2>Staff List</h2>

            <asp:GridView ID="gvStaffList" runat="server" AutoGenerateColumns="False" CssClass="staff-grid" 
                EmptyDataText="No staff members found." CellPadding="10" CellSpacing="0" BorderWidth="1" 
                GridLines="Both">
                <Columns>
                    <asp:BoundField DataField="StaffID" HeaderText="Staff ID" />
                    <asp:BoundField DataField="StaffName" HeaderText="Staff Name" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" />
                    <asp:BoundField DataField="Designation" HeaderText="Designation" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <a href='StaffDetails.aspx?StaffID=<%# Eval("StaffID") %>' class="btn-view">View Details</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
