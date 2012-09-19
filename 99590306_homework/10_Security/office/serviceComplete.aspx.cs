using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _10_Security_office_setOpinion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (consumeRecordGridView.SelectedIndex != -1)
        {
            Session["rid"] = consumeRecordGridView.SelectedDataKey.Value;
            updateConsumeReordSqlDataSource.Update();
            consumeRecordGridView.DataBind();
            consumeRecordGridView.SelectedIndex = -1;
            Response.Write("<script> alert('更新完成！!'); </script>");
        }
        else
        {
            Response.Write("<script> alert('請選擇一列唷!'); </script>");
        }
    }
    protected void consumeRecordGridView_DataBound(object sender, EventArgs e)
    {
        if (consumeRecordGridView.Rows.Count == 0)
        {
            nullLabel.Text = "沒有任何服務中的資料。";
            nullLabel.Visible = true;
            opinionRadioButtonList.Visible = Button1.Visible = false;
        }
        else
        {
            nullLabel.Visible = false;
            opinionRadioButtonList.Visible = Button1.Visible = true;
        }
    }
    protected void opinionRadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (opinionRadioButtonList.SelectedValue == "自訂")
        {
            opinionTextBox.Text = "";
            opinionTextBox.ReadOnly = false;
        }
        else
        {
            opinionTextBox.Text = opinionRadioButtonList.SelectedValue;
            opinionTextBox.ReadOnly = true;
        }
    }
}