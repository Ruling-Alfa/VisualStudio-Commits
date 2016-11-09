using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Xml.Linq;

public partial class TestLoc2 : System.Web.UI.Page
{
    static string requestUri = string.Empty;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        var lat = Request.QueryString["lat"].ToString();
        var lon = Request.QueryString["lon"].ToString();
        
        RetrieveFormatedAddress(lat,lon);
        Response.Write(requestUri);

    }


    static string baseUri ="http://maps.googleapis.com/maps/api/geocode/xml?latlng={0},{1}&sensor=false";
    string location = string.Empty;

    public static void RetrieveFormatedAddress(string lat, string lng)
    {
        requestUri = string.Format(baseUri, lat, lng);

        using (WebClient wc = new WebClient())
        {
            string result = wc.DownloadString(requestUri);
            var xmlElm = XElement.Parse(result);
            var status = (from elm in xmlElm.Descendants()
                          where
                              elm.Name == "status"
                          select elm).FirstOrDefault();
            if (status.Value.ToLower() == "ok")
            {
                var res = (from elm in xmlElm.Descendants()
                           where
                               elm.Name == "formatted_address"
                           select elm).FirstOrDefault();
                requestUri = res.Value;
                
            }
        }
    }
}