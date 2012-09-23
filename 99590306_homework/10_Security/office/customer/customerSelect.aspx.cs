using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _11_Project_customer_customerSelect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int i = 1; i <= 12; i++)
            {
                monthDropDownList.Items.Add(new ListItem(i + " 月", i.ToString()));
            }
            monthDropDownList_SelectedIndexChanged((Object)monthDropDownList, new EventArgs());
        }
        SetSelectCommand();
        customerGridView.DataBind();
    }
    protected void nameCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        SetSelectCommand();
    }
    protected void genderCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        SetSelectCommand();
    }
    protected void phoneCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        SetSelectCommand();
    }
    protected void cellphoneCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        SetSelectCommand();
    }
    protected void commentCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        SetSelectCommand();
    }
    protected void commentTextBox_TextChanged(object sender, EventArgs e)
    {
        SetSelectCommand();
    }
    private void SetSelectCommand()
    {
        customerSqlDataSource.SelectCommand = "SELECT cid, name, cellphone, phone, birthday, firstTopUp, comment FROM Customer";
        string parameter = null;
        if (cidCheckBox.Checked) { //序號篩選條件
            int cid;
            try
            {
                cid = Convert.ToInt32(cidTextBox.Text);
                parameter = "cid = " + cid;
            }
            catch (Exception)
            {
            }
        }
        if (nameCheckBox.Checked)//姓名篩選條件
        {
            if (parameter != null)
            {
                parameter += " AND name LIKE N'%" + nameTextBox.Text + "%'";
            }
            else
            {
                parameter = "name LIKE N'%" + nameTextBox.Text + "%'";
            }
        }
        if (genderCheckBox.Checked)//性別篩選條件
        {
            if (parameter != null)
            {
                parameter += " AND gender LIKE '%" + genderRadioButtonList.SelectedValue + "%'";
            }
            else
            {
                parameter = "gender LIKE '%" + genderRadioButtonList.SelectedValue + "%'";
            }
        }
        if (birthdayCheckBox.Checked) { //生日篩選條件
            if (parameter != null)
            {
                parameter += " AND month(birthday) = " + monthDropDownList.SelectedValue;
                parameter += " AND day(birthday) = " + dayDropDownList.SelectedValue;
            }
            else {
                parameter = "month(birthday) = " + monthDropDownList.SelectedValue;
                parameter += " AND day(birthday) = " + dayDropDownList.SelectedValue;
            }
        }
        if (phoneCheckBox.Checked)//家電篩選條件
        {
            if (parameter != null)
            {
                parameter += " AND phone LIKE '%" + phoneTextBox.Text + "%'";
            }
            else
            {
                parameter = "phone LIKE '%" + phoneTextBox.Text + "'%'";
            }
        }
        if (cellphoneCheckBox.Checked)//手機篩選條件
        {
            if (parameter != null)
            {
                parameter += " AND cellphone LIKE '%" + cellphoneTextBox.Text + "%'";
            }
            else
            {
                parameter = "cellphone LIKE '%" + cellphoneTextBox.Text + "%'";
            }
        }
        if (commentCheckBox.Checked) {//備註篩選條件
            if (parameter != null)
            {
                parameter += " AND comment LIKE N'%" + commentTextBox.Text + "%'";                                      
            }
            else
            {
                parameter += "comment LIKE N'%" + commentTextBox.Text + "%'";
            }
        }
        if (parameter != null)//加入篩選條件
        {
            customerSqlDataSource.SelectCommand += " WHERE " + parameter;
        }
    }
    protected void viewButton_Click(object sender, EventArgs e)
    {
        if (customerGridView.SelectedIndex != -1)
        {
            Session["cid"] = customerGridView.SelectedDataKey.Value;
            Server.Transfer("customerView.aspx");
        }
        else
        {
            Response.Write("<script> alert('請選擇一列唷!'); </script>");
        }
    }
    protected void modifyButton_Click(object sender, EventArgs e)
    {
        if (customerGridView.SelectedIndex != -1)
        {
            Session["cid"] = customerGridView.SelectedDataKey.Value;
            Server.Transfer("customerModify.aspx");
        }
        else
        {
            Response.Write("<script> alert('請選擇一列唷!'); </script>");
        }
    }
    protected void consumeRecordButton_Click(object sender, EventArgs e)
    {
        if (customerGridView.SelectedIndex != -1)
        {
            Session["cid"] = customerGridView.SelectedDataKey.Value;
            Server.Transfer("customerConsumeRecord.aspx");
        }
        else
        {
            Response.Write("<script> alert('請選擇一列唷!'); </script>");
        }
    }
    protected void topUpButton_Click(object sender, EventArgs e)
    {
        if (customerGridView.SelectedIndex != -1)
        {
            Session["cid"] = customerGridView.SelectedDataKey.Value;
            Server.Transfer("customerTopUp.aspx");
        }
        else
        {
            Response.Write("<script> alert('請選擇一列唷!'); </script>");
        }
    }
    protected void consumeButton_Click(object sender, EventArgs e)
    {
        if (customerGridView.SelectedIndex != -1)
        {
            Session["cid"] = customerGridView.SelectedDataKey.Value;
            Server.Transfer("customerConsume.aspx");
        }
        else
        {
            Response.Write("<script> alert('請選擇一列唷!'); </script>");
        }
    }
    protected void reservationButton_Click(object sender, EventArgs e)
    {
        if (customerGridView.SelectedIndex != -1)
        {
            Session["cid"] = customerGridView.SelectedDataKey.Value;
            Server.Transfer("customerReservation.aspx");
        }
        else
        {
            Response.Write("<script> alert('請選擇一列唷!'); </script>");
        }
    }
    protected void newCustomerButton_Click(object sender, EventArgs e)
    {
        Server.Transfer("customerNew.aspx");
    }
    protected void reservationAppointmentButton_Click(object sender, EventArgs e)
    {
        if (customerGridView.SelectedIndex != -1)
        {
            Session["cid"] = customerGridView.SelectedDataKey.Value;
            Server.Transfer("customerReservationAppointment.aspx");
        }
        else
        {
            Response.Write("<script> alert('請選擇一列唷!'); </script>");
        }
    }
    protected void birthdayCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        SetSelectCommand();
    }
    protected void monthDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        int month = Convert.ToInt32(monthDropDownList.SelectedValue);
        dayDropDownList.Items.Clear();
        for(int i=1;i<=DateTime.DaysInMonth(2000,month);i++){
            dayDropDownList.Items.Add(i.ToString());
        }
        SetSelectCommand();
    }
    protected void dayDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetSelectCommand();
    }
    protected void cidTextBox_TextChanged(object sender, EventArgs e)
    {
        SetSelectCommand();
    }
    protected void cidCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        SetSelectCommand();
    }
}