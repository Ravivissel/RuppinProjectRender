using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectField : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void setName(String name)
    {
        Key.Text = name;
    }

    public String getValue()
    {
        return Value.Text;
    }

    public void longPN()
    {
        Value.Columns = 200;
    }
}