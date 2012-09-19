<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer.aspx.cs" Inherits="_11_Project_customer_customer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>客戶</title>
    <link href="../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="body">
    
        <span class="title">客戶資料<br />
        <br />
        </span>
        <asp:CheckBox ID="VIPCheckBox" runat="server" AutoPostBack="True" 
            Text="篩選VIP" />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" DataKeyNames="cid" 
            DataSourceID="customerSqlDataSource" ForeColor="Black" GridLines="None" 
            AllowSorting="True" HorizontalAlign="Center" PageSize="20">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="cid" HeaderText="序號" InsertVisible="False" 
                    ReadOnly="True" SortExpression="cid" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" >
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="phone" HeaderText="家電" SortExpression="phone" />
                <asp:BoundField DataField="cellphone" HeaderText="手機" 
                    SortExpression="cellphone" />
                <asp:TemplateField HeaderText="生日" SortExpression="birthday">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" 
                            Text='<%# Bind("birthday", "{0:d}") %>' Height="19px" Width="111px"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="格式錯誤" Operator="DataTypeCheck" 
                            Type="Date"></asp:CompareValidator>
                        <br />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("birthday", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="gender" HeaderText="性別" SortExpression="gender" />
                <asp:BoundField DataField="health" HeaderText="健康狀況" SortExpression="health" />
                <asp:BoundField DataField="specifiedMaster" HeaderText="指定師父" 
                    SortExpression="specifiedMaster" />
                <asp:BoundField DataField="acceptableMaster" HeaderText="可接受師父" 
                    SortExpression="acceptableMaster" />
                <asp:BoundField DataField="refuceMaster" HeaderText="拒絕師父" 
                    SortExpression="refuceMaster" />
                <asp:BoundField DataField="shareFamily" HeaderText="共享親友名單" 
                    SortExpression="shareFamily" />
                <asp:BoundField DataField="firstTopUp" HeaderText="首次加值日" 
                    SortExpression="firstTopUp" ReadOnly="True" />
                <asp:BoundField DataField="debt" HeaderText="欠款" SortExpression="debt" />
                <asp:BoundField DataField="restMoney" HeaderText="儲值金額" 
                    SortExpression="restMoney" />
                <asp:BoundField DataField="comment" HeaderText="備註" SortExpression="comment" />
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
            SelectCommand="SELECT cid, firstConsumeDate, name, cellphone, phone, specifiedMaster, acceptableMaster, refuceMaster, gender, birthday, firstTopUp, restMoney, shareFamily, debt, tabu, health, address, comment FROM Customer WHERE (firstTopUp IS NOT NULL) OR (@isvip = 0)" 
            DeleteCommand="DELETE FROM [Customer] WHERE [cid] = @cid" 
            InsertCommand="INSERT INTO [Customer] ([firstConsumeDate], [name], [cellphone], [phone], [specifiedMaster], [acceptableMaster], [refuceMaster], [gender], [birthday], [firstTopUp], [restMoney], [shareFamily], [debt], [tabu], [health], [address], [comment]) VALUES (@firstConsumeDate, @name, @cellphone, @phone, @specifiedMaster, @acceptableMaster, @refuceMaster, @gender, @birthday, @firstTopUp, @restMoney, @shareFamily, @debt, @tabu, @health, @address, @comment)" 
            
            UpdateCommand="UPDATE [Customer] SET [firstConsumeDate] = @firstConsumeDate, [name] = @name, [cellphone] = @cellphone, [phone] = @phone, [specifiedMaster] = @specifiedMaster, [acceptableMaster] = @acceptableMaster, [refuceMaster] = @refuceMaster, [gender] = @gender, [birthday] = @birthday, [firstTopUp] = @firstTopUp, [restMoney] = @restMoney, [shareFamily] = @shareFamily, [debt] = @debt, [tabu] = @tabu, [health] = @health, [address] = @address, [comment] = @comment WHERE [cid] = @cid">
            <DeleteParameters>
                <asp:Parameter Name="cid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="firstConsumeDate" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="cellphone" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="specifiedMaster" Type="String" />
                <asp:Parameter Name="acceptableMaster" Type="String" />
                <asp:Parameter Name="refuceMaster" Type="String" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter DbType="Date" Name="birthday" />
                <asp:Parameter Name="firstTopUp" Type="DateTime" />
                <asp:Parameter Name="restMoney" Type="Int32" />
                <asp:Parameter Name="shareFamily" Type="String" />
                <asp:Parameter Name="debt" Type="Int32" />
                <asp:Parameter Name="tabu" Type="String" />
                <asp:Parameter Name="health" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="VIPCheckBox" Name="isvip" 
                    PropertyName="Checked" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="firstConsumeDate" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="cellphone" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="specifiedMaster" Type="String" />
                <asp:Parameter Name="acceptableMaster" Type="String" />
                <asp:Parameter Name="refuceMaster" Type="String" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter DbType="Date" Name="birthday" />
                <asp:Parameter Name="firstTopUp" Type="DateTime" />
                <asp:Parameter Name="restMoney" Type="Int32" />
                <asp:Parameter Name="shareFamily" Type="String" />
                <asp:Parameter Name="debt" Type="Int32" />
                <asp:Parameter Name="tabu" Type="String" />
                <asp:Parameter Name="health" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Name="cid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
