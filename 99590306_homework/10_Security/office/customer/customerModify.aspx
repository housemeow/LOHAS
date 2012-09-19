<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customerModify.aspx.cs" Inherits="_11_Project_customer_customerModify" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Styles/tripStyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body class="body">
    <form id="form1" runat="server">
    <div>
    
        <span class="title">修改客戶資料<br />
        </span>
    
        <span class="body">
        <br />
        <br />
        <asp:DetailsView ID="customerDetailsView" runat="server" 
            AutoGenerateRows="False" CellPadding="4" DataKeyNames="cid" 
            DataSourceID="customerSqlDataSource" DefaultMode="Edit" ForeColor="#333333" 
            GridLines="None" HorizontalAlign="Center" 
            style="margin-top: 0px" 
            ondatabound="customerDetailsView_DataBound" 
            onitemupdated="customerDetailsView_ItemUpdated">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="cid" HeaderText="序號" InsertVisible="False" 
                    ReadOnly="True" SortExpression="cid" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                <asp:TemplateField HeaderText="手機" SortExpression="cellphone">
                    <EditItemTemplate>
                        <asp:TextBox ID="cellphoneTextBox" runat="server" 
                            Height="40px" Text='<%# Bind("cellphone") %>' Width="180px"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("cellphone") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("cellphone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="家電" SortExpression="phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="phoneTextBox" runat="server" Height="40px" 
                            Text='<%# Bind("phone") %>' Width="180px"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="指定師父" SortExpression="specifiedMaster">
                    <EditItemTemplate>
                        <asp:TextBox ID="specifiedMasterTextBox" runat="server" Height="40px" 
                            Text='<%# Bind("specifiedMaster") %>' Width="180px"></asp:TextBox>
                        <br />
                        &nbsp;<asp:DropDownList ID="specifiedMasterDropDownList" runat="server" 
                            AutoPostBack="True" DataSourceID="masterSqlDataSource" DataTextField="name" 
                            DataValueField="name">
                        </asp:DropDownList>
                        &nbsp;<asp:Button ID="specifiedMasterButton" runat="server" 
                            onclick="specifiedMasterButton_Click" Text="加入" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("specifiedMaster") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("specifiedMaster") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="可接受師父" SortExpression="acceptableMaster">
                    <EditItemTemplate>
                        <span class="body">
                        <asp:TextBox ID="acceptableMasterTextBox" runat="server" Height="40px" 
                            Text='<%# Bind("acceptableMaster") %>' Width="180px"></asp:TextBox>
                        <br />
                        <asp:DropDownList ID="acceptableMasterDropDownList" runat="server" 
                            AutoPostBack="True" DataSourceID="masterSqlDataSource" DataTextField="name" 
                            DataValueField="name">
                        </asp:DropDownList>
                        <asp:Button ID="acceptableMasterButton" runat="server" 
                            onclick="acceptableMasterButton_Click" Text="加入" />
                        </span>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" 
                            Text='<%# Bind("acceptableMaster") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("acceptableMaster") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="拒絕師父" SortExpression="refuceMaster">
                    <EditItemTemplate>
                        <span class="body">
                        <asp:TextBox ID="refuseMasterTextBox" runat="server" Height="40px" 
                            Text='<%# Bind("refuceMaster") %>' Width="180px"></asp:TextBox>
                        <br />
                        <asp:DropDownList ID="refuseMasterDropDownList" runat="server" 
                            AutoPostBack="True" DataSourceID="masterSqlDataSource" DataTextField="name" 
                            DataValueField="name">
                        </asp:DropDownList>
                        <asp:Button ID="refuseMasterButton" runat="server" 
                            onclick="refuseMasterButton_Click" Text="加入" />
                        </span>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("refuceMaster") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("refuceMaster") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="性別" SortExpression="gender">
                    <EditItemTemplate>
                        <span class="body">
                        <asp:RadioButtonList ID="genderRadioButtonList" runat="server" 
                            RepeatDirection="Horizontal" RepeatLayout="Flow" 
                            SelectedValue='<%# Bind("gender") %>'>
                            <asp:ListItem Selected="True">男生</asp:ListItem>
                            <asp:ListItem>女生</asp:ListItem>
                        </asp:RadioButtonList>
                        </span>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="生日" SortExpression="birthday">
                    <EditItemTemplate>
                        <asp:Label ID="birthdayLabel" runat="server" 
                            Text='<%# Bind("birthday", "{0:d}") %>'></asp:Label>
                        <span class="body">
                        <br />
                        年份：<asp:DropDownList ID="yearDropDownList" runat="server" 
                            AutoPostBack="True" 
                            onselectedindexchanged="yearDropDownList_SelectedIndexChanged" 
                            Width="123px">
                        </asp:DropDownList>
                        　月份：<asp:DropDownList ID="monthDropDownList" runat="server" 
                            onselectedindexchanged="monthDropDownList_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </asp:DropDownList>
                        <br />
                        <asp:Calendar ID="birthdayCalendar" runat="server" BackColor="White" 
                            BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                            ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" 
                            onselectionchanged="birthdayCalendar_SelectionChanged" Width="350px">
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
                        </span>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("birthday") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="共用親友名單" SortExpression="shareFamily">
                    <EditItemTemplate>
                        <asp:TextBox ID="shareFamilyTextBox" runat="server" Height="40px" 
                            Text='<%# Bind("shareFamily") %>' Width="200px"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("shareFamily") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("shareFamily") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="禁忌" SortExpression="tabu">
                    <EditItemTemplate>
                        <asp:TextBox ID="tabuTextBox" runat="server" Height="40px" 
                            Text='<%# Bind("tabu") %>' Width="200px"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("tabu") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("tabu") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="健康狀況" SortExpression="health">
                    <EditItemTemplate>
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
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("health") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("health") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="住址" SortExpression="address">
                    <EditItemTemplate>
                        <asp:TextBox ID="addressTextBox" runat="server" Height="40px" 
                            Text='<%# Bind("address") %>' Width="200px"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="備註" SortExpression="comment">
                    <EditItemTemplate>
                        <asp:TextBox ID="commentTextBox" runat="server" Height="40px" 
                            Text='<%# Bind("comment") %>' Width="200px"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("comment") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("comment") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" CancelText="取消" UpdateText="更新" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <br />
        <asp:SqlDataSource ID="customerSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            SelectCommand="SELECT * FROM [Customer] WHERE ([cid] = @cid)" 
            
            
            
            UpdateCommand="UPDATE [Customer] SET [name] = @name, [cellphone] = @cellphone, [phone] = @phone, [specifiedMaster] = @specifiedMaster, [acceptableMaster] = @acceptableMaster, [refuceMaster] = @refuceMaster, [gender] = @gender, [birthday] = @birthday, [shareFamily] = @shareFamily, [tabu] = @tabu, [health] = @health, [address] = @address, [comment] = @comment WHERE [cid] = @cid">
            <SelectParameters>
                <asp:SessionParameter Name="cid" SessionField="cid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" />
                <asp:Parameter Name="cellphone" />
                <asp:Parameter Name="phone" />
                <asp:Parameter Name="specifiedMaster" />
                <asp:Parameter Name="acceptableMaster" />
                <asp:Parameter Name="refuceMaster" />
                <asp:Parameter Name="gender" />
                <asp:Parameter Name="birthday" />
                <asp:Parameter Name="shareFamily" />
                <asp:Parameter Name="tabu" />
                <asp:Parameter Name="health" />
                <asp:Parameter Name="address" />
                <asp:Parameter Name="comment" />
                <asp:SessionParameter Name="cid" SessionField="cid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="masterSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mikeConnectionString %>" 
            
            SelectCommand="SELECT [mid], [name] FROM [Master] WHERE (([name] &lt;&gt; @name) AND ([name] &lt;&gt; @name2))">
            <SelectParameters>
                <asp:Parameter DefaultValue="加值" Name="name" Type="String" />
                <asp:Parameter DefaultValue="還款" Name="name2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="createButton" runat="server" 
            PostBackUrl="~/10_Security/office/customer/customerCreate.aspx" Text="新增客戶" />
&nbsp;<asp:Button ID="selectButton" runat="server" 
            Text="選擇其他會員" 
            PostBackUrl="~/10_Security/office/customer/customerSelect.aspx" />
&nbsp;<asp:Button ID="viewButton" runat="server" 
            PostBackUrl="~/10_Security/office/customer/customerView.aspx" 
            Text="檢視會員" />
        &nbsp;<asp:Button ID="consumeRecordButton" runat="server" Text="消費紀錄" 
            PostBackUrl="~/10_Security/office/customer/customerConsumeRecord.aspx" />
&nbsp;<asp:Button ID="topUpButton" runat="server" 
            Text="會員加值/還款" 
            PostBackUrl="~/10_Security/office/customer/customerTopUp.aspx" />
&nbsp;<asp:Button ID="reservationButton" runat="server" Text="預約" 
            PostBackUrl="~/10_Security/office/customer/customerReservation.aspx" />
&nbsp;<asp:Button ID="consumeButton" runat="server" 
            Text="消費" 
            PostBackUrl="~/10_Security/office/customer/customerConsume.aspx" />
        <br />
        </span>
    
    </div>
    </form>
</body>
</html>
