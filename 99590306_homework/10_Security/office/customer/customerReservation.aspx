<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customerReservation.aspx.cs" Inherits="_10_Security_office_customer_customerReservation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style2
        {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="body">
    
        <span class="title">預約系統</span><br />
        <br />
        <br />
        <asp:DetailsView ID="customerDetailsView" runat="server" 
            AutoGenerateRows="False" CellPadding="4" DataSourceID="customerSqlDataSource" 
            ForeColor="#333333" GridLines="None" Height="50px" HorizontalAlign="Center" 
            Width="291px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                <asp:BoundField DataField="specifiedMaster" HeaderText="指定師父" 
                    SortExpression="specifiedMaster" />
                <asp:BoundField DataField="acceptableMaster" HeaderText="可接受師父" 
                    SortExpression="acceptableMaster" />
                <asp:BoundField DataField="refuceMaster" HeaderText="拒絕師父" 
                    SortExpression="refuceMaster" />
                <asp:BoundField DataField="restMoney" HeaderText="剩餘儲值金額" 
                    SortExpression="restMoney" />
                <asp:BoundField DataField="debt" HeaderText="欠款" SortExpression="debt" />
                <asp:BoundField DataField="shareFamily" HeaderText="共享親友名單" 
                    SortExpression="shareFamily" />
                <asp:BoundField DataField="health" HeaderText="健康狀況" SortExpression="health" />
                <asp:BoundField DataField="birthday" DataFormatString="{0:d}" HeaderText="生日" 
                    SortExpression="birthday" />
                <asp:BoundField DataField="comment" HeaderText="備註" SortExpression="comment" />
                <asp:BoundField DataField="firstTopUp" HeaderText="首次加值日期" 
                    SortExpression="firstTopUp" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="customerSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            SelectCommand="SELECT [name], [shareFamily], [restMoney], [comment], [specifiedMaster], [acceptableMaster], [refuceMaster], [health], [birthday], [debt], [firstTopUp] FROM [Customer] WHERE ([cid] = @cid)">
            <SelectParameters>
                <asp:SessionParameter Name="cid" SessionField="cid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <span class="body"><strong>選擇服務<br />
        <asp:DropDownList ID="serviceDropDownList" runat="server" AutoPostBack="True" 
            DataSourceID="serviceListSqlDataSource" DataTextField="name" 
            DataValueField="sid">
        </asp:DropDownList>
        <asp:SqlDataSource ID="serviceListSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            SelectCommand="SELECT [sid], [name] FROM [Service] WHERE (([name] &lt;&gt; @name) AND ([name] &lt;&gt; @name2))">
            <SelectParameters>
                <asp:Parameter DefaultValue="加值" Name="name" Type="String" />
                <asp:Parameter DefaultValue="還款" Name="name2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        </strong></span>
        <asp:FormView ID="serviceFormView" runat="server" 
            DataSourceID="serviceSqlDataSource" HorizontalAlign="Center" 
            ondatabound="serviceFormView_DataBound" CellPadding="4" 
            ForeColor="#333333">
            <EditItemTemplate>
                name:
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                <br />
                vipCost:
                <asp:TextBox ID="vipCostTextBox" runat="server" Text='<%# Bind("vipCost") %>' />
                <br />
                generalCost:
                <asp:TextBox ID="generalCostTextBox" runat="server" 
                    Text='<%# Bind("generalCost") %>' />
                <br />
                comment:
                <asp:TextBox ID="commentTextBox" runat="server" Text='<%# Bind("comment") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                name:
                <asp:TextBox ID="nameTextBox0" runat="server" Text='<%# Bind("name") %>' />
                <br />
                vipCost:
                <asp:TextBox ID="vipCostTextBox0" runat="server" 
                    Text='<%# Bind("vipCost") %>' />
                <br />
                generalCost:
                <asp:TextBox ID="generalCostTextBox0" runat="server" 
                    Text='<%# Bind("generalCost") %>' />
                <br />
                comment:
                <asp:TextBox ID="commentTextBox0" runat="server" 
                    Text='<%# Bind("comment") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                會員價格:
                <asp:Label ID="vipCostLabel" runat="server" Text='<%# Bind("vipCost") %>' />
                <br />
                一般價格:
                <asp:Label ID="generalCostLabel" runat="server" 
                    Text='<%# Bind("generalCost") %>' />
                <br />
                備註:
                <asp:Label ID="commentLabel" runat="server" Text='<%# Bind("comment") %>' />
                <br />
            </ItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView>
        <asp:SqlDataSource ID="serviceSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            SelectCommand="SELECT [name], [vipCost], [generalCost], [comment], [sid] FROM [Service] WHERE ([sid] = @sid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="serviceDropDownList" Name="sid" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="isVipLabel" runat="server" style="font-weight: 700"></asp:Label>
        <br />
        <br />
        <strong>選擇師父<br />
        </strong>
        <asp:DropDownList ID="masterDropDownList" runat="server" AutoPostBack="True" 
            DataSourceID="masterListSqlDataSource" DataTextField="name" 
            DataValueField="mid">
        </asp:DropDownList>
        <asp:SqlDataSource ID="masterListSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            SelectCommand="SELECT [mid], [name] FROM [Master] WHERE (([name] &lt;&gt; @name) AND ([name] &lt;&gt; @name2))">
            <SelectParameters>
                <asp:Parameter DefaultValue="加值" Name="name" Type="String" />
                <asp:Parameter DefaultValue="還款" Name="name2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="masterFormView" runat="server" DataKeyNames="mid" 
            DataSourceID="masterSqlDataSource" HorizontalAlign="Center" 
            CellPadding="4" ForeColor="#333333">
            <EditItemTemplate>
                mid:
                <asp:Label ID="midLabel1" runat="server" Text='<%# Eval("mid") %>' />
                <br />
                name:
                <asp:TextBox ID="nameTextBox1" runat="server" Text='<%# Bind("name") %>' />
                <br />
                gender:
                <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
                <br />
                address:
                <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                <br />
                phone:
                <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                <br />
                cellphone:
                <asp:TextBox ID="cellphoneTextBox" runat="server" 
                    Text='<%# Bind("cellphone") %>' />
                <br />
                comment:
                <asp:TextBox ID="commentTextBox1" runat="server" 
                    Text='<%# Bind("comment") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton0" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                name:
                <asp:TextBox ID="nameTextBox2" runat="server" Text='<%# Bind("name") %>' />
                <br />
                gender:
                <asp:TextBox ID="genderTextBox0" runat="server" Text='<%# Bind("gender") %>' />
                <br />
                address:
                <asp:TextBox ID="addressTextBox0" runat="server" 
                    Text='<%# Bind("address") %>' />
                <br />
                phone:
                <asp:TextBox ID="phoneTextBox0" runat="server" Text='<%# Bind("phone") %>' />
                <br />
                cellphone:
                <asp:TextBox ID="cellphoneTextBox0" runat="server" 
                    Text='<%# Bind("cellphone") %>' />
                <br />
                comment:
                <asp:TextBox ID="commentTextBox2" runat="server" 
                    Text='<%# Bind("comment") %>' />
                <br />
                <asp:LinkButton ID="InsertButton0" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton0" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                姓名:
                <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' />
                <br />
                性別:
                <asp:Label ID="genderLabel" runat="server" Text='<%# Bind("gender") %>' />
                <br />
            </ItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView>
        <asp:SqlDataSource ID="masterSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            SelectCommand="SELECT [name], [gender], [mid] FROM [Master] WHERE ([mid] = @mid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="masterDropDownList" Name="mid" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        預約時段<br />
        <div align="center">
            <asp:Calendar ID="reservationDateCalendar" runat="server" BackColor="White"
            BorderColor="White" BorderWidth="1px" CssClass="title" Font-Names="Verdana" 
            Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" 
            Width="350px" onselectionchanged="reservationDateCalendar_SelectionChanged">
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
            <TodayDayStyle BackColor="#CCCCCC" />
        </asp:Calendar>
                    <br />
        <table align="center">
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel" runat="server" Text="10"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList1" runat="server" 
                        DataSourceID="SqlDataSourceReservation" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="hourLabel" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel0" runat="server" Text="11"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList16" runat="server" 
                        DataSourceID="SqlDataSourceReservation0" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label0" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label0" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label0" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label0" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label0" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label0" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label0" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label0" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label0" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label0" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation0" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel0" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel1" runat="server" Text="12"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList17" runat="server" 
                        DataSourceID="SqlDataSourceReservation1" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label1" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label1" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label1" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label1" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label1" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label1" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label1" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label1" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label1" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label1" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel1" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel2" runat="server" Text="13"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList18" runat="server" 
                        DataSourceID="SqlDataSourceReservation2" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label2" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label2" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label2" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label2" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label2" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label2" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label2" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label2" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label2" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label2" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel2" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel3" runat="server" Text="14"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList19" runat="server" 
                        DataSourceID="SqlDataSourceReservation3" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label3" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label3" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label3" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label3" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label3" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label3" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label3" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label3" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label3" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label3" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel3" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel4" runat="server" Text="15"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList20" runat="server" 
                        DataSourceID="SqlDataSourceReservation4" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label4" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label4" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label4" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label4" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label4" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label4" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label4" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label4" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label4" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label4" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel4" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel5" runat="server" Text="16"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList21" runat="server" 
                        DataSourceID="SqlDataSourceReservation5" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label5" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label5" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label5" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label5" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label5" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label5" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label5" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label5" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label5" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label5" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel5" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel6" runat="server" Text="17"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList22" runat="server" 
                        DataSourceID="SqlDataSourceReservation6" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label6" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label6" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label6" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label6" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label6" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label6" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label6" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label6" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label6" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label6" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel6" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel7" runat="server" Text="18"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList23" runat="server" 
                        DataSourceID="SqlDataSourceReservation7" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label7" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label7" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label7" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label7" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label7" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label7" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label7" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label7" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label7" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label7" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation7" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel7" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel8" runat="server" Text="19"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList24" runat="server" 
                        DataSourceID="SqlDataSourceReservation8" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label8" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label8" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label8" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label8" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label8" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label8" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label8" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label8" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label8" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label8" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation8" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel8" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel9" runat="server" Text="20"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList25" runat="server" 
                        DataSourceID="SqlDataSourceReservation9" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label9" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label9" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label9" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label9" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label9" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label9" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label9" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label9" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label9" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label9" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation9" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel9" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel10" runat="server" Text="21"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList26" runat="server" 
                        DataSourceID="SqlDataSourceReservation10" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label10" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label10" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label10" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label10" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label10" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label10" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label10" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label10" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label10" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label10" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation10" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel10" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel11" runat="server" Text="22"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList27" runat="server" 
                        DataSourceID="SqlDataSourceReservation11" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label11" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label11" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label11" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label11" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label11" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label11" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label11" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label11" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label11" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label11" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation11" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel11" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel12" runat="server" Text="23"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList28" runat="server" 
                        DataSourceID="SqlDataSourceReservation12" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label12" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label12" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label12" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label12" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label12" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label12" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label12" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label12" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label12" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label12" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation12" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel12" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
            <tr>
                <td class="style2" bgcolor="#FFFBD6">
                    <asp:Label ID="hourLabel13" runat="server" Text="24"></asp:Label>
                    點</td>
                <td>
                    <asp:DataList ID="DataList29" runat="server" 
                        DataSourceID="SqlDataSourceReservation13" RepeatDirection="Horizontal" 
                        CellPadding="4" ForeColor="#333333">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <ItemTemplate>
                            <asp:Label ID="客戶Label13" runat="server" Text='<%# Eval("客戶") %>' />
                            <br />
                            時段:
                            <asp:Label ID="日期Label13" runat="server" Text='<%# Eval("日期") %>' />
                            <br />
                            服務長度:
                            <asp:Label ID="服務長度Label13" runat="server" Text='<%# Eval("服務長度") %>' />
                            <br />
                            手機:
                            <asp:Label ID="手機Label13" runat="server" Text='<%# Eval("手機") %>' />
                            <br />
                            電話:
                            <asp:Label ID="電話Label13" runat="server" Text='<%# Eval("電話") %>' />
                            <br />
                            服務項目:
                            <asp:Label ID="服務項目Label13" runat="server" Text='<%# Eval("服務項目") %>' />
                            <br />
                            總額:
                            <asp:Label ID="總額Label13" runat="server" Text='<%# Eval("總額") %>' />
                            <br />
                            師父抽成:
                            <asp:Label ID="師父抽成Label13" runat="server" Text='<%# Eval("師父抽成") %>' />
                            <br />
                            服務師父:
                            <asp:Label ID="服務師父Label13" runat="server" Text='<%# Eval("服務師父") %>' />
                            <br />
                            櫃台:
                            <asp:Label ID="櫃台Label13" runat="server" Text='<%# Eval("櫃台") %>' />
<br />
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceReservation13" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="reservationDateCalendar" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel13" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
        </table>
                    </div>
                    <br />
        <asp:DropDownList ID="reservationHourDropDownList" runat="server" 
            AutoPostBack="True" 
            onselectedindexchanged="reservationTimeDropDownList_SelectedIndexChanged">
        </asp:DropDownList>
                    時 
                    <asp:DropDownList ID="reservationMinuteDropDownList" runat="server" 
                        CssClass="style2" 
                        
            onselectedindexchanged="reservationMinuteDropDownList_SelectedIndexChanged" 
            AutoPostBack="True">
                    </asp:DropDownList>
                    分<br />
        服務時間長度:<asp:DropDownList 
            ID="serviceMinuteDropDownList" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <br />
                    <br />
                    預約時間:<asp:Label ID="reservationTimeLabel" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="確定" />
        <asp:SqlDataSource ID="reservationSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            DeleteCommand="DELETE FROM [Record] WHERE [rid] = @rid" 
            InsertCommand="INSERT INTO Record(sid, cid, mid, serviceDate, serviceMinute, servicePrice, masterCommission, profit, debt, cash, companyRevenue, executionState) VALUES (@sid, @cid, @mid, @serviceDate, @serviceMinute, @servicePrice, @masterCommission, @profit, @debt, @cash, @companyRevenue, @executionState)" 
            SelectCommand="SELECT * FROM [Record]" 
            
            
            UpdateCommand="UPDATE [Record] SET [sid] = @sid, [cid] = @cid, [mid] = @mid, [serviceDate] = @serviceDate, [serviceMinute] = @serviceMinute, [servicePrice] = @servicePrice, [masterCommission] = @masterCommission, [profit] = @profit, [debt] = @debt, [cash] = @cash, [companyRevenue] = @companyRevenue, [opinion] = @opinion, [recorder] = @recorder, [executionState] = @executionState WHERE [rid] = @rid">
            <DeleteParameters>
                <asp:Parameter Name="rid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="serviceDropDownList" Name="sid" 
                    PropertyName="SelectedValue" DefaultValue="" />
                <asp:SessionParameter Name="cid" SessionField="cid" />
                <asp:ControlParameter ControlID="masterDropDownList" 
                    Name="mid" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="reservationTimeLabel" Name="serviceDate" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="serviceMinuteDropDownList" 
                    Name="serviceMinute" PropertyName="SelectedValue" />
                <asp:SessionParameter Name="servicePrice" 
                    SessionField="servicePrice" />
                <asp:Parameter DefaultValue="0" Name="masterCommission" />
                <asp:Parameter Name="profit" DefaultValue="0" />
                <asp:Parameter Name="debt" DefaultValue="0" />
                <asp:Parameter Name="cash" DefaultValue="0" />
                <asp:Parameter Name="companyRevenue" DefaultValue="0" />
                <asp:Parameter Name="executionState" DefaultValue="預約中" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="sid" Type="Int32" />
                <asp:Parameter Name="cid" Type="Int32" />
                <asp:Parameter Name="mid" Type="Int32" />
                <asp:Parameter Name="serviceDate" Type="DateTime" />
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
                <asp:Parameter Name="rid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="createButton" runat="server" 
            PostBackUrl="~/10_Security/office/customer/customerCreate.aspx" Text="新增客戶" />
&nbsp;<asp:Button ID="selectButton" runat="server" 
            Text="選擇其他會員" 
            PostBackUrl="~/10_Security/office/customer/customerSelect.aspx" />
&nbsp;<asp:Button ID="reservationButton" runat="server" Text="檢視會員資料" 
            PostBackUrl="~/10_Security/office/customer/customerView.aspx" />
&nbsp;<asp:Button ID="modifyButton" runat="server" 
            Text="修改會員資料" 
            PostBackUrl="~/10_Security/office/customer/customerModify.aspx" />
&nbsp;<asp:Button ID="consumeRecordButton" runat="server" Text="消費紀錄" 
            PostBackUrl="~/10_Security/office/customer/customerConsumeRecord.aspx" />
&nbsp;<asp:Button ID="topUpButton" runat="server" 
            Text="會員加值/還款" 
            PostBackUrl="~/10_Security/office/customer/customerTopUp.aspx" />
&nbsp;<asp:Button ID="reservationAppointmentButton" runat="server" 
            PostBackUrl="~/10_Security/office/customer/customerReservationAppointment.aspx" 
            Text="赴約" />
&nbsp;<asp:Button ID="consumeButton" runat="server" 
            Text="消費" 
            PostBackUrl="~/10_Security/office/customer/customerConsume.aspx" />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
