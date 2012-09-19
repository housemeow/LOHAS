<%@ Page Language="C#" AutoEventWireup="true" CodeFile="serviceComplete.aspx.cs" Inherits="_10_Security_office_setOpinion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body class="body">
    <form id="form1" runat="server">
    <div>
    
        <span class="title">給予師父評價<br />
        </span>
        <br />
    
        <br />
        <asp:Label ID="nullLabel" runat="server"></asp:Label>
    
        <br />
        <asp:GridView ID="consumeRecordGridView" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" DataKeyNames="rid" 
            DataSourceID="consumeRecordSqlDataSource" ForeColor="Black" 
            GridLines="None" HorizontalAlign="Center" 
            ondatabound="consumeRecordGridView_DataBound" style="text-align: center">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="rid" HeaderText="消費序號" InsertVisible="False" 
                    ReadOnly="True" SortExpression="rid" />
                <asp:BoundField DataField="name" HeaderText="姓名" 
                    SortExpression="name" />
                <asp:BoundField DataField="serviceDate" HeaderText="服務時間" 
                    SortExpression="serviceDate" />
                <asp:BoundField DataField="serviceMinute" HeaderText="服務長度" 
                    SortExpression="serviceMinute" />
                <asp:BoundField DataField="servicePrice" HeaderText="價格" 
                    SortExpression="servicePrice" />
                <asp:BoundField DataField="masterCommission" HeaderText="師父抽成" 
                    SortExpression="masterCommission" />
                <asp:BoundField DataField="profit" HeaderText="淨利" SortExpression="profit" />
                <asp:BoundField DataField="debt" HeaderText="欠款" SortExpression="debt" />
                <asp:BoundField DataField="cash" HeaderText="現金" 
                    SortExpression="cash" />
                <asp:BoundField DataField="companyRevenue" HeaderText="公司收益" 
                    SortExpression="companyRevenue" />
                <asp:BoundField DataField="recorder" HeaderText="櫃台" 
                    SortExpression="recorder" />
                <asp:CommandField ShowSelectButton="True" SelectText="選擇" />
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
        <asp:SqlDataSource ID="updateConsumeReordSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            DeleteCommand="DELETE FROM [Record] WHERE [rid] = @rid" 
            InsertCommand="INSERT INTO [Record] ([opinion], [executionState]) VALUES (@opinion, @executionState)" 
            SelectCommand="SELECT [rid], [opinion], [executionState] FROM [Record]" 
            
            UpdateCommand="UPDATE [Record] SET [opinion] = @opinion, [executionState] = @executionState WHERE [rid] = @rid">
            <DeleteParameters>
                <asp:Parameter Name="rid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="opinion" Type="String" />
                <asp:Parameter Name="executionState" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="opinionTextBox" Name="opinion" 
                    PropertyName="Text" Type="String" />
                <asp:Parameter DefaultValue="服務完畢" Name="executionState" Type="String" />
                <asp:SessionParameter Name="rid" SessionField="rid" Type="Int32" 
                    DefaultValue="" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="consumeRecordSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            SelectCommand="SELECT Record.rid, Customer.name, Record.serviceDate, Record.serviceMinute, Record.servicePrice, Record.masterCommission, Record.profit, Record.debt, Record.cash, Record.companyRevenue, Record.recorder FROM Record INNER JOIN Customer ON Record.cid = Customer.cid WHERE (Record.executionState = @executionState) ORDER BY Record.serviceDate">
            <SelectParameters>
                <asp:Parameter DefaultValue="服務中" Name="executionState" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:RadioButtonList ID="opinionRadioButtonList" runat="server" 
            RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="True" 
            onselectedindexchanged="opinionRadioButtonList_SelectedIndexChanged">
            <asp:ListItem Selected="True">很棒</asp:ListItem>
            <asp:ListItem>ok</asp:ListItem>
            <asp:ListItem>不習慣</asp:ListItem>
            <asp:ListItem>自訂</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:TextBox ID="opinionTextBox" runat="server" Height="42px" Width="231px" 
            AutoPostBack="True">很棒</asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="修改" />
        <br />
    
    </div>
    </form>
</body>
</html>
