using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class _10_Security_tripMenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["reloadScript"]!=null)
        {
            Response.Write(Session["reloadScript"]);
            Session["reloadScript"]=null;
        }

    }
    protected void TreeView1_TreeNodeDataBound(object sender, TreeNodeEventArgs e)
    {
        if (e.Node.Text == "郵件通訊") {
            e.Node.Target = "_blank";
        }
    }
    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
    }
    protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
    {

    }
    protected void userImage_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_LoggedIn1(object sender, EventArgs e)
    {
        Session["user"] = User.Identity.Name;
        Session.Timeout = 10;

        Session["reloadScript"] = "<script>parent.mainFrame.location.href='homepage.aspx'</script>";
    }
    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Session["reloadScript"] = "<script>parent.mainFrame.location.href='homepage.aspx'</script>";
    }
}