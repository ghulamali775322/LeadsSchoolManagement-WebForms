<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentFeeRecord.aspx.cs" Inherits="LSMS.StudentFeeRecord" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Fee Record</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('<%= ResolveUrl("~/images/Leads3.jpg") %>');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            padding: 20px;
            position: relative;
            overflow: hidden;
        }

        /* Blurred Background */
        body::before {
            content: "";
            background-image: url('<%= ResolveUrl("~/images/Leads3.jpg") %>');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            filter: blur(4px);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .record-container {
            background-color: rgba(255, 255, 255, 0.85); /* Slightly transparent to show the blur */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 1000px;
            margin: auto;
            padding: 30px;
            position: relative;
            z-index: 1;
        }

        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            text-decoration: none;
            color: #333;
            font-size: 18px;
            font-weight: bold;
            z-index: 2;
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
        <div class="record-container">
            <a href="Dashboard.aspx" class="back-button">&#8592; Back</a> <!-- Back Arrow Button -->

            <h2>Student Fee Record</h2>
            
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="FeeID" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display.">
                    <Columns>
                        <asp:BoundField DataField="FeeID" HeaderText="FeeID" ReadOnly="True" SortExpression="FeeID" />
                        <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                        <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                        <asp:BoundField DataField="StudentClass" HeaderText="StudentClass" SortExpression="StudentClass" />
                        <asp:BoundField DataField="FeeAmount" HeaderText="FeeAmount" SortExpression="FeeAmount" />
                        <asp:BoundField DataField="PaymentDate" HeaderText="PaymentDate" SortExpression="PaymentDate" />
                        <asp:BoundField DataField="PaymentMethod" HeaderText="PaymentMethod" SortExpression="PaymentMethod" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_ProConnectionString2 %>" DeleteCommand="DELETE FROM [StudentFee] WHERE [FeeID] = @FeeID" InsertCommand="INSERT INTO [StudentFee] ([StudentID], [StudentName], [StudentClass], [FeeAmount], [PaymentDate], [PaymentMethod]) VALUES (@StudentID, @StudentName, @StudentClass, @FeeAmount, @PaymentDate, @PaymentMethod)" ProviderName="<%$ ConnectionStrings:DB_ProConnectionString2.ProviderName %>" SelectCommand="SELECT [FeeID], [StudentID], [StudentName], [StudentClass], [FeeAmount], [PaymentDate], [PaymentMethod] FROM [StudentFee]" UpdateCommand="UPDATE [StudentFee] SET [StudentID] = @StudentID, [StudentName] = @StudentName, [StudentClass] = @StudentClass, [FeeAmount] = @FeeAmount, [PaymentDate] = @PaymentDate, [PaymentMethod] = @PaymentMethod WHERE [FeeID] = @FeeID">
                <DeleteParameters>
                    <asp:Parameter Name="FeeID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="StudentID" Type="String" />
                    <asp:Parameter Name="StudentName" Type="String" />
                    <asp:Parameter Name="StudentClass" Type="String" />
                    <asp:Parameter Name="FeeAmount" Type="Decimal" />
                    <asp:Parameter DbType="Date" Name="PaymentDate" />
                    <asp:Parameter Name="PaymentMethod" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StudentID" Type="String" />
                    <asp:Parameter Name="StudentName" Type="String" />
                    <asp:Parameter Name="StudentClass" Type="String" />
                    <asp:Parameter Name="FeeAmount" Type="Decimal" />
                    <asp:Parameter DbType="Date" Name="PaymentDate" />
                    <asp:Parameter Name="PaymentMethod" Type="String" />
                    <asp:Parameter Name="FeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_ProConnectionString2 %>" DeleteCommand="DELETE FROM [StudentFee] WHERE [FeeID] = @FeeID" InsertCommand="INSERT INTO [StudentFee] ([StudentID], [StudentName], [FeeAmount], [PaymentDate], [PaymentMethod]) VALUES (@StudentID, @StudentName, @FeeAmount, @PaymentDate, @PaymentMethod)" ProviderName="<%$ ConnectionStrings:DB_ProConnectionString2.ProviderName %>" SelectCommand="SELECT [FeeID], [StudentID], [StudentName], [FeeAmount], [PaymentDate], [PaymentMethod] FROM [StudentFee]" UpdateCommand="UPDATE [StudentFee] SET [StudentID] = @StudentID, [StudentName] = @StudentName, [FeeAmount] = @FeeAmount, [PaymentDate] = @PaymentDate, [PaymentMethod] = @PaymentMethod WHERE [FeeID] = @FeeID">
                    <DeleteParameters>
                        <asp:Parameter Name="FeeID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="StudentID" Type="String" />
                        <asp:Parameter Name="StudentName" Type="String" />
                        <asp:Parameter Name="FeeAmount" Type="Decimal" />
                        <asp:Parameter DbType="Date" Name="PaymentDate" />
                        <asp:Parameter Name="PaymentMethod" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="StudentID" Type="String" />
                        <asp:Parameter Name="StudentName" Type="String" />
                        <asp:Parameter Name="FeeAmount" Type="Decimal" />
                        <asp:Parameter DbType="Date" Name="PaymentDate" />
                        <asp:Parameter Name="PaymentMethod" Type="String" />
                        <asp:Parameter Name="FeeID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            
        </div>
    </form>
</body>
</html>
