<%@ Page Language="C#" AutoEventWireup="true" CodeFile="initialize.aspx.cs" Inherits="_10_Security_office_initialize" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body class="body">
    <form id="form1" runat="server">
    <div>
    
        <span class="title">初始化資料庫</span><br />
        <br />
        <br />
        <asp:Button ID="allInitializeButton" runat="server" 
            onclick="allInitializeButton_Click" Text="全部初始化" />
        <br />
        <br />
        <asp:Button ID="customerInitializeButton" runat="server" 
            onclick="customerInitializeButton_Click" Text="初始化客戶資料庫" />
&nbsp;<asp:Button ID="serviceInitializeButton" runat="server" 
            onclick="serviceInitializeButton_Click" Text="初始化服務項目資料庫" />
&nbsp;<asp:Button ID="masterInitializeButton" runat="server" 
            onclick="masterInitializeButton_Click" Text="初始化師父資料庫" />
&nbsp;<asp:Button ID="recordInitializeButton" runat="server" 
            onclick="recordInitializeButton_Click" Text="初始化消費紀錄資料庫" />
        <asp:SqlDataSource ID="customerInitalizeSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            DeleteCommand="TRUNCATE TABLE Customer" 
            InsertCommand="INSERT INTO [Customer] ([firstConsumeDate], [name], [cellphone], [phone], [specifiedMaster], [acceptableMaster], [refuceMaster], [gender], [birthday], [firstTopUp], [restMoney], [shareFamily], [debt], [tabu], [health], [address], [comment]) VALUES (@firstConsumeDate, @name, @cellphone, @phone, @specifiedMaster, @acceptableMaster, @refuceMaster, @gender, @birthday, @firstTopUp, @restMoney, @shareFamily, @debt, @tabu, @health, @address, @comment)" 
            SelectCommand="SELECT * FROM [Customer]" 
            
            UpdateCommand="UPDATE [Customer] SET [firstConsumeDate] = @firstConsumeDate, [name] = @name, [cellphone] = @cellphone, [phone] = @phone, [specifiedMaster] = @specifiedMaster, [acceptableMaster] = @acceptableMaster, [refuceMaster] = @refuceMaster, [gender] = @gender, [birthday] = @birthday, [firstTopUp] = @firstTopUp, [restMoney] = @restMoney, [shareFamily] = @shareFamily, [debt] = @debt, [tabu] = @tabu, [health] = @health, [address] = @address, [comment] = @comment WHERE [cid] = @cid" 
            ProviderName="<%$ ConnectionStrings:mikeConnectionString.ProviderName %>">
            <InsertParameters>
                <asp:Parameter Name="firstConsumeDate" Type="DateTime" />
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
            <UpdateParameters>
                <asp:Parameter Name="firstConsumeDate" Type="DateTime" />
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
        <asp:SqlDataSource ID="serviceInitializeSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            DeleteCommand="TRUNCATE TABLE Service;
INSERT INTO Service(name, generalCost, vipCost, comment) VALUES (N'加值', 0, 0, N'特殊選項請勿修改');
INSERT INTO Service(name, generalCost, vipCost, comment) VALUES (N'還款', 0, 0, N'特殊選項請勿修改')" 
            InsertCommand="INSERT INTO Service(name, generalCost, vipCost, comment) VALUES (N'加值', 0, 0, N'特殊選項請勿修改')" 
            SelectCommand="SELECT * FROM [Service]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="masterInitializeSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            DeleteCommand="TRUNCATE TABLE Master;
INSERT INTO [Master] ([name], [comment]) VALUES (N'加值', N'特殊使用請勿修改');
INSERT INTO [Master] ([name], [comment]) VALUES (N'還款', N'特殊使用請勿修改')" 
            InsertCommand="INSERT INTO [Master] ([name], [gender], [address], [phone], [cellphone], [comment]) VALUES (@name, @gender, @address, @phone, @cellphone, @comment)" 
            SelectCommand="SELECT * FROM [Master]" 
            
            UpdateCommand="UPDATE [Master] SET [name] = @name, [gender] = @gender, [address] = @address, [phone] = @phone, [cellphone] = @cellphone, [comment] = @comment WHERE [mid] = @mid">
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
        <asp:SqlDataSource ID="recordInitializeSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            DeleteCommand="TRUNCATE TABLE Record" 
            InsertCommand="INSERT INTO [Record] ([cid], [serviceDate], [serviceMinute], [sid], [mid], [opinion], [servicePrice], [cash], [masterCommission], [profit], [debt], [companyRevenue], [recorder], [executionState], [comment]) VALUES (@cid, @serviceDate, @serviceMinute, @sid, @mid, @opinion, @servicePrice, @cash, @masterCommission, @profit, @debt, @companyRevenue, @recorder, @executionState, @comment)" 
            SelectCommand="SELECT * FROM [Record]" 
            
            UpdateCommand="UPDATE [Record] SET [cid] = @cid, [serviceDate] = @serviceDate, [serviceMinute] = @serviceMinute, [sid] = @sid, [mid] = @mid, [opinion] = @opinion, [servicePrice] = @servicePrice, [cash] = @cash, [masterCommission] = @masterCommission, [profit] = @profit, [debt] = @debt, [companyRevenue] = @companyRevenue, [recorder] = @recorder, [executionState] = @executionState, [comment] = @comment WHERE [rid] = @rid">
            <InsertParameters>
                <asp:Parameter Name="cid" Type="Int32" />
                <asp:Parameter Name="serviceDate" Type="DateTime" />
                <asp:Parameter Name="serviceMinute" Type="Int32" />
                <asp:Parameter Name="sid" Type="Int32" />
                <asp:Parameter Name="mid" Type="Int32" />
                <asp:Parameter Name="opinion" Type="String" />
                <asp:Parameter Name="servicePrice" Type="Int32" />
                <asp:Parameter Name="cash" Type="Int32" />
                <asp:Parameter Name="masterCommission" Type="Int32" />
                <asp:Parameter Name="profit" Type="Int32" />
                <asp:Parameter Name="debt" Type="Int32" />
                <asp:Parameter Name="companyRevenue" Type="Int32" />
                <asp:Parameter Name="recorder" Type="String" />
                <asp:Parameter Name="executionState" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="cid" Type="Int32" />
                <asp:Parameter Name="serviceDate" Type="DateTime" />
                <asp:Parameter Name="serviceMinute" Type="Int32" />
                <asp:Parameter Name="sid" Type="Int32" />
                <asp:Parameter Name="mid" Type="Int32" />
                <asp:Parameter Name="opinion" Type="String" />
                <asp:Parameter Name="servicePrice" Type="Int32" />
                <asp:Parameter Name="cash" Type="Int32" />
                <asp:Parameter Name="masterCommission" Type="Int32" />
                <asp:Parameter Name="profit" Type="Int32" />
                <asp:Parameter Name="debt" Type="Int32" />
                <asp:Parameter Name="companyRevenue" Type="Int32" />
                <asp:Parameter Name="recorder" Type="String" />
                <asp:Parameter Name="executionState" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Name="rid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
