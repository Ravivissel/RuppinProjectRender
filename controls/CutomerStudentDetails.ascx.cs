using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CutomerStudentDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void setName(String name)
    {
        NameCS.Text = name;
    }
    public void setLogoImg(String name)
    {
        logoImg.Text = name;
    }

    public void UnVisibleDesc()
    {
        Descrp.Visible = false;
        Description.Visible = false;
       // RequiredFieldValidator1.Visible = false;
        RequiredFieldValidator1.Enabled = false;

    }

    public void UnvisibleNameLabel()
    {
        NameCSSTX.Visible = false;
        NameCS.Visible = false;
        RequiredFieldValidator2.Enabled = false;
    }

    public string Result { get { return NameCS.Text; }}


 
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

}