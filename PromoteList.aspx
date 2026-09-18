<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PromoteList.aspx.cs" Inherits="LSMS.PromoteList" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Promoted Students List</title>
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

            <h2>Promoted Students List</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PromotionID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="PromotionID" HeaderText="PromotionID" ReadOnly="True" SortExpression="PromotionID" />
                    <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
                    <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                    <asp:BoundField DataField="CurrentClass" HeaderText="CurrentClass" SortExpression="CurrentClass" />
                    <asp:BoundField DataField="PromoteTo" HeaderText="PromoteTo" SortExpression="PromoteTo" />
                    <asp:BoundField DataField="PromotionDate" HeaderText="PromotionDate" SortExpression="PromotionDate" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_ProConnectionString2 %>" DeleteCommand="DELETE FROM [StudentPromotion] WHERE [PromotionID] = @PromotionID" InsertCommand="INSERT INTO [StudentPromotion] ([StudentID], [StudentName], [CurrentClass], [PromoteTo], [PromotionDate]) VALUES (@StudentID, @StudentName, @CurrentClass, @PromoteTo, @PromotionDate)" ProviderName="<%$ ConnectionStrings:DB_ProConnectionString2.ProviderName %>" SelectCommand="SELECT [PromotionID], [StudentID], [StudentName], [CurrentClass], [PromoteTo], [PromotionDate] FROM [StudentPromotion]" UpdateCommand="UPDATE [StudentPromotion] SET [StudentID] = @StudentID, [StudentName] = @StudentName, [CurrentClass] = @CurrentClass, [PromoteTo] = @PromoteTo, [PromotionDate] = @PromotionDate WHERE [PromotionID] = @PromotionID">
                    <DeleteParameters>
                        <asp:Parameter Name="PromotionID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="StudentID" Type="String" />
                        <asp:Parameter Name="StudentName" Type="String" />
                        <asp:Parameter Name="CurrentClass" Type="String" />
                        <asp:Parameter Name="PromoteTo" Type="String" />
                        <asp:Parameter DbType="Date" Name="PromotionDate" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="StudentID" Type="String" />
                        <asp:Parameter Name="StudentName" Type="String" />
                        <asp:Parameter Name="CurrentClass" Type="String" />
                        <asp:Parameter Name="PromoteTo" Type="String" />
                        <asp:Parameter DbType="Date" Name="PromotionDate" />
                        <asp:Parameter Name="PromotionID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
           

        </div>
    </form>
</body>
</html>

