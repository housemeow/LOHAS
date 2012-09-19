using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _10_Security_office_customer_customerReservation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int i = 10; i < 24; i++)
            {
                reservationHourDropDownList.Items.Add(i.ToString());
            }
            reservationHourDropDownList.SelectedIndex = 0;
            for (int i = 0; i <= 55; i+=5) {
                reservationMinuteDropDownList.Items.Add(i.ToString());
            }
            for (int i = 10; i <= 240; i += 10)//初始化服務時間欄位
            {
                ListItem item;
                if (i % 60 != 0)
                {
                    item = new ListItem(i.ToString());
                }
                else
                {
                    item = new ListItem(i.ToString() + "(" + (i / 60).ToString() + "小時)", i.ToString());
                }
                serviceMinuteDropDownList.Items.Add(item);
            }
            reservationMinuteDropDownList.SelectedIndex = 0;
            reservationDateCalendar.SelectedDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day) ;//DateTime.Now.AddDays(1);
            reservationDateCalendar.VisibleDate = reservationDateCalendar.SelectedDate;
            reservationTimeChange();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        reservationSqlDataSource.Insert();
        Server.Transfer("customerConsumeRecord.aspx");
    }
    protected void serviceFormView_DataBound(object sender, EventArgs e)
    {
        Label generalCostLabel = (Label)serviceFormView.FindControl("generalCostLabel");
        Label vipCostLabel = (Label)serviceFormView.FindControl("vipCostLabel");
        Session["servicePrice"] = generalCostLabel.Text;

        string firstTop = customerDetailsView.Rows[10].Cells[1].Text;
        DataView dataView = (DataView)customerSqlDataSource.Select(new DataSourceSelectArguments());
        firstTop = dataView.Table.Rows[0]["firstTopUp"].ToString();
        if (firstTop == "")
        {
            Session["servicePrice"] = generalCostLabel.Text;
            isVipLabel.Text = "本客戶為一般客戶，收費為:" + generalCostLabel.Text;
        }
        else
        {
            Session["servicePrice"] = vipCostLabel.Text;
            isVipLabel.Text = "本客戶為已儲值客戶，收費為:" + vipCostLabel.Text; ;
        }
    }
    protected void reservationMinuteDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        reservationTimeChange();
    }
    protected void reservationTimeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        reservationTimeChange();
    }
    protected void reservationDateCalendar_SelectionChanged(object sender, EventArgs e)
    {
        reservationTimeChange();
    }
    private void reservationTimeChange()
    {
        int year, month, day, hour, minute;
        year = reservationDateCalendar.SelectedDate.Year;
        month = reservationDateCalendar.SelectedDate.Month;
        day = reservationDateCalendar.SelectedDate.Day;
        hour = Convert.ToInt32(reservationHourDropDownList.SelectedValue);
        minute = Convert.ToInt32(reservationMinuteDropDownList.SelectedValue);
        DateTime reservationTime = new DateTime(year, month, day, hour, minute, 0);
        reservationTimeLabel.Text = reservationTime.ToString("yyyy/M/d HH:mm:ss");
    }
}