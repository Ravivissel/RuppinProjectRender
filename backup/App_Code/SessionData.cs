using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SessionData
/// </summary>
public class SessionData
{
	public SessionData()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private static Project uploadProject;


    public static void setProject(Project pr)
    {
        uploadProject = pr;
    }

    public static Project getProject()
    {
        return uploadProject;
    }
}
