using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _11_Project_customer_customerConsume : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {//初始化服務時間欄位
            for (int i = 10; i <= 240; i += 10)
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
        }
    }
    protected void masterCommisionTextBox_TextChanged(object sender, EventArgs e)
    {
        try
        {
            int masterCommision = Convert.ToInt32(masterCommissionTextBox.Text);
        }
        catch (Exception)
        {
            masterCommissionTextBox.Text = "0";
        }
        calcCompanyRevenue();
        calcProfit();
    }
    protected void consumeMethodRadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
    {
        calcDebt();
        calcCash();
    }
    protected void serviceFormView_DataBound(object sender, EventArgs e)
    {//修改服務項目
        calcPrice();
        calcCompanyRevenue();
        calcProfit();
        calcDebt();
        calcCash();
    }
    protected void unitRadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
    {//修改價格單位時間
        calcPrice();
        calcCompanyRevenue();
        calcProfit();
        calcDebt();
        calcCash();
    }
    protected void servicePriceTextBox_TextChanged(object sender, EventArgs e)
    {//因為servicePrice是手動修改所以不需重算Price
        calcCompanyRevenue();
        calcProfit();
        calcDebt();
        calcCash();
    }
    private void calcPrice()//計算收費價格，為單位價格乘以單位時間
    {
        Label generalCostLabel = (Label)serviceFormView.FindControl("generalCostLabel");
        Label vipCostLabel = (Label)serviceFormView.FindControl("vipCostLabel");
        string firstTop = customerDetailsView.Rows[10].Cells[1].Text;
        DataView dataView = (DataView)customerSqlDataSource.Select(new DataSourceSelectArguments());
        firstTop = dataView.Table.Rows[0]["firstTopUp"].ToString();
        int unit = Convert.ToInt32(unitRadioButtonList.SelectedValue);
        int price;
        if (firstTop == "")
        {
            Session["servicePrice"] = generalCostLabel.Text;
            price = Convert.ToInt16(generalCostLabel.Text);
            isVipLabel.Text = "本客戶為一般客戶，收費為:" + generalCostLabel.Text;
        }
        else
        {
            Session["servicePrice"] = vipCostLabel.Text;
            price = Convert.ToInt16(vipCostLabel.Text);
            isVipLabel.Text = "本客戶為已儲值客戶，收費為:" + vipCostLabel.Text; ;
        }
        servicePriceTextBox.Text = (unit * price).ToString();
    }
    private void calcProfit()
    { //計算淨利 淨利=公司營收-師父抽成
        int companyRevenue, masterCommission;
        try
        {
            companyRevenue = Convert.ToInt32(companyRevenueTextBox.Text);
        }
        catch (Exception)
        {
            companyRevenue = 0;
        }
        try
        {
            masterCommission = Convert.ToInt32(masterCommissionTextBox.Text);
        }
        catch (Exception)
        {
            masterCommission = 0;
        }
        profitTextBox.Text = (companyRevenue - masterCommission).ToString();
    }
    private void calcDebt()//計算欠款金額
    {
        if (consumeMethodRadioButtonList.SelectedValue == "欠款")
        {
            debtTextBox.Text = servicePriceTextBox.Text;
        }
        else
        {
            debtTextBox.Text = "0";
        }
    }
    private void calcCash()//計算現金金額
    {
        if (consumeMethodRadioButtonList.SelectedValue == "現金")
        {
            cashTextBox.Text = servicePriceTextBox.Text;
        }
        else
        {
            cashTextBox.Text = "0";
        }
    }
    private void calcCompanyRevenue()//計算公司營收
    {
        companyRevenueTextBox.Text = servicePriceTextBox.Text;
    }
    private void reservationAppointment()
    {
        //赴約，將消費紀錄時間改為現在、時間長度改為選擇的內容，填入六項金額、執行狀態改為服務中，備註改為消費方式
        string updateQuery = "UPDATE [Record] SET ";
        updateQuery += "serviceDate=GetDate()";
        updateQuery += ",serviceMinute=" + serviceMinuteDropDownList.SelectedValue;
        updateQuery += ",sid=" + serviceDropDownList.SelectedValue;
        updateQuery += ",mid=" + masterDropDownList.SelectedValue;
        updateQuery += ",servicePrice=" + servicePriceTextBox.Text;
        updateQuery += ",cash=" + cashTextBox.Text;
        updateQuery += ",masterCommission=" + masterCommissionTextBox.Text;
        updateQuery += ",profit=" + profitTextBox.Text;
        updateQuery += ",debt=" + debtTextBox.Text;
        updateQuery += ",companyRevenue=" + companyRevenueTextBox.Text;
        updateQuery += ",recorder='" + recorderTextBox.Text + "'";
        updateQuery += ",executionState='服務中'";
        updateQuery += ",opinion='尚未評價'";
        updateQuery += ",comment='" + consumeMethodRadioButtonList.SelectedValue + "'";
        updateQuery += "WHERE rid=" + reservationGridView.SelectedValue.ToString();
        updateRecordSqlDataSource.UpdateCommand = updateQuery;
        updateRecordSqlDataSource.Update();
    }
    private void reservationCancel()
    {
        //如果取消預約，將所有金額資訊設為0，執行狀態改為取消預約
        string updateQuery = "UPDATE [Record] SET servicePrice=0,masterCommission=0,profit=0,debt=0,cash=0,companyRevenue=0";
        string recorder = recorderTextBox.Text;
        updateQuery += ",recorder='" + recorder + "',executionState='取消預約' WHERE rid=" + reservationGridView.SelectedValue.ToString();
        updateRecordSqlDataSource.UpdateCommand = updateQuery;
        updateRecordSqlDataSource.Update();
    }
    private void updateCustomer()
    {//更新剩餘金額以及欠款、首次消費日
        Label restMoneyLabel = (Label)customerDetailsView.FindControl("restMoneyLabel");//剩餘儲值金額
        int restMoney;
        Label debtMoneyLabel = (Label)customerDetailsView.FindControl("debtLabel");//欠款
        int debt;
        int price = Convert.ToInt32(servicePriceTextBox.Text);
        Label firstConsumeDateLabel = (Label)customerDetailsView.FindControl("firstConsumeDateLabel");//首次加值日
        string updateQuery = null;
        if (firstConsumeDateLabel.Text == "")
        {//此為首次消費
            updateQuery = "UPDATE [Customer] SET firstConsumeDate=GetDate()";
        }
        if (consumeMethodRadioButtonList.SelectedValue == "儲值金扣款")
        {
            try
            {
                restMoney = Convert.ToInt32(restMoneyLabel.Text);
            }
            catch (Exception)
            {
                restMoney = 0;
            }
            restMoney -= price;
            if (updateQuery == null)
            {
                updateQuery = "UPDATE [Customer] SET restMoney=" + restMoney.ToString();
            }
            else
            {
                updateQuery += ", restMoney=" + restMoney.ToString();
            }
        }
        else if (consumeMethodRadioButtonList.SelectedValue == "欠款")
        {
            try
            {
                debt = Convert.ToInt32(debtMoneyLabel.Text);
            }
            catch (Exception)
            {
                debt = 0;
            }
            debt += price;
            if (updateQuery == null)
            {
                updateQuery = "UPDATE [Customer] SET debt=" + debt.ToString();
            }
            else
            {
                updateQuery += ", debt=" + debt.ToString();
            }
        }
        if (updateQuery != null)
        {
            updateQuery += "WHERE cid=" + Session["cid"].ToString();
            customerSqlDataSource.UpdateCommand = updateQuery;
            customerSqlDataSource.Update();
        }
    }
    protected void reservationGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        int index = reservationGridView.SelectedIndex;
        string sid = reservationGridView.Rows[index].Cells[3].Text;
        string mid = reservationGridView.Rows[index].Cells[4].Text;
        serviceDropDownList.SelectedValue = sid;// sidLabel.Text;
        masterDropDownList.SelectedValue = mid;// midLabel.Text;
    }
    protected void consumeButton_Click(object sender, EventArgs e)
    {
        if (reservationGridView.SelectedIndex == -1)
        {
            Response.Write("<script> alert('請選擇一列唷!'); </script>");
            return;
        }
        reservationAppointment();
        updateCustomer();
        Server.Transfer("customerConsumeRecord.aspx");
    }
    protected void cancelButton_Click(object sender, EventArgs e)
    {
        if (reservationGridView.SelectedIndex == -1)
        {
            Response.Write("<script> alert('請選擇一列唷!'); </script>");
            return;
        }
        reservationCancel();
        Server.Transfer("customerConsumeRecord.aspx");
    }
    protected void reservationGridView_DataBound(object sender, EventArgs e)
    {
        if (reservationGridView.Rows.Count == 0)
        {
            nullLabel.Text = "沒有任何預約紀錄，請點選其他功能項目！";
            nullLabel.Visible = true;
        }
        else
        {
            nullLabel.Text = "";
            nullLabel.Visible = false;
        }
    }
}