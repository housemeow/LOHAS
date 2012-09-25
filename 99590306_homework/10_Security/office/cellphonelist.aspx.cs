using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _10_Security_cellphonelist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dataView = new DataView();
        DataTable dataTable;
        dataView = (DataView)SqlDataSourcePhone.Select(DataSourceSelectArguments.Empty);
        dataTable = dataView.Table;
        String cellphoneString="";
        for(int i=0;i<dataTable.Rows.Count;i++)
        {
            cellphoneString+=Convert.ToString(dataTable.Rows[i]["cellphone"])+Environment.NewLine;
        }
        cellphoneTextBox.Text = cellphoneString.Replace(" ", Environment.NewLine);
    }
} 