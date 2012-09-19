using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _10_Security_office_initialize : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void allInitializeButton_Click(object sender, EventArgs e)
    {
        customerInitalizeSqlDataSource.Delete();
        serviceInitializeSqlDataSource.Delete();
        masterInitializeSqlDataSource.Delete();
        recordInitializeSqlDataSource.Delete();
        Response.Write("<script> alert('全部初始化完畢！!'); </script>");
    }
    protected void customerInitializeButton_Click(object sender, EventArgs e)
    {
        customerInitalizeSqlDataSource.Delete();
        Response.Write("<script> alert('客戶資料初始化完畢！!'); </script>");
    }
    protected void serviceInitializeButton_Click(object sender, EventArgs e)
    {
        serviceInitializeSqlDataSource.Delete();
        Response.Write("<script> alert('服務項目初始化完畢！!'); </script>");
    }
    protected void masterInitializeButton_Click(object sender, EventArgs e)
    {
        masterInitializeSqlDataSource.Delete();
        Response.Write("<script> alert('師父資料初始化完畢！!'); </script>");
    }
    protected void recordInitializeButton_Click(object sender, EventArgs e)
    {
        recordInitializeSqlDataSource.Delete();
        Response.Write("<script> alert('消費紀錄初始化完畢！!'); </script>");
    }
}