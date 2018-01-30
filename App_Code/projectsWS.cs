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
public class projectsWS : System.Web.Services.WebService
{

    public projectsWS()
    {
     
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string getProject(string filename)
    {
        projRup.WebServiceSupplier projRup = new projRup.WebServiceSupplier();

        try
        {
            projRup.Project proj = projRup.GetProject(filename);
            JavaScriptSerializer js = new JavaScriptSerializer();
            string projectJSON = js.Serialize(proj);
            return projectJSON;
        }

        catch
        {

            return null;
        }
        
        



    }
    

}
