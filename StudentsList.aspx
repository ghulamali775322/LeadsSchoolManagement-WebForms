<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentsList.aspx.cs" Inherits="LSMS.StudentsList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student List</title>
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="list-container">
            <a href="Dashboard.aspx" class="back-button">&#8592; Back</a> <!-- Back Arrow Button -->

            <h2>Student List</h2>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" SortExpression="StudentID" />
                    <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="FatherName" HeaderText="FatherName" SortExpression="FatherName" />
                    <asp:BoundField DataField="FatherCnic" HeaderText="FatherCnic" SortExpression="FatherCnic" />
                    <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_ProConnectionString2 %>" DeleteCommand="DELETE FROM [StudentRegistration] WHERE [StudentID] = @StudentID" InsertCommand="INSERT INTO [StudentRegistration] ([StudentID], [StudentName], [DOB], [Gender], [FatherName], [FatherCnic], [Class]) VALUES (@StudentID, @StudentName, @DOB, @Gender, @FatherName, @FatherCnic, @Class)" ProviderName="<%$ ConnectionStrings:DB_ProConnectionString2.ProviderName %>" SelectCommand="SELECT [StudentID], [StudentName], [DOB], [Gender], [FatherName], [FatherCnic], [Class] FROM [StudentRegistration]" UpdateCommand="UPDATE [StudentRegistration] SET [StudentName] = @StudentName, [DOB] = @DOB, [Gender] = @Gender, [FatherName] = @FatherName, [FatherCnic] = @FatherCnic, [Class] = @Class WHERE [StudentID] = @StudentID">
                    <DeleteParameters>
                        <asp:Parameter Name="StudentID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="StudentID" Type="String" />
                        <asp:Parameter Name="StudentName" Type="String" />
                        <asp:Parameter DbType="Date" Name="DOB" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="FatherName" Type="String" />
                        <asp:Parameter Name="FatherCnic" Type="String" />
                        <asp:Parameter Name="Class" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="StudentName" Type="String" />
                        <asp:Parameter DbType="Date" Name="DOB" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="FatherName" Type="String" />
                        <asp:Parameter Name="FatherCnic" Type="String" />
                        <asp:Parameter Name="Class" Type="String" />
                        <asp:Parameter Name="StudentID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
          

        </div>
    </form>
</body>
</html>
