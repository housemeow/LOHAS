<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cellphonelist.aspx.cs" Inherits="_10_Security_cellphonelist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>簡訊發送列表</title>
    </head>
<body>
    <form id="form1" runat="server" method="get">
    <div>  
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
            <asp:ListItem Selected="True" Value="全部會員">全部會員</asp:ListItem>
            <asp:ListItem Value="VIP會員">VIP會員</asp:ListItem>
            <asp:ListItem Value="非VIP會員">非VIP會員</asp:ListItem>
            <asp:ListItem Value="當月壽星">當月壽星</asp:ListItem>
            <asp:ListItem>下月壽星</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:TextBox ID="cellphoneTextBox" runat="server" AutoPostBack="True" 
            Height="339px" TextMode="MultiLine" Width="218px"></asp:TextBox>
        <asp:SqlDataSource ID="SqlDataSourcePhone" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            SelectCommand="SELECT cellphone, birthday FROM Customer WHERE (cellphone IS NOT NULL) AND ( @select = 'VIP會員') AND (firstTopUp IS NOT NULL) OR (cellphone IS NOT NULL) AND ( @select = '非VIP會員') AND (firstTopUp IS NULL) OR (cellphone IS NOT NULL) AND ( @select = '全部會員') OR (cellphone IS NOT NULL) AND ( @select = '當月壽星') AND (MONTH(GETDATE()) = MONTH(birthday)) OR (cellphone IS NOT NULL) AND ( @select = '下月會員') AND (DATEADD(month, 1, GETDATE()) = MONTH(birthday))">
            <SelectParameters>
                <asp:ControlParameter ControlID="RadioButtonList1" Name="select" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
