<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffAttendanceRecord.aspx.cs" Inherits="LSMS.StaffAttendanceRecord" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Attendance</title>

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
            <h2>Staff Attendance</h2>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AttendanceID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="AttendanceID" HeaderText="AttendanceID" ReadOnly="True" SortExpression="AttendanceID" />
                    <asp:BoundField DataField="StaffID" HeaderText="StaffID" SortExpression="StaffID" />
                    <asp:BoundField DataField="StaffName" HeaderText="StaffName" SortExpression="StaffName" />
                    <asp:BoundField DataField="AttendanceDate" HeaderText="AttendanceDate" SortExpression="AttendanceDate" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_ProConnectionString2 %>" DeleteCommand="DELETE FROM [StaffAttendance] WHERE [AttendanceID] = @AttendanceID" InsertCommand="INSERT INTO [StaffAttendance] ([StaffID], [StaffName], [AttendanceDate], [Status]) VALUES (@StaffID, @StaffName, @AttendanceDate, @Status)" ProviderName="<%$ ConnectionStrings:DB_ProConnectionString2.ProviderName %>" SelectCommand="SELECT [AttendanceID], [StaffID], [StaffName], [AttendanceDate], [Status] FROM [StaffAttendance]" UpdateCommand="UPDATE [StaffAttendance] SET [StaffID] = @StaffID, [StaffName] = @StaffName, [AttendanceDate] = @AttendanceDate, [Status] = @Status WHERE [AttendanceID] = @AttendanceID">
                    <DeleteParameters>
                        <asp:Parameter Name="AttendanceID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="StaffID" Type="Int32" />
                        <asp:Parameter Name="StaffName" Type="String" />
                        <asp:Parameter DbType="Date" Name="AttendanceDate" />
                        <asp:Parameter Name="Status" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="StaffID" Type="Int32" />
                        <asp:Parameter Name="StaffName" Type="String" />
                        <asp:Parameter DbType="Date" Name="AttendanceDate" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="AttendanceID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
           
           
        </div>
    </form>
</body>
</html>

