<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customerReservationAppointment.aspx.cs" Inherits="_11_Project_customer_customerConsume" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        </style>
</head>
<body class="body">
    <form id="form1" runat="server">
    <div>
    
        <span class="title">預約清單<br />
        <br />
        </span>
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
                <asp:TemplateField HeaderText="剩餘儲值金額" SortExpression="restMoney">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("restMoney") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("restMoney") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="restMoneyLabel" runat="server" Text='<%# Bind("restMoney") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="欠款" SortExpression="debt">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("debt") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("debt") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="debtLabel" runat="server" Text='<%# Bind("debt") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="shareFamily" HeaderText="共享親友名單" 
                    SortExpression="shareFamily" />
                <asp:BoundField DataField="health" HeaderText="健康狀況" SortExpression="health" />
                <asp:BoundField DataField="birthday" DataFormatString="{0:d}" HeaderText="生日" 
                    SortExpression="birthday" />
                <asp:BoundField DataField="comment" HeaderText="備註" SortExpression="comment" />
                <asp:BoundField DataField="firstTopUp" HeaderText="首次加值日" 
                    SortExpression="firstTopUp" />
                <asp:TemplateField HeaderText="首次消費日" SortExpression="firstConsumeDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" 
                            Text='<%# Bind("firstConsumeDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" 
                            Text='<%# Bind("firstConsumeDate") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="firstConsumeDateLabel" runat="server" 
                            Text='<%# Bind("firstConsumeDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="customerSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            SelectCommand="SELECT name, shareFamily, restMoney, comment, specifiedMaster, acceptableMaster, refuceMaster, health, birthday, debt, firstTopUp, firstConsumeDate FROM Customer WHERE (cid = @cid)" 
            
            
            
            
            UpdateCommand="UPDATE Customer SET firstConsumeDate = @firstConsumeDate, restMoney = @restMoney, debt = @debt WHERE (cid = @cid)">
            <SelectParameters>
                <asp:SessionParameter Name="cid" SessionField="cid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="firstConsumeDate" SessionField="firstConsumeDate" />
                <asp:SessionParameter Name="restMoney" SessionField="restMoney" />
                <asp:SessionParameter Name="debt" SessionField="debt" />
                <asp:SessionParameter Name="cid" SessionField="cid" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="nullLabel" runat="server" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
        <br />
        <asp:GridView ID="reservationGridView" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
            BorderWidth="1px" CellPadding="2" DataKeyNames="消費序號" 
            DataSourceID="reservationSqlDataSource" ForeColor="Black" GridLines="None" 
            HorizontalAlign="Center" 
            onselectedindexchanged="reservationGridView_SelectedIndexChanged" 
            ondatabound="reservationGridView_DataBound">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="消費序號" HeaderText="消費序號" 
                    SortExpression="消費序號" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="服務時間" HeaderText="服務時間" 
                    SortExpression="服務時間" />
                <asp:BoundField DataField="時間長度" HeaderText="時間長度" 
                    SortExpression="時間長度" />
                <asp:BoundField DataField="服務編號" HeaderText="服務編號" SortExpression="服務編號" />
                <asp:BoundField DataField="師父編號" HeaderText="師父編號" SortExpression="師父編號" />
                <asp:CommandField SelectText="選取" ShowSelectButton="True" />
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
        <asp:SqlDataSource ID="reservationSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            
            SelectCommand="SELECT executionState AS 執行狀態, rid AS 消費序號, serviceDate AS 服務時間, serviceMinute AS 時間長度, cid AS 客戶編號, sid AS 服務編號, mid AS 師父編號 FROM Record WHERE (executionState = @executionState) AND (cid = @cid)">
            <SelectParameters>
                <asp:Parameter DefaultValue="預約中" Name="executionState" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="cid" SessionField="cid" />
            </SelectParameters>
        </asp:SqlDataSource>
&nbsp;&nbsp;<br />
        選擇服務：<asp:DropDownList 
            ID="serviceDropDownList" runat="server" AutoPostBack="True" 
            DataSourceID="serviceListSqlDataSource" DataTextField="name" 
            DataValueField="sid">
        </asp:DropDownList>
        <asp:SqlDataSource ID="serviceListSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            SelectCommand="SELECT [name], [sid] FROM [Service] WHERE (([name] &lt;&gt; @name) AND ([name] &lt;&gt; @name2))">
            <SelectParameters>
                <asp:Parameter DefaultValue="加值" Name="name" Type="String" />
                <asp:Parameter DefaultValue="還款" Name="name2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
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
            SelectCommand="SELECT * FROM [Service] WHERE ([sid] = @sid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="serviceDropDownList" Name="sid" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="isVipLabel" runat="server" style="font-weight: 700"></asp:Label>
        <br />
        選擇師父：<asp:DropDownList 
            ID="masterDropDownList" runat="server" DataSourceID="masterListSqlDataSource" 
            DataTextField="name" DataValueField="mid">
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="masterListSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            SelectCommand="SELECT [mid], [name] FROM [Master] WHERE (([name] &lt;&gt; @name) AND ([name] &lt;&gt; @name2))">
            <SelectParameters>
                <asp:Parameter DefaultValue="加值" Name="name" Type="String" />
                <asp:Parameter DefaultValue="還款" Name="name2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        選擇時間：<asp:DropDownList ID="serviceMinuteDropDownList" runat="server" 
            AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <table align="center">
            <tr>
                <td class="tableHead">
                    價格單位時間：</td>
                <td>
                    <asp:RadioButtonList ID="unitRadioButtonList" runat="server" 
                        AutoPostBack="True" 
                        onselectedindexchanged="unitRadioButtonList_SelectedIndexChanged" 
                        RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True">1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="tableHead">
                    收費價格 ： <br />
                </td>
                <td>
                    <br />
                    <asp:TextBox ID="servicePriceTextBox" runat="server" AutoPostBack="True" 
                        ontextchanged="servicePriceTextBox_TextChanged">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableHead">
                    師父抽成：</td>
                <td>
                    <asp:TextBox ID="masterCommissionTextBox" runat="server" 
                        ontextchanged="masterCommisionTextBox_TextChanged" AutoPostBack="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableHead">
                    淨利：</td>
                <td>
                    <asp:TextBox ID="profitTextBox" runat="server" Width="128px" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableHead">
                    欠款：</td>
                <td>
                    <asp:TextBox ID="debtTextBox" runat="server" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableHead">
                    現金收入：</td>
                <td>
                    <asp:TextBox ID="cashTextBox" runat="server" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableHead">
                    公司營收：</td>
                <td>
                    <asp:TextBox ID="companyRevenueTextBox" runat="server" ReadOnly="True">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableHead">
                    櫃台： 
                </td>
                <td>
                    <asp:TextBox ID="recorderTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tableHead">
                    消費方式：</td>
                <td>
                    <asp:RadioButtonList ID="consumeMethodRadioButtonList" runat="server" 
                        RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow" 
                        AutoPostBack="True" 
                        onselectedindexchanged="consumeMethodRadioButtonList_SelectedIndexChanged">
                        <asp:ListItem Selected="True">現金</asp:ListItem>
                        <asp:ListItem>儲值金扣款</asp:ListItem>
                        <asp:ListItem>票券</asp:ListItem>
                        <asp:ListItem>欠款</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
        <asp:Button ID="consumeButton" runat="server" onclick="consumeButton_Click" 
            Text="赴約" style="height: 26px; text-align: center;" />
                &nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="cancelButton" runat="server" onclick="cancelButton_Click" 
                        Text="取消此次預約" />
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="updateRecordSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            DeleteCommand="DELETE FROM [Record] WHERE [rid] = @rid" 
            InsertCommand="INSERT INTO Record(sid, cid, mid, serviceDate, serviceMinute, servicePrice, masterCommission, profit, debt, cash, companyRevenue, recorder, executionState, comment, opinion) VALUES (@sid, @cid, @mid, @serviceDate, @serviceMinute, @servicePrice, @masterCommission, @profit, @debt, @cash, @companyRevenue, @recorder, @executionState, @comment, N'尚未評價')" 
            SelectCommand="SELECT * FROM [Record]" 
            
            
            
            UpdateCommand="UPDATE Record SET sid = @sid, cid = @cid, mid = @mid, serviceDate = GETDATE(), serviceMinute = @serviceMinute, servicePrice = @servicePrice, masterCommission = @masterCommission, profit = @profit, debt = @debt, cash = @cash, companyRevenue = @companyRevenue, recorder = @recorder, executionState = @executionState WHERE (rid = @rid)">
            <DeleteParameters>
                <asp:Parameter Name="rid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="serviceDropDownList" DefaultValue="" 
                    Name="sid" PropertyName="SelectedValue" Type="Int32" />
                <asp:SessionParameter Name="cid" SessionField="cid" Type="Int32" />
                <asp:ControlParameter ControlID="masterDropDownList" DefaultValue="" 
                    Name="mid" PropertyName="SelectedValue" Type="Int32" />
                <asp:SessionParameter DefaultValue="" Name="serviceDate" 
                    SessionField="serviceDate" Type="DateTime" />
                <asp:ControlParameter ControlID="serviceMinuteDropDownList" DefaultValue="" 
                    Name="serviceMinute" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="servicePriceTextBox" DefaultValue="0" 
                    Name="servicePrice" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="masterCommissionTextBox" DefaultValue="0" 
                    Name="masterCommission" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="profitTextBox" DefaultValue="0" Name="profit" 
                    PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="debtTextBox" DefaultValue="0" Name="debt" 
                    PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="cashTextBox" DefaultValue="0" Name="cash" 
                    PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="companyRevenueTextBox" DefaultValue="0" 
                    Name="companyRevenue" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="recorderTextBox" DefaultValue="" 
                    Name="recorder" PropertyName="Text" Type="String" />
                <asp:Parameter DefaultValue="服務中" Name="executionState" Type="String" />
                <asp:ControlParameter ControlID="consumeMethodRadioButtonList" Name="comment" 
                    PropertyName="SelectedValue" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="serviceDropDownList" Name="sid" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:SessionParameter Name="cid" SessionField="cid" Type="Int32" />
                <asp:ControlParameter ControlID="masterDropDownList" Name="mid" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="serviceMinuteDropDownList" DefaultValue="" 
                    Name="serviceMinute" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="servicePriceTextBox" Name="servicePrice" 
                    PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="masterCommissionTextBox" 
                    Name="masterCommission" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="profitTextBox" Name="profit" 
                    PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="debtTextBox" Name="debt" PropertyName="Text" 
                    Type="Int32" />
                <asp:ControlParameter ControlID="cashTextBox" Name="cash" PropertyName="Text" 
                    Type="Int32" />
                <asp:ControlParameter ControlID="companyRevenueTextBox" Name="companyRevenue" 
                    PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="recorderTextBox" Name="recorder" 
                    PropertyName="Text" Type="String" />
                <asp:SessionParameter Name="executionState" SessionField="executionState" 
                    Type="String" />
                <asp:ControlParameter ControlID="reservationGridView" Name="rid" 
                    PropertyName="SelectedValue" />
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
            PostBackUrl="~/10_Security/office/customer/customerReservation.aspx" 
            Text="預約" />
&nbsp;<asp:Button ID="consumeButton0" runat="server" 
            Text="消費" 
            
            PostBackUrl="~/10_Security/office/customer/customerConsume.aspx" />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
