<%@ Page Language="C#" AutoEventWireup="true" CodeFile="master.aspx.cs" Inherits="_11_Project_customer_customer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="body">
    
        <span class="title">師父資料<br />
        <br />
        </span>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" DataKeyNames="mid" 
            DataSourceID="customerSqlDataSource" ForeColor="Black" GridLines="None" 
            AllowSorting="True" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="mid" HeaderText="序號" InsertVisible="False" 
                    ReadOnly="True" SortExpression="mid" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                <asp:BoundField DataField="gender" HeaderText="性別" SortExpression="gender" />
                <asp:BoundField DataField="address" HeaderText="住址" 
                    SortExpression="address" />
                <asp:BoundField DataField="phone" HeaderText="家電" 
                    SortExpression="phone" />
                <asp:BoundField DataField="cellphone" HeaderText="手機" 
                    SortExpression="cellphone" />
                <asp:BoundField DataField="comment" HeaderText="備註" SortExpression="comment" />
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
            DeleteCommand="DELETE FROM [Master] WHERE [mid] = @mid" 
            InsertCommand="INSERT INTO [Master] ([name], [gender], [address], [phone], [cellphone], [comment]) VALUES (@name, @gender, @address, @phone, @cellphone, @comment)" 
            SelectCommand="SELECT * FROM [Master]" 
            
            UpdateCommand="UPDATE [Master] SET [name] = @name, [gender] = @gender, [address] = @address, [phone] = @phone, [cellphone] = @cellphone, [comment] = @comment WHERE [mid] = @mid">
            <DeleteParameters>
                <asp:Parameter Name="mid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="cellphone" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="cellphone" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Name="mid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        新增師父<br />
        <asp:DetailsView ID="masterDetailsView" runat="server" 
            AutoGenerateRows="False" CellPadding="4" DataKeyNames="mid" 
            DataSourceID="customerSqlDataSource" DefaultMode="Insert" ForeColor="#333333" 
            GridLines="None" Height="50px" HorizontalAlign="Center" 
            style="margin-top: 0px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="mid" HeaderText="mid" InsertVisible="False" 
                    ReadOnly="True" SortExpression="mid" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                <asp:TemplateField HeaderText="性別" SortExpression="gender">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("gender") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                            RepeatDirection="Horizontal" RepeatLayout="Flow" 
                            SelectedValue='<%# Bind("gender") %>'>
                            <asp:ListItem Selected="True">男生</asp:ListItem>
                            <asp:ListItem>女生</asp:ListItem>
                        </asp:RadioButtonList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="address" HeaderText="地址" 
                    SortExpression="address" />
                <asp:BoundField DataField="phone" HeaderText="家電" SortExpression="phone" />
                <asp:BoundField DataField="cellphone" HeaderText="手機" 
                    SortExpression="cellphone" />
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
