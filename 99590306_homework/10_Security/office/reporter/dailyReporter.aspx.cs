using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _10_Security_office_reporter_dailyReporter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            birthdayCalendar.SelectedDate = birthdayCalendar.VisibleDate = DateTime.Now;
        }
    }
    protected void yearDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int month, day;
        //month = birthdayCalendar.SelectedDate.Month;
        //day = birthdayCalendar.SelectedDate.Day;
        //birthdayCalendar.SelectedDate = birthdayCalendar.VisibleDate =
        //    new DateTime(Convert.ToInt32(yearDropDownList.SelectedValue), month, day);
        SetDate(yearDropDownList.SelectedValue,
            monthDropDownList.SelectedValue,
            birthdayCalendar.SelectedDate.Day);
    }
    protected void monthDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int year, day;
        //year = birthdayCalendar.SelectedDate.Year;
        //day = birthdayCalendar.SelectedDate.Day;
        //birthdayCalendar.SelectedDate = birthdayCalendar.VisibleDate =
        //    new DateTime(year, Convert.ToInt32(monthDropDownList.SelectedValue), day);
        SetDate(yearDropDownList.SelectedValue,
            monthDropDownList.SelectedValue,
            birthdayCalendar.SelectedDate.Day);
    }
    protected void birthdayCalendar_SelectionChanged(object sender, EventArgs e)
    {
        //int year, month;
        //year = birthdayCalendar.SelectedDate.Year;
        //month = birthdayCalendar.SelectedDate.Month;
        //yearDropDownList.SelectedValue = year.ToString();
        //monthDropDownList.SelectedValue = month.ToString();
        SetDate(birthdayCalendar.SelectedDate.Year,
            birthdayCalendar.SelectedDate.Month,
            birthdayCalendar.SelectedDate.Day);
    }
    private void SetDate(string year, string month, int day) {
        SetDate( Convert.ToInt32(year),Convert.ToInt32(month),day);
    }
    private void SetDate(int year, int month, int day) {
        yearDropDownList.SelectedValue = year.ToString();
        monthDropDownList.SelectedValue = month.ToString();
        birthdayCalendar.SelectedDate = birthdayCalendar.VisibleDate =
            new DateTime(year, month, day);
    }
}