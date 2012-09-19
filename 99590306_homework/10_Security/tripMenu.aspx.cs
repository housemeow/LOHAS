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
}