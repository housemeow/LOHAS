using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _11_Project_customer_customerTopUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            if (Session["repayment"] !=null) {
                Session["repayment"] = null;
                topUpMethodRadioButtonList.SelectedValue = "還款";
                topUpMethodRadioButtonList_SelectedIndexChanged((object)topUpMethodRadioButtonList, new EventArgs());
            }
        }
    }
    protected void topUpFormView_DataBound(object sender, EventArgs e)
    {
        TextBox moneyTextBox = (TextBox)topUpFormView.FindControl("moneyTextBox");
        moneyTextBox.Visible = false;
        calcAfterMoney();
    }
    
    protected void topUpMoneyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox moneyTextBox = (TextBox)topUpFormView.FindControl("moneyTextBox");
        if (((DropDownList)sender).SelectedValue == "其他")
        {
            moneyTextBox.Visible = true;
        }
        else
        {
            moneyTextBox.Visible = false;
        }
        calcAfterMoney();
    }
    protected void moneyTextBox_TextChanged(object sender, EventArgs e)
    {
        calcAfterMoney();
    }
    protected void topUpMethodRadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList topUpDropDownList = (DropDownList)topUpFormView.FindControl("topUpMoneyDropDownList");
        TextBox moneyTextBox = (TextBox)topUpFormView.FindControl("moneyTextBox");
        if (topUpMethodRadioButtonList.SelectedValue == "加值")
        {
            topUpDropDownList.SelectedIndex = 0;
            topUpDropDownList.Visible = true;
            moneyTextBox.Visible = false;
        }
        else {
            topUpDropDownList.SelectedValue = "其他";
            topUpDropDownList.Visible = false;
            Label debtMoneyLabel = (Label)topUpFormView.FindControl("debtLabel");
            moneyTextBox.Text = debtMoneyLabel.Text;
            moneyTextBox.Visible = true;
        }
        calcAfterMoney();
    }

    private void calcAfterMoney()
    {
        DropDownList topUpDropDownList = (DropDownList)topUpFormView.FindControl("topUpMoneyDropDownList");
        Label restMoneyLabel = (Label)topUpFormView.FindControl("restMoneyLabel");
        Label debtMoneyLabel = (Label)topUpFormView.FindControl("debtLabel");
        TextBox moneyTextBox = (TextBox)topUpFormView.FindControl("moneyTextBox");
        Label afterMoneyLabel = (Label)topUpFormView.FindControl("afterMoneyLabel");
        int topUpMoney;
        int restMoney;
        int debtMoney;
        try//儲值金
        {
            restMoney = Convert.ToInt32(restMoneyLabel.Text);
        }
        catch (Exception)
        {
            restMoney = 0;
        }
        try//欠款
        {
            debtMoney = Convert.ToInt32(debtMoneyLabel.Text);
        }
        catch (Exception)
        {
            debtMoney = 0;
        }
        if (topUpDropDownList.SelectedValue == "其他")//算得topUpMoney金額
        {
            topUpMoney = Convert.ToInt32(moneyTextBox.Text);
            afterMoneyLabel.Text = (restMoney + topUpMoney).ToString();
        }
        else//已經選取的金額5000 10000 15000 20000
        {
            topUpMoney = Convert.ToInt32(topUpDropDownList.SelectedValue);
        }
        if (topUpMethodRadioButtonList.SelectedValue == "加值")//加值後與還款後的計算
        {
            afterMoneyLabel.Text = (restMoney + topUpMoney).ToString();
        }
        else//還款
        {
            afterMoneyLabel.Text = (debtMoney - topUpMoney).ToString();
        }
    }
    protected void topUpButton_Click(object sender, EventArgs e)
    {
        updateCustomer();
        insertRecord();
        Server.Transfer("customerView.aspx");
    }

    private void updateCustomer()
    {
        DropDownList topUpDropDownList = (DropDownList)topUpFormView.FindControl("topUpMoneyDropDownList");
        DateTime serviceDate = DateTime.Now;
        TextBox moneyTextBox = (TextBox)topUpFormView.FindControl("moneyTextBox");
        Label restMoneyLabel = (Label)topUpFormView.FindControl("restMoneyLabel");
        Label debtMoneyLabel = (Label)topUpFormView.FindControl("debtLabel");
        Label firstTopUpLabel = (Label)topUpFormView.FindControl("firstTopUpLabel");//首次加值日
        Label afterMoneyLabel = (Label)topUpFormView.FindControl("afterMoneyLabel");//加值後金額
        string recorder = ((TextBox)topUpFormView.FindControl("recorderTextBox")).Text;
        string updateQuery = "UPDATE [Customer] SET ";
        if (topUpMethodRadioButtonList.SelectedValue == "加值")
        {//改Customer之剩餘金額及首次加值日
            if (firstTopUpLabel.Text == "") { //如果沒加值過
                updateQuery += "firstTopUp =GetDate(), ";
            }
            updateQuery += "restMoney = '" + afterMoneyLabel.Text + "' WHERE [cid] = @cid";
        }
        else //還款
        {//改Customer之欠款
            updateQuery += "debt = '" + afterMoneyLabel.Text + "' WHERE [cid] = @cid";
        }
        customerSqlDataSource.UpdateCommand = updateQuery;
        customerSqlDataSource.Update();

    }
    private void insertRecord()
    {////////////////////////////////////加值/還款紀錄////////////////////////////////////////////
        DropDownList topUpDropDownList = (DropDownList)topUpFormView.FindControl("topUpMoneyDropDownList");
        Session["serviceDate"] = DateTime.Now;//ok
        int topUpMoney;
        if (topUpDropDownList.SelectedValue == "其他")//抓取moneyTextBox得到price
        {
            TextBox moneyTextBox = (TextBox)topUpFormView.FindControl("moneyTextBox");
            topUpMoney = Convert.ToInt32(moneyTextBox.Text);
        }
        else//已經選取的金額5000 10000 15000 20000
        {
            topUpMoney = Convert.ToInt32(topUpDropDownList.SelectedValue);
        }
        Session["servicePrice"] = topUpMoney;//ok
        Session["cash"] = topUpMoney;//ok
        Session["recorder"] = ((TextBox)topUpFormView.FindControl("recorderTextBox")).Text;//ok
        Session["executionState"] = topUpMethodRadioButtonList.SelectedValue;//ok
        if (topUpMethodRadioButtonList.SelectedValue == "加值")
        {
            Session["sid"] = 1;
            Session["mid"] = 1;
        }
        else//還款
        {
            Session["sid"] = 2;
            Session["mid"] = 2;
        }
        recordInsertSqlDataSource.Insert();

    }
}