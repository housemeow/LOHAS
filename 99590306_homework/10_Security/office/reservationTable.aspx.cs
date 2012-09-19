using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _10_Security_office_reservationTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Calendar1.SelectedDate= DateTime.Now;
        Calendar1.VisibleDate = Calendar1.SelectedDate;
    }
}