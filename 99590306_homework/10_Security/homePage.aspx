<%@ Page Language="C#" AutoEventWireup="true" CodeFile="homePage.aspx.cs" Inherits="_07_WebService_aspLocation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
    </head>
<body class="body">
    <form id="form1" runat="server">
    <div>
    
        <span class="title">
        今天日期:<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Label ID="todayLabel" runat="server"></asp:Label>
        <br />
        </span>
        <asp:GridView ID="birthdayCustomerGridView" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="cid" DataSourceID="SqlDataSourceNextMonthBirth" 
            CellPadding="2" ForeColor="Black" GridLines="None" 
            HorizontalAlign="Center" AllowPaging="True" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="firstConsumeDate" HeaderText="首次消費日" 
                    SortExpression="firstConsumeDate" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                <asp:BoundField DataField="cellphone" HeaderText="手機" 
                    SortExpression="cellphone" />
                <asp:BoundField DataField="phone" HeaderText="家電" 
                    SortExpression="phone" />
                <asp:BoundField DataField="restMoney" HeaderText="儲值金" 
                    SortExpression="restMoney" />
                <asp:BoundField DataField="gender" HeaderText="性別" 
                    SortExpression="gender" />
                <asp:BoundField DataField="birthday" HeaderText="生日" 
                    SortExpression="birthday" />
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
    
        <span class="title">
        <asp:SqlDataSource ID="SqlDataSourceNextMonthBirth" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            SelectCommand="SELECT [cid], [firstConsumeDate], [name], [cellphone], [phone], [restMoney], [gender], [birthday] FROM [Customer] WHERE (month(birthday) = @nextMonth)">
            <SelectParameters>
                <asp:SessionParameter Name="nextMonth" SessionField="nextMonth" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="nowMonthLabel" runat="server"></asp:Label>
        </span>
        <br />
        <asp:GridView ID="nowBirthdayCustomerGridView" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="cid" DataSourceID="SqlDataSourceNowMonthBirthday" 
            CellPadding="2" ForeColor="Black" GridLines="None" 
            HorizontalAlign="Center" AllowPaging="True" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="firstConsumeDate" HeaderText="首次消費日" 
                    SortExpression="firstConsumeDate" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                <asp:BoundField DataField="cellphone" HeaderText="手機" 
                    SortExpression="cellphone" />
                <asp:BoundField DataField="phone" HeaderText="家電" 
                    SortExpression="phone" />
                <asp:BoundField DataField="restMoney" HeaderText="儲值金" 
                    SortExpression="restMoney" />
                <asp:BoundField DataField="gender" HeaderText="性別" 
                    SortExpression="gender" />
                <asp:BoundField DataField="birthday" HeaderText="生日" 
                    SortExpression="birthday" />
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
    
        <span class="title">
        <asp:SqlDataSource ID="SqlDataSourceNowMonthBirthday" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
            SelectCommand="SELECT [cid], [firstConsumeDate], [name], [cellphone], [phone], [restMoney], [gender], [birthday] FROM [Customer] WHERE (month(birthday) = @nowMonth)">
            <SelectParameters>
                <asp:Parameter Name="nowMonth" />
            </SelectParameters>
        </asp:SqlDataSource>
        </span>
        <br />
        <br />
        <br />
        今日須提醒客戶<br />
        <br />
        <asp:GridView ID="todayReservationGridView" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceReservation" CellPadding="2" ForeColor="Black" 
            GridLines="None" HorizontalAlign="Center" AllowPaging="True" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期" 
                    DataFormatString="{0:d}" />
                <asp:BoundField DataField="客戶" HeaderText="客戶" 
                    SortExpression="客戶" />
                <asp:BoundField DataField="手機" HeaderText="手機" 
                    SortExpression="手機" />
                <asp:BoundField DataField="電話" HeaderText="電話" 
                    SortExpression="電話" />
                <asp:BoundField DataField="服務項目" HeaderText="服務項目" 
                    SortExpression="服務項目" />
                <asp:BoundField DataField="服務長度" HeaderText="服務長度" SortExpression="服務長度" />
                <asp:BoundField DataField="服務師父" HeaderText="服務師父" SortExpression="服務師父" />
                <asp:BoundField DataField="師父抽成" HeaderText="師父抽成" SortExpression="師父抽成" />
                <asp:BoundField DataField="總額" HeaderText="總額" SortExpression="總額" />
                <asp:BoundField DataField="櫃台" HeaderText="櫃台" 
                    SortExpression="櫃台" />
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
        <asp:SqlDataSource ID="SqlDataSourceReservation" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day)">
            <SelectParameters>
                <asp:SessionParameter Name="Year" SessionField="Year" />
                <asp:SessionParameter Name="Month" SessionField="Month" />
                <asp:SessionParameter Name="Day" SessionField="Day" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        明日須提醒客戶<br />
        <br />
        <asp:GridView ID="tomorrowReservationGridView" runat="server" AutoGenerateColumns="False" 
            datasourceid="SqlDataSourceReservation1" CellPadding="2" ForeColor="Black" 
            GridLines="None" HorizontalAlign="Center" AllowPaging="True" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期" />
                <asp:BoundField DataField="客戶" HeaderText="客戶" 
                    SortExpression="客戶" />
                <asp:BoundField DataField="手機" HeaderText="手機" 
                    SortExpression="手機" />
                <asp:BoundField DataField="電話" HeaderText="電話" 
                    SortExpression="電話" />
                <asp:BoundField DataField="服務項目" HeaderText="服務項目" 
                    SortExpression="服務項目" />
                <asp:BoundField DataField="服務長度" HeaderText="服務長度" SortExpression="服務長度" />
                <asp:BoundField DataField="服務師父" HeaderText="服務師父" SortExpression="服務師父" />
                <asp:BoundField DataField="師父抽成" HeaderText="師父抽成" SortExpression="師父抽成" />
                <asp:BoundField DataField="總額" HeaderText="總額" SortExpression="總額" />
                <asp:BoundField DataField="櫃台" HeaderText="櫃台" 
                    SortExpression="櫃台" />
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
        <br />
        <asp:SqlDataSource ID="SqlDataSourceReservation1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @tomorowDay)">
            <SelectParameters>
                <asp:SessionParameter Name="Year" SessionField="Year" />
                <asp:SessionParameter Name="Month" SessionField="Month" />
                <asp:SessionParameter DefaultValue="tomorowDay" Name="tomorowDay" 
                    SessionField="tomorowDay" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        欠款名單<br />
        <asp:GridView ID="debtGridView" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceDebt" CellPadding="2" ForeColor="Black" 
            GridLines="None" HorizontalAlign="Center" AllowPaging="True" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
            DataKeyNames="cid" onselectedindexchanged="debtGridView_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="cid" HeaderText="序號" InsertVisible="False" 
                    ReadOnly="True" SortExpression="cid" />
                <asp:BoundField DataField="name" HeaderText="客戶" SortExpression="name" />
                <asp:BoundField DataField="debt" HeaderText="欠款" 
                    SortExpression="debt" />
                <asp:BoundField DataField="cellphone" HeaderText="手機" 
                    SortExpression="cellphone" />
                <asp:BoundField DataField="phone" HeaderText="電話" 
                    SortExpression="phone" />
                <asp:BoundField DataField="address" HeaderText="地址" 
                    SortExpression="address" />
                <asp:BoundField DataField="firstConsumeDate" HeaderText="首次消費" 
                    SortExpression="firstConsumeDate" />
                <asp:BoundField DataField="comment" HeaderText="附註" 
                    SortExpression="comment" />
                <asp:CommandField SelectText="選擇" ShowSelectButton="True"></asp:CommandField>
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
        <br />
        <asp:Button ID="debtButton" runat="server" onclick="debtButton_Click" 
            Text="還款" />
        <asp:SqlDataSource ID="SqlDataSourceDebt" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            SelectCommand="SELECT name, firstConsumeDate, cellphone, phone, debt, address, comment, cid FROM Customer WHERE (debt IS NOT NULL) AND (debt &gt; 0)">
        </asp:SqlDataSource>
        <br />
    
    </div>
    <p>
                &nbsp;</p>
    </form>
</body>
</html>
