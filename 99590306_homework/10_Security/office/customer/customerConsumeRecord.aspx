<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customerConsumeRecord.aspx.cs" Inherits="_11_Project_customer_customerConsumeRecord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body class="body">
    <form id="form1" runat="server">
    <div>
    
        <span class="title">消費紀錄</span><br />
        <br />
        <asp:RadioButtonList ID="executionStateRadioButtonList0" runat="server" 
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
        <table border="1" class="style1">
            <tr>
                <td colspan="2">
                    <asp:CheckBox ID="dateFilterCheckBox" runat="server" AutoPostBack="True" 
                        oncheckedchanged="dateFilterCheckBox_CheckedChanged" Text="以日期篩選紀錄" />
                </td>
            </tr>
            <tr>
                <td>
                    開始時間：<asp:Label ID="startDateLabel" runat="server"></asp:Label>
                </td>
                <td>
                    結束時間：<asp:Label ID="endDateLabel" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Calendar ID="startDateCalendar" runat="server" BackColor="White" 
                        BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                        ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" 
                        onselectionchanged="startDateCalendar_SelectionChanged" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                            VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                            Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                </td>
                <td align="center">
                    <asp:Calendar ID="endDateCalendar" runat="server" BackColor="White" 
                        BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                        ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" 
                        onselectionchanged="endDateCalendar_SelectionChanged" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                            VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                            Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="nullLabel" runat="server"></asp:Label>
        <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:GridView ID="consumeRecordGridView" runat="server" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" DataKeyNames="rid" 
            DataSourceID="customerSqlDataSource" ForeColor="Black" GridLines="None" 
            HorizontalAlign="Center" ondatabound="consumeRecordGridView_DataBound" 
            onselectedindexchanged="consumeRecordGridView_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="rid" HeaderText="消費序號" InsertVisible="False" 
                    ReadOnly="True" SortExpression="rid" />
                <asp:BoundField DataField="serviceName" HeaderText="服務名稱" 
                    SortExpression="serviceName" />
                <asp:BoundField DataField="masterName" HeaderText="師父名稱" 
                    SortExpression="masterName" />
                <asp:BoundField DataField="serviceDate" HeaderText="服務時間" 
                    SortExpression="serviceDate" />
                <asp:BoundField DataField="serviceMinute" HeaderText="時間長度(min)" 
                    SortExpression="serviceMinute" />
                <asp:BoundField DataField="servicePrice" HeaderText="消費價格" 
                    SortExpression="servicePrice" />
                <asp:BoundField DataField="masterCommission" HeaderText="師父抽成" 
                    SortExpression="masterCommission" />
                <asp:BoundField DataField="profit" HeaderText="淨利" SortExpression="profit" />
                <asp:BoundField DataField="debt" HeaderText="欠款" SortExpression="debt" />
                <asp:BoundField DataField="cash" HeaderText="現金收入" SortExpression="cash" />
                <asp:BoundField DataField="companyRevenue" HeaderText="公司營收" 
                    SortExpression="companyRevenue" />
                <asp:BoundField DataField="opinion" HeaderText="評價" SortExpression="opinion" />
                <asp:BoundField DataField="recorder" HeaderText="櫃台" 
                    SortExpression="recorder" />
                <asp:BoundField DataField="executionState" HeaderText="執行狀態" 
                    SortExpression="executionState" />
                <asp:BoundField DataField="comment" HeaderText="備註" SortExpression="comment" />
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
        <asp:SqlDataSource ID="customerSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
            
            SelectCommand="SELECT Record.serviceDate, Record.serviceMinute, Record.servicePrice, Record.masterCommission, Record.profit, Record.debt, Record.cash, Record.companyRevenue, Record.opinion, Record.recorder, Record.executionState, Master.name AS masterName, Service.name AS serviceName, Record.rid, Record.comment FROM Record INNER JOIN Master ON Record.mid = Master.mid INNER JOIN Service ON Record.sid = Service.sid WHERE (Record.cid = @cid) AND (Record.executionState LIKE @executionState) ORDER BY Record.serviceDate DESC">
            <SelectParameters>
                <asp:SessionParameter Name="cid" SessionField="cid" Type="Int32" />
                <asp:ControlParameter ControlID="executionStateRadioButtonList0" 
                    Name="executionState" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="consumeRecordDetailsView" runat="server" 
            AutoGenerateRows="False" CellPadding="4" DataKeyNames="rid" 
            DataSourceID="updateRecordSqlDataSource" ForeColor="#333333" 
            GridLines="None" Height="50px" HorizontalAlign="Center" 
            onitemupdated="consumeRecordDetailsView_ItemUpdated" 
            onload="consumeRecordDetailsView_Load" 
            onpageindexchanging="consumeRecordDetailsView_PageIndexChanging" 
            ondatabound="consumeRecordDetailsView_DataBound">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="rid" HeaderText="序號" InsertVisible="False" 
                    ReadOnly="True" SortExpression="rid" />
                <asp:TemplateField HeaderText="服務長度" SortExpression="serviceMinute">
                    <EditItemTemplate>
                        <asp:TextBox ID="serviceMinuteTextBox" runat="server" 
                            Text='<%# Bind("serviceMinute") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("serviceMinute") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="serviceMinuteLabel" runat="server" 
                            Text='<%# Bind("serviceMinute") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="收費價格" SortExpression="servicePrice">
                    <EditItemTemplate>
                        <asp:TextBox ID="servicePriceTextBox" runat="server" 
                            Text='<%# Bind("servicePrice") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("servicePrice") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="servicePriceLabel" runat="server" 
                            Text='<%# Bind("servicePrice") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="師父抽成" SortExpression="masterCommission">
                    <EditItemTemplate>
                        <asp:TextBox ID="masterCommissionTextBox" runat="server" 
                            Text='<%# Bind("masterCommission") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" 
                            Text='<%# Bind("masterCommission") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="masterComissionLabel" runat="server" 
                            Text='<%# Bind("masterCommission") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="淨利" SortExpression="profit">
                    <EditItemTemplate>
                        <asp:TextBox ID="profitTextBox" runat="server" Text='<%# Bind("profit") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("profit") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="profitLabel" runat="server" Text='<%# Bind("profit") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="欠款" SortExpression="debt">
                    <EditItemTemplate>
                        <asp:TextBox ID="debtTextBox" runat="server" Text='<%# Bind("debt") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("debt") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("debt") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="現金收入" SortExpression="cash">
                    <EditItemTemplate>
                        <asp:TextBox ID="cashTextBox" runat="server" Text='<%# Bind("cash") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("cash") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("cash") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="公司收益" SortExpression="companyRevenue">
                    <EditItemTemplate>
                        <asp:TextBox ID="companyRevenueTextBox" runat="server" 
                            Text='<%# Bind("companyRevenue") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("companyRevenue") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("companyRevenue") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="櫃台" SortExpression="recorder">
                    <EditItemTemplate>
                        <asp:TextBox ID="recorderTextBox" runat="server" Text='<%# Bind("recorder") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("recorder") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("recorder") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="師父評價" SortExpression="opinion">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="opinionRadioButtonList" runat="server" 
                            AutoPostBack="True" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Selected="True">很好</asp:ListItem>
                            <asp:ListItem>一般</asp:ListItem>
                            <asp:ListItem>不好</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("opinion") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("opinion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="executionState" HeaderText="執行狀態" ReadOnly="True" 
                    SortExpression="executionState" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <FooterTemplate>
                <asp:Button ID="okButton" runat="server" onclick="okButton_Click" Text="確定" />
            </FooterTemplate>
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="updateRecordSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            DeleteCommand="DELETE FROM [Record] WHERE [rid] = @rid" 
            InsertCommand="INSERT INTO [Record] ([serviceMinute], [servicePrice], [masterCommission], [profit], [debt], [cash], [companyRevenue], [opinion], [recorder], [executionState]) VALUES (@serviceMinute, @servicePrice, @masterCommission, @profit, @debt, @cash, @companyRevenue, @opinion, @recorder, @executionState)" 
            SelectCommand="SELECT rid, serviceMinute, servicePrice, masterCommission, profit, debt, cash, companyRevenue, opinion, recorder, executionState, serviceDate FROM Record WHERE (rid = @rid)" 
            
            
            UpdateCommand="UPDATE Record SET serviceMinute = @serviceMinute, servicePrice = @servicePrice, masterCommission = @masterCommission, profit = @profit, debt = @debt, cash = @cash, companyRevenue = @companyRevenue, opinion = @opinion, recorder = @recorder WHERE (rid = @rid)">
            <DeleteParameters>
                <asp:Parameter Name="rid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="serviceMinute" Type="Int32" />
                <asp:Parameter Name="servicePrice" Type="Int32" />
                <asp:Parameter Name="masterCommission" Type="Int32" />
                <asp:Parameter Name="profit" Type="Int32" />
                <asp:Parameter Name="debt" Type="Int32" />
                <asp:Parameter Name="cash" Type="Int32" />
                <asp:Parameter Name="companyRevenue" Type="Int32" />
                <asp:Parameter Name="opinion" Type="String" />
                <asp:Parameter Name="recorder" Type="String" />
                <asp:Parameter Name="executionState" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="consumeRecordGridView" Name="rid" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter DefaultValue="" Name="serviceMinute" 
                    SessionField="serviceMinute" Type="Int32" />
                <asp:SessionParameter Name="servicePrice" SessionField="servicePrice" 
                    Type="Int32" />
                <asp:SessionParameter Name="masterCommission" SessionField="masterCommision" 
                    Type="Int32" />
                <asp:SessionParameter Name="profit" SessionField="profit" Type="Int32" />
                <asp:SessionParameter Name="debt" SessionField="debt" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="cash" SessionField="cash" 
                    Type="Int32" />
                <asp:SessionParameter Name="companyRevenue" SessionField="companyRevenue" 
                    Type="Int32" />
                <asp:SessionParameter DefaultValue="一般" Name="opinion" SessionField="opinion" 
                    Type="String" />
                <asp:SessionParameter DefaultValue="" Name="recorder" SessionField="recorder" 
                    Type="String" />
                <asp:ControlParameter ControlID="consumeRecordGridView" Name="rid" 
                    PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    
        <span class="body">
        <asp:Button ID="createButton" runat="server" 
            PostBackUrl="~/10_Security/office/customer/customerCreate.aspx" Text="新增客戶" />
&nbsp;<asp:Button ID="selectButton" runat="server" 
            Text="選擇其他會員" 
            PostBackUrl="~/10_Security/office/customer/customerSelect.aspx" />
&nbsp;<asp:Button ID="viewButton" runat="server" 
            PostBackUrl="~/10_Security/office/customer/customerView.aspx" 
            Text="檢視會員" />
        &nbsp;<asp:Button ID="consumeRecordButton" runat="server" Text="修改客戶資料" 
            PostBackUrl="~/10_Security/office/customer/customerModify.aspx" />
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
        </span>
    
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
