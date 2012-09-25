using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class _10_Security_Security_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard_CreatedUser(object sender, EventArgs e)
    {
        //CreateUserWizard.UserName
        Roles.AddUserToRole(CreateUserWizard.UserName, "recorder");
    }
}