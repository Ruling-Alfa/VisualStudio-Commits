using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class DataCaching : System.Web.UI.Page
{
    DataView dv;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        ds = new DataSet();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Cache["MyCache"] == null)
        {
            SqlConnection con = new SqlConnection("Data Source=localhost;Initial Catalog=Hsptl;Persist Security Info=True;User ID=sa;Password=newuser123#");
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Doctor", con);
            SqlDataAdapter adp = new SqlDataAdapter();
            adp.SelectCommand = cmd;
            adp.Fill(ds);
            dv = new DataView(ds.Tables[0]);
            Cache.Insert("MyCache", dv);
            Label1.Text = "Data retrived from Database";
        }
        else {
            dv = (DataView) Cache["MyCache"];
            Label1.Text = "Data retrived from Cache";
        }
        GridView1.DataSource = dv;
        GridView1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Cache.Remove("MyCache");
        Label1.Text = "Cache Cleared";
    }
}