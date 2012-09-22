<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hotCustomerMaster.aspx.cs" Inherits="_10_Security_office_hotCustomer" %>

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
        .style2
        {
            height: 310px;
        }
        .style3
        {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="style3">
        <span class="title">
         <br />
        客戶與師父分析報表<br/>
        </span>
       
        </div>
       
        <table class="style1">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                        BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSourcehotCustomer" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="Center" 
                        AllowSorting="True">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="客戶" HeaderText="客戶" SortExpression="客戶" />
                            <asp:BoundField DataField="消費總額" HeaderText="消費總額" ReadOnly="True" 
                                SortExpression="消費總額" />
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
                </td>
                <td>
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                        BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSourcehotDebt" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="Center" 
                        AllowSorting="True">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="客戶" HeaderText="客戶" SortExpression="客戶" />
                            <asp:BoundField DataField="欠款" HeaderText="欠款" 
                                SortExpression="欠款" />
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
                </td>
            </tr>
            <tr>
                <td>
                    <table align="center">
                        <tr>
                            <td>
                                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourcehotCustomer" 
                                    style="text-align: center">
                                    <Series>
                                        <asp:Series Name="Series1" XValueMember="客戶" YValueMembers="消費總額" 
                                            ToolTip="#VALX\n#VAL">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <AxisX Enabled="False">
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table align="center">
                        <tr>
                            <td>
                                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSourcehotDebt">
                                    <Series>
                                        <asp:Series Name="Series1" XValueMember="客戶" YValueMembers="欠款" 
                                            ToolTip="#VALX\n#VAL">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <AxisX Enabled="False">
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table class="style1">
            <tr>
                <td>
                    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                        BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSourcehotMasterprice" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="Center" 
                        AllowSorting="True">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="師父" HeaderText="師父" SortExpression="師父" />
                            <asp:BoundField DataField="總抽成" HeaderText="總抽成" ReadOnly="True" 
                                SortExpression="總抽成" />
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
                </td>
                <td>
                    <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                        BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSourcehotMasterCount" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="Center" 
                        AllowSorting="True">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="師父" HeaderText="師父" SortExpression="師父" />
                            <asp:BoundField DataField="服務次數" HeaderText="服務次數" ReadOnly="True" 
                                SortExpression="服務次數" />
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
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <table align="center">
                        <tr>
                            <td>
                                <asp:Chart ID="Chart3" runat="server" 
                                    DataSourceID="SqlDataSourcehotMasterprice">
                                    <Series>
                                        <asp:Series Name="Series1" XValueMember="師父" YValueMembers="總抽成" 
                                            ToolTip="#VALX\n#VAL">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <AxisX Enabled="False">
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="style2">
                    <table align="center">
                        <tr>
                            <td>
                                <asp:Chart ID="Chart4" runat="server" 
                                    DataSourceID="SqlDataSourcehotMasterCount">
                                    <Series>
                                        <asp:Series Name="Series1" XValueMember="師父" YValueMembers="服務次數" 
                                            ToolTip="#VALX \n#VAL">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <AxisX Enabled="False">
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table class="style1">
            <tr>
                <td>
                    <asp:GridView ID="GridView5" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                        BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSourceMasterTime" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="Center" 
                        AllowSorting="True">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="師父" HeaderText="師父" SortExpression="師父" />
                            <asp:BoundField DataField="總時數" HeaderText="總服務時數" ReadOnly="True" 
                                SortExpression="總時數" />
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
                </td>
                <td>
                    <asp:GridView ID="GridView6" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                        BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSourceCutermerTime" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="Center" 
                        AllowSorting="True">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="客戶" HeaderText="客戶" SortExpression="客戶" />
                            <asp:BoundField DataField="總服務時數" HeaderText="總服務時數" ReadOnly="True" 
                                SortExpression="總服務時數" />
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
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <table align="center">
                        <tr>
                            <td>
                                <asp:Chart ID="Chart5" runat="server" 
                                    DataSourceID="SqlDataSourceMasterTime">
                                    <Series>
                                        <asp:Series Name="Series1" XValueMember="師父" YValueMembers="總時數" 
                                            ToolTip="#VALX\n#VAL">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <AxisX Enabled="False">
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="style2">
                    <table align="center">
                        <tr>
                            <td>
                                <asp:Chart ID="Chart6" runat="server" 
                                    DataSourceID="SqlDataSourceCutermerTime">
                                    <Series>
                                        <asp:Series Name="Series1" XValueMember="客戶" YValueMembers="總服務時數" 
                                            ToolTip="#VALX\n#VAL">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <AxisX Enabled="False">
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSourceMasterTime" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            SelectCommand="SELECT Master.name AS 師父, SUM(Record.serviceMinute)/60 AS 總時數 FROM Master INNER JOIN Record ON Master.mid = Record.mid GROUP BY Master.name, Record.executionState HAVING (Record.executionState = N'服務完畢') ORDER BY 總時數 DESC">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCutermerTime" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            SelectCommand="SELECT Customer.name AS 客戶, SUM(Record.serviceMinute)/60 AS 總服務時數 FROM Customer INNER JOIN Record ON Customer.cid = Record.cid GROUP BY Customer.name, Record.executionState HAVING (Record.executionState = N'服務完畢') ORDER BY 總服務時數 DESC">
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSourcehotMasterprice" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            SelectCommand="SELECT Master.name AS 師父, SUM(Record.masterCommission) AS 總抽成 FROM Master INNER JOIN Record ON Master.mid = Record.mid GROUP BY Master.mid, Master.name, Record.executionState HAVING (Record.executionState = N'服務完畢') ORDER BY SUM(Record.masterCommission) DESC">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcehotMasterCount" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            SelectCommand="SELECT Master.name AS 師父, COUNT(Record.mid) AS 服務次數 FROM Master INNER JOIN Record ON Master.mid = Record.mid GROUP BY Master.name, Record.executionState HAVING (Record.executionState = N'服務完畢') ORDER BY 服務次數 DESC">
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSourcehotCustomer" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            SelectCommand="SELECT Customer.name AS 客戶, SUM(Record.servicePrice) AS 消費總額 FROM Customer INNER JOIN Record ON Customer.cid = Record.cid GROUP BY Customer.cid, Customer.name, Record.executionState HAVING (Record.executionState = N'服務完畢') ORDER BY 消費總額 DESC">
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSourcehotDebt" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            SelectCommand="SELECT name AS 客戶, debt AS 欠款 FROM Customer WHERE (debt IS NOT NULL) ORDER BY 欠款 DESC">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
