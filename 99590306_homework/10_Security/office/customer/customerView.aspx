<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customerView.aspx.cs" Inherits="_11_Project_customer_customerview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="body">
    <div>
    
        <span class="title">檢視客戶<br />
        </span>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
            CellPadding="2" DataKeyNames="cid" DataSourceID="customerSqlDataSource" 
            ForeColor="Black" GridLines="None" Height="50px" HorizontalAlign="Center" 
            Width="400px" style="margin-top: 0px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <Fields>
                <asp:BoundField DataField="cid" HeaderText="序號" InsertVisible="False" 
                    ReadOnly="True" SortExpression="cid" />
                <asp:BoundField DataField="firstConsumeDate" HeaderText="首次消費日" 
                    SortExpression="firstConsumeDate" />
                <asp:BoundField DataField="name" HeaderText="客戶姓名" SortExpression="name" />
                <asp:BoundField DataField="cellphone" HeaderText="手機" 
                    SortExpression="cellphone" />
                <asp:BoundField DataField="phone" HeaderText="客戶家電" SortExpression="phone" />
                <asp:BoundField DataField="specifiedMaster" HeaderText="指定師父" 
                    SortExpression="specifiedMaster" />
                <asp:BoundField DataField="acceptableMaster" HeaderText="可接受師父" 
                    SortExpression="acceptableMaster" />
                <asp:BoundField DataField="refuceMaster" HeaderText="拒絕師父" 
                    SortExpression="refuceMaster" />
                <asp:BoundField DataField="gender" HeaderText="性別" SortExpression="gender" />
                <asp:BoundField DataField="birthday" HeaderText="生日" 
                    SortExpression="birthday" DataFormatString="{0:yyyy/MM/dd}" />
                <asp:BoundField DataField="firstTopUp" HeaderText="首次加值日" 
                    SortExpression="firstTopUp" />
                <asp:BoundField DataField="restMoney" HeaderText="剩餘儲值金額" 
                    SortExpression="restMoney" />
                <asp:BoundField DataField="shareFamily" HeaderText="共享親友名單" 
                    SortExpression="shareFamily" />
                <asp:BoundField DataField="debt" HeaderText="欠款" SortExpression="debt" />
                <asp:BoundField DataField="tabu" HeaderText="禁忌" SortExpression="tabu" />
                <asp:BoundField DataField="health" HeaderText="健康狀況" SortExpression="health" />
                <asp:BoundField DataField="address" HeaderText="住址" SortExpression="address" />
                <asp:BoundField DataField="comment" HeaderText="備註" SortExpression="comment" />
            </Fields>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
        </asp:DetailsView>
        <br />
        <asp:Button ID="createButton" runat="server" 
            PostBackUrl="~/10_Security/office/customer/customerCreate.aspx" Text="新增客戶" />
&nbsp;<asp:Button ID="selectButton" runat="server" 
            Text="選擇其他會員" 
            PostBackUrl="~/10_Security/office/customer/customerSelect.aspx" />
&nbsp;<asp:Button ID="modifyButton" runat="server" 
            Text="修改會員資料" 
            PostBackUrl="~/10_Security/office/customer/customerModify.aspx" />
&nbsp;<asp:Button ID="consumeRecordButton" runat="server" Text="消費紀錄" 
            PostBackUrl="~/10_Security/office/customer/customerConsumeRecord.aspx" />
&nbsp;<asp:Button ID="topUpButton" runat="server" 
            Text="會員加值/還款" 
            PostBackUrl="~/10_Security/office/customer/customerTopUp.aspx" />
&nbsp;<asp:Button ID="reservationButton" runat="server" Text="預約" 
            PostBackUrl="~/10_Security/office/customer/customerReservation.aspx" />
&nbsp;<asp:Button ID="reservationAppointmentButton" runat="server" 
            PostBackUrl="~/10_Security/office/customer/customerReservationAppointment.aspx" 
            Text="赴約" />
&nbsp;<asp:Button ID="consumeButton" runat="server" 
            Text="消費" 
            PostBackUrl="~/10_Security/office/customer/customerConsume.aspx" />
        <br />
        <asp:SqlDataSource ID="customerSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            SelectCommand="SELECT * FROM [Customer] WHERE ([cid] = @cid)" 
            ProviderName="<%$ ConnectionStrings:mikeConnectionString.ProviderName %>">
            <SelectParameters>
                <asp:SessionParameter Name="cid" SessionField="cid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
