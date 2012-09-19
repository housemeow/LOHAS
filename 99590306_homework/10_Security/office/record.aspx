<%@ Page Language="C#" AutoEventWireup="true" CodeFile="record.aspx.cs" Inherits="_10_Security_office_record" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body class="body">
    <form id="form1" runat="server">
    <div>
    
        <span class="title">消費紀錄</span><br />
        <br />
        <asp:RadioButtonList ID="executionStateRadioButtonList" runat="server" 
            AutoPostBack="True" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Selected="True" Value="%">所有紀錄</asp:ListItem>
            <asp:ListItem>服務中</asp:ListItem>
            <asp:ListItem>服務完畢</asp:ListItem>
            <asp:ListItem>預約中</asp:ListItem>
            <asp:ListItem>取消預約</asp:ListItem>
            <asp:ListItem>加值</asp:ListItem>
            <asp:ListItem>還款</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:GridView ID="consumeRecordGridView" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
            CellPadding="2" DataKeyNames="rid" DataSourceID="consumeRecordSqlDataSource" 
            ForeColor="Black" GridLines="None" HorizontalAlign="Center" 
            AllowSorting="True" onrowupdating="consumeRecordGridView_RowUpdating">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="rid" HeaderText="序號" InsertVisible="False" 
                    ReadOnly="True" SortExpression="rid" />
                <asp:BoundField DataField="customerName" HeaderText="客戶名稱" 
                    SortExpression="customerName" ReadOnly="True" >
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="serviceName" HeaderText="服務名稱" ReadOnly="True" 
                    SortExpression="serviceName" />
                <asp:BoundField DataField="masterName" HeaderText="師父名稱" 
                    SortExpression="masterName" ReadOnly="True" />
                <asp:BoundField DataField="serviceDate" HeaderText="服務時間" 
                    SortExpression="serviceDate" ReadOnly="True" />
                <asp:BoundField DataField="serviceMinute" HeaderText="服務長度(分)" 
                    SortExpression="serviceMinute" />
                <asp:BoundField DataField="servicePrice" HeaderText="價格" 
                    SortExpression="servicePrice" />
                <asp:BoundField DataField="masterCommission" HeaderText="師父抽成" 
                    SortExpression="masterCommission" />
                <asp:BoundField DataField="profit" HeaderText="淨利" 
                    SortExpression="profit" />
                <asp:BoundField DataField="debt" HeaderText="欠款" 
                    SortExpression="debt" />
                <asp:BoundField DataField="cash" HeaderText="現金" 
                    SortExpression="cash" />
                <asp:BoundField DataField="companyRevenue" HeaderText="公司收益" 
                    SortExpression="companyRevenue" />
                <asp:BoundField DataField="opinion" HeaderText="師父評價" 
                    SortExpression="opinion" />
                <asp:BoundField DataField="recorder" HeaderText="櫃台" 
                    SortExpression="recorder" />
                <asp:TemplateField HeaderText="執行狀態" SortExpression="executionState">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="executionStateRadioButtonList" runat="server" 
                            RepeatDirection="Horizontal" RepeatLayout="Flow" 
                            SelectedValue='<%# Bind("executionState") %>'>
                            <asp:ListItem>服務中</asp:ListItem>
                            <asp:ListItem>服務完畢</asp:ListItem>
                            <asp:ListItem>預約中</asp:ListItem>
                            <asp:ListItem Value="取消預約"></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("executionState") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField SelectText="選取" ShowSelectButton="True" ButtonType="Button" 
                    ShowDeleteButton="True" DeleteText="刪除" />
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
        <asp:SqlDataSource ID="consumeRecordSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            SelectCommand="SELECT Record.rid, Record.serviceDate, Record.serviceMinute, Record.servicePrice, Record.masterCommission, Record.profit, Record.debt, Record.cash, Record.companyRevenue, Record.opinion, Record.recorder, Record.executionState, Master.name AS masterName, Customer.name AS customerName, Service.name AS serviceName FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Master ON Record.mid = Master.mid INNER JOIN Service ON Record.sid = Service.sid WHERE (Record.executionState LIKE @executionState)" 
            
            
            
            UpdateCommand="UPDATE Record SET serviceMinute = @serviceMinute, servicePrice = @servicePrice, masterCommission = @masterCommission, profit = @profit, debt = @debt, cash = @cash, companyRevenue = @companyRevenue, opinion = @opinion, recorder = @recorder, executionState = @executionState WHERE rid = @rid" 
            DeleteCommand="DELETE FROM Record WHERE (rid = @rid)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="consumeRecordGridView" Name="rid" 
                    PropertyName="SelectedValue" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="executionStateRadioButtonList" 
                    DefaultValue="*" Name="executionState" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="servicePrice" SessionField="servicePrice" />
                <asp:SessionParameter Name="masterCommission" SessionField="masterCommision" />
                <asp:SessionParameter Name="profit" SessionField="profit" />
                <asp:SessionParameter Name="debt" SessionField="debt" />
                <asp:SessionParameter Name="cash" SessionField="cash" />
                <asp:SessionParameter Name="companyRevenue" SessionField="companyRevenue" />
                <asp:SessionParameter Name="opinion" SessionField="opinion" />
                <asp:SessionParameter Name="recorder" SessionField="recorder" />
                <asp:SessionParameter Name="executionState" SessionField="executionState" />
                <asp:SessionParameter Name="rid" SessionField="rid" />
                <asp:SessionParameter Name="serviceMinute" SessionField="serviceMinute" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <br />
        <asp:DetailsView ID="reservationDetailsView" runat="server" AutoGenerateRows="False" 
            CellPadding="4" DataKeyNames="預約序號" 
            DataSourceID="detailsReservationSqlDataSource" ForeColor="#333333" 
            GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="預約序號" HeaderText="預約序號" InsertVisible="False" 
                    ReadOnly="True" SortExpression="預約序號" />
                <asp:BoundField DataField="客戶名稱" HeaderText="客戶名稱" SortExpression="客戶名稱" />
                <asp:BoundField DataField="服務項目" HeaderText="服務項目" SortExpression="服務項目" />
                <asp:BoundField DataField="師父" HeaderText="師父" SortExpression="師父" />
                <asp:BoundField DataField="預約時間" HeaderText="預約時間" SortExpression="預約時間" />
                <asp:BoundField DataField="服務長度(min)" HeaderText="服務長度(min)" 
                    SortExpression="服務長度(min)" />
                <asp:BoundField DataField="收費價格" HeaderText="收費價格" SortExpression="收費價格" />
                <asp:BoundField DataField="師父評價" HeaderText="師父評價" SortExpression="師父評價" />
                <asp:BoundField DataField="現金收入" HeaderText="現金收入" SortExpression="現金收入" />
                <asp:BoundField DataField="師父抽成" HeaderText="師父抽成" SortExpression="師父抽成" />
                <asp:BoundField DataField="淨利" HeaderText="淨利" SortExpression="淨利" />
                <asp:BoundField DataField="欠款" HeaderText="欠款" SortExpression="欠款" />
                <asp:BoundField DataField="公司營收" HeaderText="公司營收" SortExpression="公司營收" />
                <asp:BoundField DataField="執行狀態" HeaderText="執行狀態" SortExpression="執行狀態" />
                <asp:BoundField DataField="櫃台" HeaderText="櫃台" SortExpression="櫃台" />
                <asp:BoundField DataField="備註" HeaderText="備註" SortExpression="備註" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="detailsReservationSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            SelectCommand="SELECT Record.rid AS 預約序號, Customer.name AS 客戶名稱, Service.name AS 服務項目, Master.name AS 師父, Record.serviceDate AS 預約時間, Record.serviceMinute AS [服務長度(min)], Record.servicePrice AS 收費價格, Record.opinion AS 師父評價, Record.cash AS 現金收入, Record.masterCommission AS 師父抽成, Record.profit AS 淨利, Record.debt AS 欠款, Record.companyRevenue AS 公司營收, Record.executionState AS 執行狀態, Record.recorder AS 櫃台, Record.comment AS 備註 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Master ON Record.mid = Master.mid INNER JOIN Service ON Record.sid = Service.sid WHERE (Record.rid = @rid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="consumeRecordGridView" Name="rid" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
