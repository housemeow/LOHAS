<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hotServices.aspx.cs" Inherits="_04_Database_admin_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="body">
    
        <span class="title">熱門商品排行榜</span><br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
            CellPadding="2" DataSourceID="serviceSqlDataSource" ForeColor="Black" 
            GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="服務名稱" HeaderText="服務名稱" SortExpression="服務名稱" />
                <asp:BoundField DataField="總金額" HeaderText="總金額" ReadOnly="True" 
                    SortExpression="總金額" />
                <asp:BoundField DataField="消費次數" HeaderText="消費次數" ReadOnly="True" 
                    SortExpression="消費次數" />
                <asp:BoundField DataField="執行狀態" HeaderText="執行狀態" 
                    SortExpression="執行狀態" />
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
        <table class="style1">
            <tr>
                <td>
        <asp:Chart ID="Chart4" runat="server" DataSourceID="serviceSqlDataSource">
            <Series>
                <asp:Series ChartArea="ChartArea1" Name="Series1" XValueMember="服務名稱" 
                    YValueMembers="總金額" IsValueShownAsLabel="True" IsXValueIndexed="True" 
                    ToolTip="#VALX\n#VAL">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    <AxisY Title="總金額收入">
                    </AxisY>
                    <AxisX Title="服務名稱" Enabled="False">
                    </AxisX>
                </asp:ChartArea>
            </ChartAreas>
            <Titles>
                <asp:Title Font="Microsoft Sans Serif, 12pt" Name="Title1" Text="服務項目收入">
                </asp:Title>
            </Titles>
        </asp:Chart>
                </td>
                <td>
        <asp:Chart ID="Chart2" runat="server" DataSourceID="serviceSqlDataSource">
            <Series>
                <asp:Series ChartType="Pie" IsValueShownAsLabel="True" Legend="Legend1" 
                    Name="Series1" XValueMember="服務名稱" YValueMembers="消費次數" 
                    ToolTip="#VALX\n#VAL">
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
            <Titles>
                <asp:Title Font="Microsoft Sans Serif, 12pt" Name="Title1" Text="消費人次">
                </asp:Title>
            </Titles>
        </asp:Chart>
                </td>
            </tr>
            </table>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="serviceSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            SelectCommand="SELECT Service.name AS 服務名稱, SUM(Record.servicePrice) AS 總金額, COUNT(*) AS 消費次數, Record.executionState AS 執行狀態 FROM Service INNER JOIN Record ON Service.sid = Record.sid GROUP BY Service.name, Record.executionState HAVING (Record.executionState = N'服務完畢') ORDER BY 總金額 DESC">
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
