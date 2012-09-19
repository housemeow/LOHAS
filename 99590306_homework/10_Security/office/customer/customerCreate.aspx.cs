using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _10_Security_office_customer_customerCreate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        birthdayControl();
        //}
    }
    private void birthdayControl()
    {
        DropDownList yearDropDownList = (DropDownList)customerDetailsView.FindControl("yearDropDownList");
        yearDropDownList.Items.Clear();
        for (int i = 2012; i >= 1912; i--)
        {
            ListItem item = new ListItem(i.ToString() + "(民國" + (i - 1911).ToString() + ")", i.ToString());
            yearDropDownList.Items.Add(item);
        }
        yearDropDownList.SelectedIndex = 0;
        DropDownList monthDropDownList = (DropDownList)customerDetailsView.FindControl("monthDropDownList");
        monthDropDownList.Items.Clear();
        for (int i = 1; i <= 12; i++)
        {
            monthDropDownList.Items.Add(i.ToString());
        }
        monthDropDownList.SelectedIndex = 0;
    }

    protected void yearDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {//修改Calendar的年份，並更新birthdayLabel
        Calendar birthdayCalendar = (Calendar)customerDetailsView.FindControl("birthdayCalendar");
        DropDownList yearDropDownList = (DropDownList)sender;
        int year, month, day;
        year = Convert.ToInt32(yearDropDownList.SelectedValue);
        month = birthdayCalendar.SelectedDate.Month;
        day = birthdayCalendar.SelectedDate.Day;
        birthdayCalendar.SelectedDate = birthdayCalendar.VisibleDate = new DateTime(year, month, day);
        birthdayChanged();
    }
    protected void monthDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {//修改Calendar的月份，並更新birthdayLabel
        Calendar birthdayCalendar = (Calendar)customerDetailsView.FindControl("birthdayCalendar");
        DropDownList monthDropDownList = (DropDownList)sender;
        int year, month, day;
        year = birthdayCalendar.SelectedDate.Year;
        month = Convert.ToInt32(monthDropDownList.SelectedValue);
        day = birthdayCalendar.SelectedDate.Day;
        birthdayCalendar.SelectedDate = birthdayCalendar.VisibleDate = new DateTime(year, month, day);
        birthdayChanged();
    }
    protected void birthdayCalendar_SelectionChanged(object sender, EventArgs e)
    {//修改DropDownList的年份與月份，並更新birthdayLabel
        Calendar birthdayCalendar = (Calendar)customerDetailsView.FindControl("birthdayCalendar");
        DropDownList yearDropDownList = (DropDownList)customerDetailsView.FindControl("yearDropDownList");
        DropDownList monthDropDownList = (DropDownList)customerDetailsView.FindControl("monthDropDownList");
        yearDropDownList.SelectedValue = birthdayCalendar.SelectedDate.Year.ToString();
        monthDropDownList.SelectedValue = birthdayCalendar.SelectedDate.Month.ToString();
        birthdayChanged();
    }
    private void birthdayChanged()
    {//更新birthdayLabel
        Calendar birthdayCalendar = (Calendar)customerDetailsView.FindControl("birthdayCalendar");
        Label birthdayLabel = (Label)customerDetailsView.FindControl("birthdayLabel");
        birthdayLabel.Text = birthdayCalendar.SelectedDate.ToShortDateString();
    }

    protected void surgeryCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        healthChange();
    }
    protected void diseaseCheckBoxList_SelectedIndexChanged(object sender, EventArgs e)
    {
        healthChange();
    }
    protected void otherDiseaseCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        healthChange();
    }
    protected void surgeryTextBox_TextChanged(object sender, EventArgs e)
    {
        healthChange();
    }
    protected void otherDiseaseTextBox_TextChanged(object sender, EventArgs e)
    {
        healthChange();
    }
    private void healthChange()
    {
        TextBox healthTextBox = (TextBox)customerDetailsView.FindControl("healthTextBox");

        CheckBox surgeryCheckBox = (CheckBox)customerDetailsView.FindControl("surgeryCheckBox");
        TextBox surgeryTextBox = (TextBox)customerDetailsView.FindControl("surgeryTextBox");
        CheckBoxList diseaseCheckBoxList = (CheckBoxList)customerDetailsView.FindControl("diseaseCheckBoxList");
        CheckBox otherDiseaseCheckBox = (CheckBox)customerDetailsView.FindControl("otherDiseaseCheckBox");
        TextBox otherDiseaseTextBox = (TextBox)customerDetailsView.FindControl("otherDiseaseTextBox");
        healthTextBox.Text = "";
        if (surgeryCheckBox.Checked)
        {
            healthTextBox.Text += surgeryTextBox.Text + " ";
        }
        foreach (ListItem checkBox in diseaseCheckBoxList.Items)
        {
            if (checkBox.Selected)
            {
                healthTextBox.Text += checkBox.Text + " ";
            }
        }
        if (otherDiseaseCheckBox.Checked)
        {
            healthTextBox.Text += otherDiseaseTextBox.Text + " ";
        }
    }
    protected void customerSqlDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Session["cid"] = e.Command.Parameters["@PK_New"].Value;
        Server.Transfer("customerView.aspx");
    }
    protected void customerSqlDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        //SqlParameter insertedKey = new SqlParameter("@PK_New", SqlDbType.Int);
        //insertedKey.Direction = ParameterDirection.Output;
        //e.Command.Parameters.Add(new SqlParameter("@PK_New", SqlDbType.Int));
    }
    protected void healthDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList healthDropDownList = (DropDownList)sender;
        TextBox detailHealthTextBox = (TextBox)(customerDetailsView.FindControl("detailHealthTextBox"));
        if (healthDropDownList.SelectedValue == "曾手術或開刀" || healthDropDownList.SelectedValue == "其他")
        {
            detailHealthTextBox.Visible = true;
        }
        else
        {
            detailHealthTextBox.Visible = false;
        }
    }
    protected void healthButton_Click(object sender, EventArgs e)
    {
        TextBox healthTextBox = (TextBox)(customerDetailsView.FindControl("healthTextBox"));
        TextBox detailHealthTextBox = (TextBox)(customerDetailsView.FindControl("detailHealthTextBox"));
        DropDownList healthDropDownList = (DropDownList)(customerDetailsView.FindControl("healthDropDownList"));
        if (healthTextBox.Text != "") {
            healthTextBox.Text += ", ";
        }
        if (healthDropDownList.SelectedValue == "曾手術或開刀" || healthDropDownList.SelectedValue == "其他")
        {
            healthTextBox.Text+= healthDropDownList.SelectedValue + "(" + detailHealthTextBox.Text+ ")";
        }else{
            healthTextBox.Text += healthDropDownList.SelectedValue;
        }
    }
}