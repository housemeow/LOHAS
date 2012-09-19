using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _10_Security_office_record : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void consumeRecordGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Session["servicePrice"] = e.NewValues["servicePrice"];
        Session["masterCommission"] = e.NewValues["masterCommission"];
        Session["profit"] = e.NewValues["profit"];
        Session["debt"] = e.NewValues["debt"];
        Session["cash"] = e.NewValues["cash"];
        Session["serviceMinute"] = e.NewValues["serviceMinute"];
        Session["companyRevenue"] = e.NewValues["companyRevenue"];
        Session["opinion"] = e.NewValues["opinion"];
        Session["recorder"] = e.NewValues["recorder"];
        Session["executionState"] = e.NewValues["executionState"];
        Session["rid"] = e.NewValues["rid"];
    }
}