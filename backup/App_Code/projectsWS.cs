﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.IO;

/// <summary>
/// Summary description for projectsWS
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class projectsWS : System.Web.Services.WebService {

    public projectsWS () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string getProjectsList()
    {
        string xmlFilesDir = Server.MapPath(".") + "/XmlFiles";
        string[] xmlList = Directory.GetFiles(xmlFilesDir)
                        .Select(path => Path.GetFileName(path))
                        .ToArray();

        xmlList = xmlList.Where(val => val.Contains("xml")).ToArray();


        // create a json serializer objetct
        JavaScriptSerializer js = new JavaScriptSerializer();
        // serialize to string
        string jsonString = js.Serialize(xmlList);
        return jsonString;
    }

     [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string getProjects(List<String> projFilesNames)
    {
        

         List<Project> projList = new List<Project>();

         foreach (string fname in projFilesNames)
         {
             Project p = new Project();
             string fullPath = Server.MapPath(".") + "/XmlFiles/" + fname;
             projList.Add(p.ReadXML(fullPath));
         }

        JavaScriptSerializer js = new JavaScriptSerializer();
        // serialize to string
        string jsonString = js.Serialize(projList);
        return jsonString;
     }
    
 


    

}
