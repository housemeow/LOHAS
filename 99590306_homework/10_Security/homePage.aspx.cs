using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _07_WebService_aspLocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime date = DateTime.Now;
        Label1.Text = date.ToShortDateString();
        Session["nowMonth"] = date.Month.ToString();
        Session["nextMonth"] = date.AddMonths(1).Month.ToString();
        
        //date=date.AddHours(-date.Hour).AddMinutes(-date.Minute).AddMilliseconds(-date.Millisecond);
        Session["Year"] = date.Year;
        Session["Month"] = date.Month;
        Session["Day"] = date.Day;
        Session["tomorowDay"] = date.Day + 1;
        todayLabel.Text = "下個月:"+Session["nextMonth"].ToString()+"月壽星";
        nowMonthLabel.Text = "本月:" + Session["nowMonth"].ToString() + "月壽星";
        Session["reservation"] = "預約中";
    }
    protected void debtButton_Click(object sender, EventArgs e)
    {
        if (debtGridView.SelectedIndex != -1)
        {
            Session["cid"] = debtGridView.SelectedDataKey.Value;
            Session["repayment"] = true;
            Server.Transfer("office/customer/customerTopUp.aspx");
        }
        else
        {
            Response.Write("<script> alert('請從欠款名單選擇一列唷!'); </script>");
        }
    }
    protected void debtGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (debtGridView.Rows.Count == 0)
        {
            debtButton.Visible = false;
        }
        else {
            debtButton.Visible = true;
        }
    }
}