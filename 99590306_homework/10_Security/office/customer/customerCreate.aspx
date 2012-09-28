<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customerCreate.aspx.cs" Inherits="_10_Security_office_customer_customerCreate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body class="body">
    <form id="form1" runat="server">
    <div>
    
        <span class="title">新增客戶<br />
        </span>
        <br />
        <br />
        <asp:DetailsView ID="customerDetailsView" runat="server" 
            AutoGenerateRows="False" CellPadding="4" DataKeyNames="cid" 
            DataSourceID="customerSqlDataSource" DefaultMode="Insert" ForeColor="#333333" 
            GridLines="None" Height="50px" HorizontalAlign="Center" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="cid" HeaderText="cid" InsertVisible="False" 
                    ReadOnly="True" SortExpression="cid" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                <asp:BoundField DataField="cellphone" HeaderText="手機" 
                    SortExpression="cellphone" />
                <asp:BoundField DataField="phone" HeaderText="家電" SortExpression="phone" />
                <asp:TemplateField HeaderText="性別" SortExpression="gender">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("gender") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="genderRadioButtonList" runat="server" 
                            RepeatDirection="Horizontal" RepeatLayout="Flow" 
                            SelectedValue='<%# Bind("gender") %>'>
                            <asp:ListItem Selected="True">男生</asp:ListItem>
                            <asp:ListItem>女生</asp:ListItem>
                        </asp:RadioButtonList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="生日" SortExpression="birthday">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("birthday") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <span class="body">
                        <asp:Label ID="birthdayLabel" runat="server"></asp:Label>
                        </span>
                        <br />
                        年份：<asp:DropDownList ID="yearDropDownList" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="yearDropDownList_SelectedIndexChanged">
                        </asp:DropDownList>
                        　月份：<asp:DropDownList ID="monthDropDownList" runat="server" AutoPostBack="True" 
                            onselectedindexchanged="monthDropDownList_SelectedIndexChanged">
                        </asp:DropDownList>
                        <br />
                        <asp:Calendar ID="birthdayCalendar" runat="server" BackColor="White" 
                            BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                            ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" 
                            SelectedDate='<%# Bind("birthday") %>' Width="350px" 
                            onselectionchanged="birthdayCalendar_SelectionChanged">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                                VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                                Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                            <TodayDayStyle BackColor="#CCCCCC" />
                        </asp:Calendar>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("birthday") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="健康狀況" SortExpression="health">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("health") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="healthTextBox" runat="server" Height="146px" ReadOnly="True" 
                            Rows="30" Text='<%# Bind("health") %>' Width="343px"></asp:TextBox>
                        <br />
                        請選擇項目：<asp:DropDownList ID="healthDropDownList" runat="server" 
                            AutoPostBack="True" 
                            onselectedindexchanged="healthDropDownList_SelectedIndexChanged">
                            <asp:ListItem>曾手術或開刀</asp:ListItem>
                            <asp:ListItem>高血壓</asp:ListItem>
                            <asp:ListItem>糖尿病</asp:ListItem>
                            <asp:ListItem>心臟病</asp:ListItem>
                            <asp:ListItem>貧血</asp:ListItem>
                            <asp:ListItem>空間狹迫症</asp:ListItem>
                            <asp:ListItem>暈眩症</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:TextBox ID="detailHealthTextBox" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="healthButton" runat="server" onclick="healthButton_Click" 
                            Text="新增健康狀況" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("health") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="address" HeaderText="地址" SortExpression="address" />
                <asp:BoundField DataField="comment" HeaderText="備註" SortExpression="comment" />
                <asp:TemplateField ShowHeader="False">
                    <InsertItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="新增" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" onclick="Button2_Click" Text="取消" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                            CommandName="New" Text="新增" />
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
            DeleteCommand="DELETE FROM [Customer] WHERE [cid] = @cid" 
            InsertCommand="INSERT INTO [Customer] ([firstConsumeDate], [name], [cellphone], [phone], [specifiedMaster], [acceptableMaster], [refuceMaster], [gender], [birthday], [firstTopUp], [restMoney], [shareFamily], [debt], [tabu], [health], [address], [comment]) VALUES (@firstConsumeDate, @name, @cellphone, @phone, @specifiedMaster, @acceptableMaster, @refuceMaster, @gender, @birthday, @firstTopUp, @restMoney, @shareFamily, @debt, @tabu, @health, @address, @comment);SELECT @PK_New = @@IDENTITY" 
            SelectCommand="SELECT * FROM [Customer]" 
            
            UpdateCommand="UPDATE [Customer] SET [firstConsumeDate] = @firstConsumeDate, [name] = @name, [cellphone] = @cellphone, [phone] = @phone, [specifiedMaster] = @specifiedMaster, [acceptableMaster] = @acceptableMaster, [refuceMaster] = @refuceMaster, [gender] = @gender, [birthday] = @birthday, [firstTopUp] = @firstTopUp, [restMoney] = @restMoney, [shareFamily] = @shareFamily, [debt] = @debt, [tabu] = @tabu, [health] = @health, [address] = @address, [comment] = @comment WHERE [cid] = @cid" 
            oninserted="customerSqlDataSource_Inserted" 
            oninserting="customerSqlDataSource_Inserting">
            <DeleteParameters>
                <asp:Parameter Name="cid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="firstConsumeDate" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="cellphone" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="specifiedMaster" Type="String" />
                <asp:Parameter Name="acceptableMaster" Type="String" />
                <asp:Parameter Name="refuceMaster" Type="String" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter DbType="Date" Name="birthday" />
                <asp:Parameter Name="firstTopUp" Type="DateTime" />
                <asp:Parameter Name="restMoney" Type="Int32" />
                <asp:Parameter Name="shareFamily" Type="String" />
                <asp:Parameter Name="debt" Type="Int32" />
                <asp:Parameter Name="tabu" Type="String" />
                <asp:Parameter Name="health" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Direction="Output" Name="PK_New" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="firstConsumeDate" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="cellphone" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="specifiedMaster" Type="String" />
                <asp:Parameter Name="acceptableMaster" Type="String" />
                <asp:Parameter Name="refuceMaster" Type="String" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter DbType="Date" Name="birthday" />
                <asp:Parameter Name="firstTopUp" Type="DateTime" />
                <asp:Parameter Name="restMoney" Type="Int32" />
                <asp:Parameter Name="shareFamily" Type="String" />
                <asp:Parameter Name="debt" Type="Int32" />
                <asp:Parameter Name="tabu" Type="String" />
                <asp:Parameter Name="health" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="comment" Type="String" />
                <asp:Parameter Name="cid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <asp:Button ID="selectButton" runat="server" 
            PostBackUrl="~/10_Security/office/customer/customerSelect.aspx" Text="選擇其他客戶" />
    
    </div>
    </form>
</body>
</html>
