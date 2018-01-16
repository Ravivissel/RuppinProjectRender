using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for projWS
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class projWS : System.Web.Services.WebService {

    public projWS () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod (Description="get a list of all the project ids")]
    public string[] getProjectsList()
    {
        string xmlFilesDir = Server.MapPath(".") + "/XmlFiles";
        string[] xmlList = Directory.GetFiles(xmlFilesDir)
                        .Select(path => Path.GetFileName(path))
                        .ToArray();

        xmlList = xmlList.Where(val => val.Contains("xml")).ToArray();

        return xmlList;
    }

    [WebMethod(Description = "get a list of all the projects")]
    public List<Project> getProjects(List<String> projFilesNames)
    {


        List<Project> projList = new List<Project>();

        foreach (string fname in projFilesNames)
        {
            Project p = new Project();
            string fullPath = Server.MapPath(".") + "/XmlFiles/" + fname;
            projList.Add(p.ReadXML(fullPath));
        }

        return projList;
    }
}
