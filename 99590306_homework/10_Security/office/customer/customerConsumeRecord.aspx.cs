using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _11_Project_customer_customerConsumeRecord : System.Web.UI.Page
{
    DetailsViewMode mode;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            DateTime now  = DateTime.Now;
            startDateCalendar.SelectedDate = now;
            startDateCalendar.VisibleDate = now;
            endDateCalendar.SelectedDate = now;
            endDateCalendar.VisibleDate = now;
            startDateLabel.Text = now.ToShortDateString();
            endDateLabel.Text = now.ToShortDateString();
            consumeRecordDetailsView_Enable();
        }
        
    }
    protected void consumeRecordGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        consumeRecordDetailsView.PageIndex = consumeRecordGridView.SelectedIndex;
        consumeRecordDetailsView_Enable();
    }
    protected void consumeRecordGridView_DataBound(object sender, EventArgs e)
    {
        if (consumeRecordGridView.Rows.Count == 0)
        {
            nullLabel.Text = "查無此會員的消費紀錄";
            nullLabel.Visible = true;
        }
        else
        {
            consumeRecordGridView.SelectedIndex = 0;
            nullLabel.Visible = false;
        }
    }
    protected void consumeRecordDetailsView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        int index = consumeRecordGridView.SelectedIndex;
        consumeRecordGridView.DataBind();
        consumeRecordGridView.SelectedIndex = index;
        

    }
    protected void okButton_Click(object sender, EventArgs e)
    {
        TextBox serviceMinute = (TextBox)consumeRecordDetailsView.FindControl("serviceMinuteTextBox");
        Session["serviceMinute"] = serviceMinute.Text;
        TextBox servicePrice = (TextBox)consumeRecordDetailsView.FindControl("servicePriceTextBox");
        Session["servicePrice"] = servicePrice.Text;
        TextBox masterCommision = (TextBox)consumeRecordDetailsView.FindControl("masterCommissionTextBox");
        Session["masterCommision"] = masterCommision.Text;
        TextBox profit = (TextBox)consumeRecordDetailsView.FindControl("profitTextBox");
        Session["profit"] = profit.Text;
        TextBox debt = (TextBox)consumeRecordDetailsView.FindControl("debtTextBox");
        Session["debt"] = debt.Text;
        TextBox cash = (TextBox)consumeRecordDetailsView.FindControl("cashTextBox");
        Session["cash"] = cash.Text;
        TextBox companyRevenue = (TextBox)consumeRecordDetailsView.FindControl("companyRevenueTextBox");
        Session["companyRevenue"] = companyRevenue.Text;
        RadioButtonList opinion = (RadioButtonList)consumeRecordDetailsView.FindControl("opinionRadioButtonList");
        Session["opinion"] = opinion.SelectedValue;
        TextBox recorder = (TextBox)consumeRecordDetailsView.FindControl("recorderTextBox");
        Session["recorder"] = recorder.Text;


        updateRecordSqlDataSource.Update();
        consumeRecordGridView.DataBind();
    }
    protected void dateFilterCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        SetSelectCommand();
    }
    protected void startDateCalendar_SelectionChanged(object sender, EventArgs e)
    {   
        SetSelectCommand();
    }
    protected void endDateCalendar_SelectionChanged(object sender, EventArgs e)
    {
        SetSelectCommand();
    }
    private void SetSelectCommand()
    {
        string selectQuery =  "SELECT Record.serviceDate, Record.serviceMinute, Record.servicePrice, Record.masterCommission, Record.profit, Record.debt, Record.cash, Record.companyRevenue, Record.opinion, Record.recorder, Record.executionState, Master.name AS masterName, Service.name AS serviceName, Record.rid, Record.comment FROM Record INNER JOIN Master ON Record.mid = Master.mid INNER JOIN Service ON Record.sid = Service.sid WHERE (Record.cid = @cid) AND (Record.executionState LIKE @executionState)";
        DateTime start, end;
        start = startDateCalendar.SelectedDate;
        end = endDateCalendar.SelectedDate;
        if (dateFilterCheckBox.Checked)
        {
            if (startDateCalendar.SelectedDate < endDateCalendar.SelectedDate)
            {
                start = startDateCalendar.SelectedDate;
                end = endDateCalendar.SelectedDate;
            }
            else {
                start = endDateCalendar.SelectedDate;
                end = startDateCalendar.SelectedDate;
                startDateCalendar.SelectedDate = start;
                startDateCalendar.VisibleDate = start;
                endDateCalendar.SelectedDate = end;
                endDateCalendar.VisibleDate = end;
            }
            //start = start.AddDays(-1);
            end = end.AddDays(1);
            selectQuery += "AND ( serviceDate >= CONVERT(DATETIME,'" + start.ToShortDateString() + "')";
            selectQuery += "AND serviceDate <= CONVERT(DATETIME,'" + end.ToShortDateString() + "'))";
        }
        selectQuery += "  ORDER BY Record.serviceDate DESC";
        customerSqlDataSource.SelectCommand = selectQuery;
        startDateLabel.Text = start.ToShortDateString();
        endDateLabel.Text = end.ToShortDateString();

        consumeRecordGridView.DataBind();
        
    }
    private void consumeRecordDetailsView_Enable() 
    {
        if (User.IsInRole("boss"))
        {
            consumeRecordDetailsView.ChangeMode(DetailsViewMode.Edit);
            //Button button = (Button)consumeRecordDetailsView.FindControl("okButton");
            //button.Enabled = true;
            //mode = DetailsViewMode.Edit;
            //consumeRecordDetailsView.DefaultMode = DetailsViewMode.Edit;
        }
        else
        {

            Label11.Text = consumeRecordGridView.Rows[consumeRecordGridView.SelectedIndex].Cells[13].Text;
            if (consumeRecordGridView.Rows[consumeRecordGridView.SelectedIndex].Cells[13].Text == "服務完畢")
            {
                consumeRecordDetailsView.ChangeMode(DetailsViewMode.ReadOnly);
                //Button button = (Button)consumeRecordDetailsView.FindControl("okButton");
                //button.Enabled = false;
            }
            else 
            {
                
                consumeRecordDetailsView.ChangeMode(DetailsViewMode.Edit);
                //Button button = (Button)consumeRecordDetailsView.FindControl("okButton");
                //button.Enabled = true;
            }
        }
    }
    protected void consumeRecordDetailsView_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        
    }
    protected void consumeRecordDetailsView_Load(object sender, EventArgs e)
    {
        
    }
    protected void consumeRecordDetailsView_DataBound(object sender, EventArgs e)
    {
        if (User.IsInRole("boss"))
        {
            Button button = (Button)consumeRecordDetailsView.FindControl("okButton");
            button.Enabled = true;
        }
        else
        {
            Label11.Text = consumeRecordGridView.Rows[consumeRecordGridView.SelectedIndex].Cells[13].Text;
            if (consumeRecordGridView.Rows[consumeRecordGridView.SelectedIndex].Cells[13].Text == "服務完畢")
            {
                Button button = (Button)consumeRecordDetailsView.FindControl("okButton");
                button.Enabled = false;
            }
            else
            {
                Button button = (Button)consumeRecordDetailsView.FindControl("okButton");
                button.Enabled = true;
            }
        }
    }
}