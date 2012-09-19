<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customerSelect.aspx.cs" Inherits="_11_Project_customer_customerSelect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="body">
    <div class="body">
    
        <span class="title">客戶功能表<br />
        </span>
        <br />
        <br />
        第一步.請選擇一位客戶<br />
        <br />
        篩選條件<table class="style1" align="center">
            <tr>
                <td class="tableHead">
                    <asp:CheckBox ID="cidCheckBox" runat="server" AutoPostBack="True" 
                        oncheckedchanged="cidCheckBox_CheckedChanged" Text="序號：" />
                </td>
                <td class="tableContent">
                    <asp:TextBox ID="cidTextBox" runat="server" AutoPostBack="True" 
                        ontextchanged="cidTextBox_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableHead">
                    <asp:CheckBox ID="nameCheckBox" runat="server" AutoPostBack="True" 
                        oncheckedchanged="nameCheckBox_CheckedChanged" Text="姓名：" 
                        CssClass="body" />
                </td>
                <td class="tableContent">
                    <asp:TextBox ID="nameTextBox" runat="server" AutoPostBack="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableHead">
                    <asp:CheckBox ID="genderCheckBox" runat="server" AutoPostBack="True" 
                        oncheckedchanged="genderCheckBox_CheckedChanged" Text="性別：" />
                </td>
                <td class="tableContent">
                    <asp:RadioButtonList ID="genderRadioButtonList" runat="server" 
                        AutoPostBack="True" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">男生</asp:ListItem>
                        <asp:ListItem>女生</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="tableHead">
                    <asp:CheckBox ID="birthdayCheckBox" runat="server" AutoPostBack="True" 
                        oncheckedchanged="birthdayCheckBox_CheckedChanged" Text="生日：" />
                </td>
                <td class="tableContent">
                    <asp:DropDownList ID="monthDropDownList" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="monthDropDownList_SelectedIndexChanged">
                    </asp:DropDownList>
                    月　<asp:DropDownList ID="dayDropDownList" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="dayDropDownList_SelectedIndexChanged">
                    </asp:DropDownList>
                    日</td>
            </tr>
            <tr>
                <td class="tableHead">
                    <asp:CheckBox ID="phoneCheckBox" runat="server" AutoPostBack="True" 
                        oncheckedchanged="phoneCheckBox_CheckedChanged" Text="家電：" />
                </td>
                <td class="tableContent">
                    <asp:TextBox ID="phoneTextBox" runat="server" AutoPostBack="True" Width="190px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableHead">
                    <asp:CheckBox ID="cellphoneCheckBox" runat="server" AutoPostBack="True" 
                        oncheckedchanged="cellphoneCheckBox_CheckedChanged" Text="手機：" />
                </td>
                <td class="tableContent">
                    <asp:TextBox ID="cellphoneTextBox" runat="server" AutoPostBack="True" 
                        Width="190px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableHead">
                    <asp:CheckBox ID="commentCheckBox" runat="server" AutoPostBack="True" 
                        oncheckedchanged="commentCheckBox_CheckedChanged" Text="備註：" />
                </td>
                <td class="tableContent">
                    <asp:TextBox ID="commentTextBox" runat="server" AutoPostBack="True" 
                        Width="190px" ontextchanged="commentTextBox_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableHead" colspan="2">
                    <asp:GridView ID="customerGridView" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                        BorderWidth="1px" CellPadding="2" DataKeyNames="cid" 
                        DataSourceID="customerSqlDataSource" ForeColor="Black" GridLines="None" 
                        HorizontalAlign="Center" 
                        style="margin-bottom: 0px; text-align: center;" AllowPaging="True">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="cid" HeaderText="序號" InsertVisible="False" 
                                ReadOnly="True" SortExpression="cid" />
                            <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                            <asp:BoundField DataField="cellphone" HeaderText="手機" 
                                SortExpression="cellphone" />
                            <asp:BoundField DataField="phone" HeaderText="家電" SortExpression="phone" />
                            <asp:BoundField DataField="birthday" HeaderText="生日" 
                                SortExpression="birthday" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="firstTopUp" HeaderText="首次加值日" 
                                SortExpression="firstTopUp" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="comment" 
                                HeaderText="備註" SortExpression="comment" />
                            <asp:CommandField SelectText="選擇" ShowSelectButton="True" />
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
        </table>
        <br />
        <br />
        第二步.選擇功能<br />
<br />
        <asp:Button ID="createButton" runat="server" 
            PostBackUrl="~/10_Security/office/customer/customerCreate.aspx" Text="新增客戶" />
&nbsp;<asp:Button ID="viewButton" runat="server" onclick="viewButton_Click" 
            Text="檢視會員資料" />
&nbsp;<asp:Button ID="modifyButton" runat="server" onclick="modifyButton_Click" 
            Text="修改會員資料" />
&nbsp;<asp:Button ID="consumeRecordButton" runat="server" 
            onclick="consumeRecordButton_Click" Text="消費紀錄" />
&nbsp;<asp:Button ID="topUpButton" runat="server" onclick="topUpButton_Click" 
            Text="會員加值/還款" />
&nbsp;<asp:Button ID="reservationButton" runat="server" 
            onclick="reservationButton_Click" Text="預約" />
&nbsp;<asp:Button ID="reservationAppointmentButton" runat="server" 
            Text="赴約" onclick="reservationAppointmentButton_Click" />
&nbsp;<asp:Button ID="consumeButton" runat="server" onclick="consumeButton_Click" 
            Text="消費" Width="40px" />
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="customerSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            
            SelectCommand="SELECT cid, name, cellphone, phone, birthday, firstTopUp, comment FROM Customer">
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
