<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reservationTable.aspx.cs" Inherits="_10_Security_office_reservationTable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="style1">
    <span class="title">
    預約表格<br />
    </span>
    請選擇日期
        <br />
        </div>
        <table 
        
        '/="center">
            <tr>
                <td>
    
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
            BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
            ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" 
            style="text-align: center">
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
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
                    PropertyName="SelectedDate.Day" />
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
        <asp:SqlDataSource ID="SqlDataSourceReservation0" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
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
        <asp:SqlDataSource ID="SqlDataSourceReservation1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
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
        <asp:SqlDataSource ID="SqlDataSourceReservation2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
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
        <asp:SqlDataSource ID="SqlDataSourceReservation3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
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
        <asp:SqlDataSource ID="SqlDataSourceReservation4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
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
        <asp:SqlDataSource ID="SqlDataSourceReservation5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
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
        <asp:SqlDataSource ID="SqlDataSourceReservation6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
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
        <asp:SqlDataSource ID="SqlDataSourceReservation7" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
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
        <asp:SqlDataSource ID="SqlDataSourceReservation8" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
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
        <asp:SqlDataSource ID="SqlDataSourceReservation9" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
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
        <asp:SqlDataSource ID="SqlDataSourceReservation10" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
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
        <asp:SqlDataSource ID="SqlDataSourceReservation11" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
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
        <asp:SqlDataSource ID="SqlDataSourceReservation12" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
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
        <asp:SqlDataSource ID="SqlDataSourceReservation13" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
                        
                        
                        SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 服務長度, Record.servicePrice AS 總額, Record.masterCommission AS 師父抽成, Record.recorder AS 櫃台, Customer.name AS 客戶, Customer.cellphone AS 手機, Customer.phone AS 電話, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Service ON Record.sid = Service.sid INNER JOIN Master ON Record.mid = Master.mid WHERE (Record.executionState = '預約中') AND (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (DAY(Record.serviceDate) = @Day) AND (DATEPART(hh, Record.serviceDate) = @hour OR DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) = @hour OR DATEPART(hh, Record.serviceDate) &lt;= @hour AND DATEPART(hh, DATEADD(n, Record.serviceMinute, Record.serviceDate)) &gt; @hour)">
            <SelectParameters>
                <asp:ControlParameter ControlID="Calendar1" Name="Year" 
                    PropertyName="SelectedDate.Year" />
                <asp:ControlParameter ControlID="Calendar1" Name="Month" 
                    PropertyName="SelectedDate.Month" />
                <asp:ControlParameter ControlID="Calendar1" Name="Day" 
                    PropertyName="SelectedDate.Day" />
                <asp:ControlParameter ControlID="hourLabel13" Name="hour" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                </td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>
</body>
</html>
