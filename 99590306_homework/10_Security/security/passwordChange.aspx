<%@ Page Language="C#" AutoEventWireup="true" CodeFile="passwordChange.aspx.cs" Inherits="_10_Security_Security_passwordChange" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        <asp:ChangePassword ID="ChangePassword1" runat="server" 
            ContinueDestinationPageUrl="~/10_Security/homePage.aspx">
        </asp:ChangePassword>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
