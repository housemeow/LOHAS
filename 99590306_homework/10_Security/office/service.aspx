<%@ Page Language="C#" AutoEventWireup="true" CodeFile="service.aspx.cs" Inherits="_11_Project_customer_customer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="body">
    
        <span class="title">服務資料<br />
        <br />
        </span>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" DataKeyNames="sid" 
            DataSourceID="customerSqlDataSource" ForeColor="Black" GridLines="None" 
            AllowSorting="True" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="sid" HeaderText="序號" InsertVisible="False" 
                    ReadOnly="True" SortExpression="sid" />
                <asp:BoundField DataField="name" HeaderText="服務名稱" SortExpression="name" />
                <asp:BoundField DataField="generalCost" HeaderText="一般價格" 
                    SortExpression="generalCost" />
                <asp:BoundField DataField="vipCost" HeaderText="會員價格" 
                    SortExpression="vipCost" />
                <asp:BoundField DataField="comment" HeaderText="備註" 
                    SortExpression="comment" />
                <asp:CommandField ShowEditButton="True" EditText="編輯" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="customerSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            DeleteCommand="DELETE FROM [Service] WHERE [sid] = @sid" 
            InsertCommand="INSERT INTO [Service] ([name], [generalCost], [vipCost], [comment]) VALUES (@name, @generalCost, @vipCost, @comment)" 
            SelectCommand="SELECT * FROM [Service]" 
            
            
            UpdateCommand="UPDATE [Service] SET [name] = @name, [generalCost] = @generalCost, [vipCost] = @vipCost, [comment] = @comment WHERE [sid] = @sid">
            <DeleteParameters>
                <asp:Parameter Name="sid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="generalCost" Type="Int32" />
                <asp:Parameter Name="vipCost" Type="Int32" />
                <asp:Parameter Name="comment" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="generalCost" Type="Int32" />
                <asp:Parameter Name="vipCost" Type="Int32" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Name="sid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        新增服務<asp:DetailsView ID="masterDetailsView" runat="server" 
            AutoGenerateRows="False" CellPadding="4" DataKeyNames="sid" 
            DataSourceID="customerSqlDataSource" DefaultMode="Insert" ForeColor="#333333" 
            GridLines="None" Height="50px" HorizontalAlign="Center" 
            style="margin-top: 0px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="sid" HeaderText="sid" InsertVisible="False" 
                    ReadOnly="True" SortExpression="sid" />
                <asp:BoundField DataField="name" HeaderText="服務名稱" SortExpression="name" />
                <asp:BoundField DataField="generalCost" HeaderText="一般花費" 
                    SortExpression="generalCost" />
                <asp:BoundField DataField="vipCost" HeaderText="會員價格" 
                    SortExpression="vipCost" />
                <asp:BoundField DataField="comment" HeaderText="備註" 
                    SortExpression="comment" />
                <asp:CommandField InsertText="新增" ShowInsertButton="True" CancelText="取消" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <br />
    
    </div>
    </form>
</body>
</html>
