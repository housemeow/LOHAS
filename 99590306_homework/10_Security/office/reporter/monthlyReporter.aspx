<%@ Page Language="C#" AutoEventWireup="true" CodeFile="monthlyReporter.aspx.cs" Inherits="_10_Security_office_reporter_monthlyReporter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .SmallTitle1
        {
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
    
        <div class="style1">
            <span class="title">月報表<br />
        </span>
        <br />
        <br />年份：<asp:DropDownList ID="yearDropDownList" runat="server" 
                            AutoPostBack="True" 
                DataSourceID="SqlDataSourceYear" DataTextField="year" 
                DataValueField="year">
        </asp:DropDownList>
        　月份：<asp:DropDownList ID="monthDropDownList" runat="server" 
                            AutoPostBack="True" DataSourceID="SqlDataSourceMonth" 
                DataTextField="month" DataValueField="month">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
        </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceMonth" runat="server" 
                ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
                SelectCommand="SELECT MONTH(serviceDate) AS month FROM Record WHERE (YEAR(serviceDate) = @year) GROUP BY MONTH(serviceDate) ORDER BY month">
                <SelectParameters>
                    <asp:ControlParameter ControlID="yearDropDownList" Name="year" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceYear" runat="server" 
                ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
                SelectCommand="SELECT YEAR(serviceDate) AS year FROM Record GROUP BY YEAR(serviceDate) ORDER BY year DESC">
            </asp:SqlDataSource>
        <br />
        </div>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
            CellPadding="2" DataSourceID="consumeRecordSqlDataSource" 
            ForeColor="Black" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="日期" HeaderText="日期" SortExpression="日期" />
                <asp:BoundField DataField="分鐘" HeaderText="分鐘" SortExpression="分鐘" />
                <asp:BoundField DataField="總價" HeaderText="總價" SortExpression="總價" />
                <asp:BoundField DataField="師傅抽成" HeaderText="師傅抽成" SortExpression="師傅抽成" />
                <asp:BoundField DataField="淨利" HeaderText="淨利" 
                    SortExpression="淨利" />
                <asp:BoundField DataField="欠款" HeaderText="欠款" 
                    SortExpression="欠款" />
                <asp:BoundField DataField="現金" HeaderText="現金" 
                    SortExpression="現金" />
                <asp:BoundField DataField="公司收益" HeaderText="公司收益" 
                    SortExpression="公司收益" />
                <asp:BoundField DataField="評價" HeaderText="評價" 
                    SortExpression="評價" />
                <asp:BoundField DataField="櫃台" HeaderText="櫃台" SortExpression="櫃台" />
                <asp:BoundField DataField="服務狀態" HeaderText="服務狀態" SortExpression="服務狀態" />
                <asp:BoundField DataField="服務項目" HeaderText="服務項目" 
                    SortExpression="服務項目" />
                <asp:BoundField DataField="服務師父" HeaderText="服務師父" 
                    SortExpression="服務師父" />
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
        <asp:FormView ID="FormView1" runat="server" BackColor="LightGoldenrodYellow" 
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" 
            DataSourceID="consumeRecordSqlDataSourceTotal" ForeColor="Black" 
            HorizontalAlign="Center">
            <EditItemTemplate>
                日期:
                <asp:TextBox ID="日期TextBox" runat="server" Text='<%# Bind("日期") %>' />
                <br />
                分鐘:
                <asp:TextBox ID="分鐘TextBox" runat="server" Text='<%# Bind("分鐘") %>' />
                <br />
                總價:
                <asp:TextBox ID="總價TextBox" runat="server" Text='<%# Bind("總價") %>' />
                <br />
                師傅抽成:
                <asp:TextBox ID="師傅抽成TextBox" runat="server" Text='<%# Bind("師傅抽成") %>' />
                <br />
                淨利:
                <asp:TextBox ID="淨利TextBox" runat="server" Text='<%# Bind("淨利") %>' />
                <br />
                欠款:
                <asp:TextBox ID="欠款TextBox" runat="server" Text='<%# Bind("欠款") %>' />
                <br />
                現金:
                <asp:TextBox ID="現金TextBox" runat="server" Text='<%# Bind("現金") %>' />
                <br />
                公司收益:
                <asp:TextBox ID="公司收益TextBox" runat="server" Text='<%# Bind("公司收益") %>' />
                <br />
                評價:
                <asp:TextBox ID="評價TextBox" runat="server" Text='<%# Bind("評價") %>' />
                <br />
                櫃台:
                <asp:TextBox ID="櫃台TextBox" runat="server" Text='<%# Bind("櫃台") %>' />
                <br />
                服務狀態:
                <asp:TextBox ID="服務狀態TextBox" runat="server" Text='<%# Bind("服務狀態") %>' />
                <br />
                服務項目:
                <asp:TextBox ID="服務項目TextBox" runat="server" Text='<%# Bind("服務項目") %>' />
                <br />
                服務師父:
                <asp:TextBox ID="服務師父TextBox" runat="server" Text='<%# Bind("服務師父") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <InsertItemTemplate>
                日期:
                <asp:TextBox ID="日期TextBox" runat="server" Text='<%# Bind("日期") %>' />
                <br />
                分鐘:
                <asp:TextBox ID="分鐘TextBox" runat="server" Text='<%# Bind("分鐘") %>' />
                <br />
                總價:
                <asp:TextBox ID="總價TextBox" runat="server" Text='<%# Bind("總價") %>' />
                <br />
                師傅抽成:
                <asp:TextBox ID="師傅抽成TextBox" runat="server" Text='<%# Bind("師傅抽成") %>' />
                <br />
                淨利:
                <asp:TextBox ID="淨利TextBox" runat="server" Text='<%# Bind("淨利") %>' />
                <br />
                欠款:
                <asp:TextBox ID="欠款TextBox" runat="server" Text='<%# Bind("欠款") %>' />
                <br />
                現金:
                <asp:TextBox ID="現金TextBox" runat="server" Text='<%# Bind("現金") %>' />
                <br />
                公司收益:
                <asp:TextBox ID="公司收益TextBox" runat="server" Text='<%# Bind("公司收益") %>' />
                <br />
                評價:
                <asp:TextBox ID="評價TextBox" runat="server" Text='<%# Bind("評價") %>' />
                <br />
                櫃台:
                <asp:TextBox ID="櫃台TextBox" runat="server" Text='<%# Bind("櫃台") %>' />
                <br />
                服務狀態:
                <asp:TextBox ID="服務狀態TextBox" runat="server" Text='<%# Bind("服務狀態") %>' />
                <br />
                服務項目:
                <asp:TextBox ID="服務項目TextBox" runat="server" Text='<%# Bind("服務項目") %>' />
                <br />
                服務師父:
                <asp:TextBox ID="服務師父TextBox" runat="server" Text='<%# Bind("服務師父") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                服務總分鐘:
                <asp:Label ID="分鐘Label" runat="server" Text='<%# Bind("分鐘") %>' />
                <br />
                服務總價:
                <asp:Label ID="總價Label" runat="server" Text='<%# Bind("總價") %>' />
                <br />
                師傅總抽成:
                <asp:Label ID="師傅抽成Label" runat="server" Text='<%# Bind("師傅抽成") %>' />
                <br />
                淨利:
                <asp:Label ID="淨利Label" runat="server" Text='<%# Bind("淨利") %>' />
                <br />
                欠款:
                <asp:Label ID="欠款Label" runat="server" Text='<%# Bind("欠款") %>' />
                <br />
                現金總收入:
                <asp:Label ID="現金Label" runat="server" Text='<%# Bind("現金") %>' />
                <br />
                公司總營收:
                <asp:Label ID="公司收益Label" runat="server" Text='<%# Bind("公司收益") %>' />
                <br />
            </ItemTemplate>
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
        </asp:FormView>
        <br />
        <table align="center">
            <tr>
                <td colspan="2">
                    <strong class="SmallTitle1">該年份的各月份圖表</strong></td>
            </tr>
            <tr>
                <td colspan="2">
        <asp:Chart ID="Chart1" runat="server" 
            DataSourceID="SqlDataSourceAllMonthOfTheYear" Width="800px">
            <Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="公司總營收" 
                    XValueMember="月份" YValueMembers="公司收益" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="現金總收入" 
                    XValueMember="月份" YValueMembers="現金" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="欠款" 
                    XValueMember="月份" YValueMembers="欠款" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="淨利" 
                    XValueMember="月份" YValueMembers="淨利" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="師傅總抽成" 
                    XValueMember="月份" YValueMembers="師傅抽成" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series Legend="Legend1" Name="服務總價" XValueMember="月份" 
                    YValueMembers="總價" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="總服務時數" XValueMember="月份" 
                    YValueMembers="分鐘" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend Name="Legend1">
                </asp:Legend>
            </Legends>
        </asp:Chart>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="firstMonthDropDownList" runat="server" 
                        AutoPostBack="True" DataSourceID="SqlDataSourceMonth" DataTextField="month" 
                        DataValueField="month">
                    </asp:DropDownList>
                    月</td>
                <td>
                    <asp:DropDownList ID="secondMonthDropDownList" runat="server" 
                        AutoPostBack="True" DataSourceID="SqlDataSourceMonth" DataTextField="month" 
                        DataValueField="month">
                    </asp:DropDownList>
                    月</td>
            </tr>
            <tr>
                <td>
        <asp:Chart ID="firstMonthChart" runat="server" 
            DataSourceID="firstMonthSqlDataSource" Width="400px">
            <Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="公司總營收" 
                    XValueMember="月份" YValueMembers="公司收益" IsValueShownAsLabel="True" 
                    Font="Microsoft Sans Serif, 8pt" MarkerBorderWidth="10" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="現金總收入" 
                    XValueMember="月份" YValueMembers="現金" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="欠款" 
                    XValueMember="月份" YValueMembers="欠款" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="淨利" 
                    XValueMember="月份" YValueMembers="淨利" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="師傅總抽成" 
                    XValueMember="月份" YValueMembers="師傅抽成" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series Legend="Legend1" Name="服務總價" XValueMember="月份" 
                    YValueMembers="總價" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="總服務時數" XValueMember="月份" 
                    YValueMembers="時數" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    <Position Height="94" Width="62.9298248" X="3" Y="3" />
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend Name="Legend1" ItemColumnSpacing="100">
                </asp:Legend>
            </Legends>
        </asp:Chart>
        <asp:SqlDataSource ID="firstMonthSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
            
                        SelectCommand="SELECT SUM(Record.serviceMinute) / 60 AS 時數, SUM(Record.servicePrice) AS 總價, SUM(Record.masterCommission) AS 師傅抽成, SUM(Record.profit) AS 淨利, SUM(Record.debt) AS 欠款, SUM(Record.cash) AS 現金, SUM(Record.companyRevenue) AS 公司收益, MONTH(Record.serviceDate) AS 月份 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Master ON Record.mid = Master.mid INNER JOIN Service ON Record.sid = Service.sid GROUP BY MONTH(Record.serviceDate), YEAR(Record.serviceDate) HAVING (YEAR(Record.serviceDate) = @year) AND (MONTH(Record.serviceDate) = @month)">
            <SelectParameters>
                <asp:ControlParameter ControlID="yearDropDownList" Name="year" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="firstMonthDropDownList" Name="month" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
                </td>
                <td>
        <asp:Chart ID="secondMonthChart" runat="server" 
            DataSourceID="secondMonthSqlDataSource" Width="400px">
            <Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="公司總營收" 
                    XValueMember="月份" YValueMembers="公司收益" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="現金總收入" 
                    XValueMember="月份" YValueMembers="現金" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="欠款" 
                    XValueMember="月份" YValueMembers="欠款" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="淨利" 
                    XValueMember="月份" YValueMembers="淨利" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="師傅總抽成" 
                    XValueMember="月份" YValueMembers="師傅抽成" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series Legend="Legend1" Name="服務總價" XValueMember="月份" 
                    YValueMembers="總價" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="總服務時數" XValueMember="月份" 
                    YValueMembers="時數" IsValueShownAsLabel="True" 
                    ToolTip="#VALX #SERIESNAME\n#VAL">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Legends>
                <asp:Legend Name="Legend1">
                </asp:Legend>
            </Legends>
        </asp:Chart>
        <asp:SqlDataSource ID="secondMonthSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
            
                        SelectCommand="SELECT SUM(Record.serviceMinute) / 60 AS 時數, SUM(Record.servicePrice) AS 總價, SUM(Record.masterCommission) AS 師傅抽成, SUM(Record.profit) AS 淨利, SUM(Record.debt) AS 欠款, SUM(Record.cash) AS 現金, SUM(Record.companyRevenue) AS 公司收益, MONTH(Record.serviceDate) AS 月份 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Master ON Record.mid = Master.mid INNER JOIN Service ON Record.sid = Service.sid GROUP BY MONTH(Record.serviceDate), YEAR(Record.serviceDate) HAVING (YEAR(Record.serviceDate) = @year) AND (MONTH(Record.serviceDate) = @month)">
            <SelectParameters>
                <asp:ControlParameter ControlID="yearDropDownList" Name="year" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="firstMonthDropDownList" Name="month" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
        <asp:SqlDataSource ID="SqlDataSourceAllMonthOfTheYear" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
            SelectCommand="SELECT SUM(Record.serviceMinute)/60 AS 分鐘, SUM(Record.servicePrice) AS 總價, SUM(Record.masterCommission) AS 師傅抽成, SUM(Record.profit) AS 淨利, SUM(Record.debt) AS 欠款, SUM(Record.cash) AS 現金, SUM(Record.companyRevenue) AS 公司收益, MONTH(Record.serviceDate) AS 月份 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Master ON Record.mid = Master.mid INNER JOIN Service ON Record.sid = Service.sid GROUP BY MONTH(Record.serviceDate), YEAR(Record.serviceDate) HAVING (YEAR(Record.serviceDate) = @Year)">
            <SelectParameters>
                <asp:ControlParameter ControlID="yearDropDownList" Name="Year" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="consumeRecordSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            SelectCommand="SELECT Record.serviceDate AS 日期, Record.serviceMinute AS 分鐘, Record.servicePrice AS 總價, Record.masterCommission AS 師傅抽成, Record.profit AS 淨利, Record.debt AS 欠款, Record.cash AS 現金, Record.companyRevenue AS 公司收益, Record.opinion AS 評價, Record.recorder AS 櫃台, Record.executionState AS 服務狀態, Service.name AS 服務項目, Master.name AS 服務師父 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Master ON Record.mid = Master.mid INNER JOIN Service ON Record.sid = Service.sid WHERE (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (Record.executionState = N'服務完畢')">
            <SelectParameters>
                <asp:ControlParameter ControlID="yearDropDownList" Name="Year" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="monthDropDownList" Name="Month" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="consumeRecordSqlDataSourceTotal" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            SelectCommand="SELECT SUM(Record.serviceMinute) AS 分鐘, SUM(Record.servicePrice) AS 總價, SUM(Record.masterCommission) AS 師傅抽成, SUM(Record.profit) AS 淨利, SUM(Record.debt) AS 欠款, SUM(Record.cash) AS 現金, SUM(Record.companyRevenue) AS 公司收益, Record.executionState AS 服務狀態 FROM Record INNER JOIN Customer ON Record.cid = Customer.cid INNER JOIN Master ON Record.mid = Master.mid INNER JOIN Service ON Record.sid = Service.sid GROUP BY Record.executionState, YEAR(Record.serviceDate), MONTH(Record.serviceDate) HAVING (YEAR(Record.serviceDate) = @Year) AND (MONTH(Record.serviceDate) = @Month) AND (Record.executionState = N'服務完畢')">
            <SelectParameters>
                <asp:ControlParameter ControlID="yearDropDownList" Name="Year" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="monthDropDownList" Name="Month" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
