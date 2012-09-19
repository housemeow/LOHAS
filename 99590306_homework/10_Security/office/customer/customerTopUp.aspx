<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customerTopUp.aspx.cs" Inherits="_11_Project_customer_customerTopUp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body class="body">
    <form id="form1" runat="server">
    <div>
    
        <span class="title">客戶加值/還款</span><br />
        <br />
        <asp:RadioButtonList ID="topUpMethodRadioButtonList" runat="server" 
            AutoPostBack="True" 
            onselectedindexchanged="topUpMethodRadioButtonList_SelectedIndexChanged" 
            RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Selected="True">加值</asp:ListItem>
            <asp:ListItem>還款</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:FormView ID="topUpFormView" runat="server" DataKeyNames="cid" 
            DataSourceID="customerSqlDataSource" CellPadding="4" ForeColor="#333333" 
            HorizontalAlign="Center" ondatabound="topUpFormView_DataBound">
            <EditItemTemplate>
                cid:
                <asp:Label ID="cidLabel1" runat="server" Text='<%# Eval("cid") %>' />
                <br />
                name:
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                <br />
                firstTopUp:
                <asp:TextBox ID="firstTopUpTextBox" runat="server" 
                    Text='<%# Bind("firstTopUp") %>' />
                <br />
                debt:
                <asp:TextBox ID="debtTextBox" runat="server" Text='<%# Bind("debt") %>' />
                <br />
                restMoney:
                <asp:TextBox ID="restMoneyTextBox" runat="server" 
                    Text='<%# Bind("restMoney") %>' />
                <br />
                shareFamily:
                <asp:TextBox ID="shareFamilyTextBox" runat="server" 
                    Text='<%# Bind("shareFamily") %>' />
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
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                <br />
                firstTopUp:
                <asp:TextBox ID="firstTopUpTextBox" runat="server" 
                    Text='<%# Bind("firstTopUp") %>' />
                <br />
                debt:
                <asp:TextBox ID="debtTextBox" runat="server" Text='<%# Bind("debt") %>' />
                <br />
                restMoney:
                <asp:TextBox ID="restMoneyTextBox" runat="server" 
                    Text='<%# Bind("restMoney") %>' />
                <br />
                shareFamily:
                <asp:TextBox ID="shareFamilyTextBox" runat="server" 
                    Text='<%# Bind("shareFamily") %>' />
                <br />
                comment:
                <asp:TextBox ID="commentTextBox" runat="server" Text='<%# Bind("comment") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td>
                            會員編號：</td>
                        <td>
                            <asp:Label ID="cidLabel" runat="server" Text='<%# Eval("cid") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            會員名稱：</td>
                        <td>
                            <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            首次加值日：</td>
                        <td>
                            <asp:Label ID="firstTopUpLabel" runat="server" 
                                Text='<%# Bind("firstTopUp") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            欠款：</td>
                        <td>
                            <asp:Label ID="debtLabel" runat="server" Text='<%# Bind("debt") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            剩餘金額：</td>
                        <td>
                            <asp:Label ID="restMoneyLabel" runat="server" Text='<%# Bind("restMoney") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            親友名單：</td>
                        <td>
                            <asp:Label ID="shareFamilyLabel" runat="server" 
                                Text='<%# Bind("shareFamily") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            金額：</td>
                        <td>
                            <asp:DropDownList ID="topUpMoneyDropDownList" runat="server" 
                                AutoPostBack="True" 
                                onselectedindexchanged="topUpMoneyDropDownList_SelectedIndexChanged">
                                <asp:ListItem>5000</asp:ListItem>
                                <asp:ListItem>10000</asp:ListItem>
                                <asp:ListItem>15000</asp:ListItem>
                                <asp:ListItem>20000</asp:ListItem>
                                <asp:ListItem>其他</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:TextBox ID="moneyTextBox" runat="server" AutoPostBack="True" 
                                ontextchanged="moneyTextBox_TextChanged" Visible="False">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            加值/還款後金額：<asp:Label ID="afterMoneyLabel" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            櫃台：</td>
                        <td>
                            <asp:TextBox ID="recorderTextBox" runat="server" AutoPostBack="True" 
                                ontextchanged="moneyTextBox_TextChanged"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="topUpButton" runat="server" Text="確定" 
                    onclick="topUpButton_Click" />
                <br />
            </ItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView>
        <asp:SqlDataSource ID="customerSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            SelectCommand="SELECT [cid], [name], [firstTopUp], [debt], [restMoney], [shareFamily], [comment] FROM [Customer] WHERE ([cid] = @cid)" 
            DeleteCommand="DELETE FROM [Customer] WHERE [cid] = @cid" 
            InsertCommand="INSERT INTO [Customer] ([name], [firstTopUp], [debt], [restMoney], [shareFamily], [comment]) VALUES (@name, @firstTopUp, @debt, @restMoney, @shareFamily, @comment)" 
            
            UpdateCommand="UPDATE Customer SET firstTopUp = @firstTopUp, restMoney = @restMoney WHERE (cid = @cid)">
            <DeleteParameters>
                <asp:Parameter Name="cid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="firstTopUp" Type="Int32" />
                <asp:Parameter Name="debt" Type="Int32" />
                <asp:Parameter Name="restMoney" Type="Int32" />
                <asp:Parameter Name="shareFamily" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="cid" SessionField="cid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="firstTopUp" Type="Int32" />
                <asp:Parameter Name="debt" Type="Int32" />
                <asp:Parameter Name="restMoney" Type="Int32" />
                <asp:Parameter Name="shareFamily" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:SessionParameter Name="cid" SessionField="cid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="recordInsertSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            DeleteCommand="DELETE FROM [Record] WHERE [rid] = @rid" 
            InsertCommand="INSERT INTO Record(cid, serviceDate, servicePrice, cash, recorder, executionState, comment, sid, mid, companyRevenue, debt, profit, masterCommission) VALUES (@cid, @serviceDate, @servicePrice, @cash, @recorder, @executionState, N'現金', @sid, @mid, 0, 0, 0, 0)" 
            SelectCommand="SELECT * FROM [Record]" 
            
            UpdateCommand="UPDATE [Record] SET [cid] = @cid, [serviceDate] = @serviceDate, [serviceMinute] = @serviceMinute, [sid] = @sid, [mid] = @mid, [opinion] = @opinion, [servicePrice] = @servicePrice, [cash] = @cash, [masterCommission] = @masterCommission, [profit] = @profit, [debt] = @debt, [companyRevenue] = @companyRevenue, [recorder] = @recorder, [executionState] = @executionState, [comment] = @comment WHERE [rid] = @rid">
            <DeleteParameters>
                <asp:Parameter Name="rid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="cid" SessionField="cid" />
                <asp:SessionParameter Name="serviceDate" SessionField="serviceDate" />
                <asp:SessionParameter DefaultValue="" Name="servicePrice" 
                    SessionField="servicePrice" />
                <asp:SessionParameter DefaultValue="" Name="cash" SessionField="cash" />
                <asp:SessionParameter Name="recorder" SessionField="recorder" />
                <asp:SessionParameter DefaultValue="" Name="executionState" 
                    SessionField="executionState" />
                <asp:SessionParameter Name="sid" SessionField="sid" />
                <asp:SessionParameter Name="mid" SessionField="mid" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="cid" Type="Int32" />
                <asp:Parameter Name="serviceDate" Type="DateTime" />
                <asp:Parameter Name="serviceMinute" Type="Int32" />
                <asp:Parameter Name="sid" Type="Int32" />
                <asp:Parameter Name="mid" Type="Int32" />
                <asp:Parameter Name="opinion" Type="String" />
                <asp:Parameter Name="servicePrice" Type="Int32" />
                <asp:Parameter Name="cash" Type="Int32" />
                <asp:Parameter Name="masterCommission" Type="Int32" />
                <asp:Parameter Name="profit" Type="Int32" />
                <asp:Parameter Name="debt" Type="Int32" />
                <asp:Parameter Name="companyRevenue" Type="Int32" />
                <asp:Parameter Name="recorder" Type="String" />
                <asp:Parameter Name="executionState" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Name="rid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <span class="body">
        <br />
        <asp:Button ID="createButton" runat="server" 
            PostBackUrl="~/10_Security/office/customer/customerCreate.aspx" Text="新增客戶" />
&nbsp;<asp:Button ID="selectButton" runat="server" 
            Text="選擇其他會員" 
            PostBackUrl="~/10_Security/office/customer/customerSelect.aspx" />
&nbsp;<asp:Button ID="viewButton" runat="server" 
            PostBackUrl="~/10_Security/office/customer/customerView.aspx" 
            Text="檢視會員" />
        &nbsp;<asp:Button ID="topUpButton" runat="server" 
            Text="修改會員資料" 
            PostBackUrl="~/10_Security/office/customer/customerModify.aspx" />
&nbsp;<asp:Button ID="consumeRecordButton" runat="server" Text="消費紀錄" 
            PostBackUrl="~/10_Security/office/customer/customerConsumeRecord.aspx" />
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
