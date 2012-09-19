using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// LocationWebService 的摘要描述
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下一行。
 [System.Web.Script.Services.ScriptService]
public class LocationWebService : System.Web.Services.WebService {

    public LocationWebService () {

        //如果使用設計的元件，請取消註解下行程式碼 
        //InitializeComponent(); 
    }

    [WebMethod]
    public locationData getLocationData(int pid)
    {
        locationDataSetTableAdapters.locationTableAdapter tableAdapter =
            new locationDataSetTableAdapters.locationTableAdapter();
        locationDataSet.locationDataTable dataTable = tableAdapter.getLocationDataTable(pid);
        locationDataSet.locationRow dataRow = (locationDataSet.locationRow)dataTable.Rows[0];
        locationData location = new locationData();
        location.longitude = Convert.ToSingle(dataRow.longitude);
        location.latitude = Convert.ToSingle(dataRow.latitude);
        return location;
    }
    
}
public class locationData {
    public Single latitude;
    public Single longitude;
}
