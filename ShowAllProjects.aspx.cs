using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class ShowAllProjects : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("http://proj.ruppin.ac.il");
        buildPage();

    }
    private string buildLi(Project p)
    {

        string liString;
        liString = "<li>";
        liString += "<h3>" + p.name + "</h3>";
        liString += "<span>" + p.projectImageUrl + "</span>";
      
        if (p.shortDescription.Length <= 300)
        {
            liString += "<p>" + p.shortDescription + "<br/>";
        }
        else
        {
            
            string tmpString = p.shortDescription;
            tmpString = tmpString.Remove(201);
            tmpString += "...";
            liString += "<p>" + tmpString + "<br/>";
        }
   
         liString += "<a href='#' id='"+p.groupCode+"'  onclick='btn_Click(this.id)' class='readmoremain'>לפרויקט המלא</a> </p>";
         if (p.projectImageUrl == "")
         {
             p.projectImageUrl = "images/default.jpg";
        
         }
         else
         {
             liString += "<img src='" + p.projectImageUrl + "' alt='' />";
             liString += "</li>";
         }
        return liString;

    }


    public void buildPage()
    {

            Project p = new Project();

            string xmlFilesDir = Server.MapPath(".") + "/XmlFiles";
            string[] xmlList = Directory.GetFiles(xmlFilesDir)
                            .Select(path => Path.GetFileName(path))
                            .ToArray();
            List<Project> projectList = new List<Project>();
            foreach (string xmlFname in xmlList)
            {
                string xmlFullName = Server.MapPath(".") + "/XmlFiles/" + xmlFname;

                try
                {
                    p = p.ReadXML(xmlFullName);
                    projectList.Add(p);


                }
                catch (Exception ex)
                {
                    Response.Write("There was an error in reading the XML: " + ex.Message);
                    return;
                }

            }

            slideshow.InnerHtml = null;
            string str = " ";

        foreach (Project proj in projectList)
        {
            if (proj.faculty.Equals(FacultyDL.SelectedValue))
            {
                String filter = searchTB.Text;
                if (filter.Length == 0)
                {
                    str += buildLi(proj);
                }
  

                else if (proj.name.Contains(filter))  
                {
                    str += buildLi(proj);
                }           
                
                else
                {
                    foreach (Student s in proj.students)
                    {
                        if (s.name.Contains(filter))
                        {
                            str += buildLi(proj);
                            break;
                        }
                    }

                    foreach (Customer c in proj.customers)
                    {
                        if (c.name.Contains(filter))
                        {
                            str += buildLi(proj);
                            break;
                        }
                        else
                        {
                            foreach (String tag in proj.tags)
                            {
                                if (tag.Contains(filter))
                                {
                                    str += buildLi(proj);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            else if ((FacultyDL.SelectedValue == "בחר"))
            {
                String filter = searchTB.Text;
                if (filter.Length == 0)
                {
                  str += buildLi(proj);
                }
                else if (proj.name.Contains(filter))
                {
                    str += buildLi(proj);
                }
                else
                {
                    foreach (Student s in proj.students)
                    {
                        if (s.name.Contains(filter))
                        {
                            str += buildLi(proj);
                            break;
                        }
                    }
                    foreach (Customer c in proj.customers)
                    {
                        if (c.name.Contains(filter))
                        {
                            str += buildLi(proj);
                            break;
                        }
                        else
                        {
                            foreach (String tag in proj.tags)
                            {
                                if (tag.Contains(filter))
                                {
                                    str += buildLi(proj);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            
        }
        
        slideshow.InnerHtml = slideshow.InnerHtml + str;
    }



    protected void FacultyDL_SelectedIndexChanged(object sender, EventArgs e)
    {
       FacultyDL.Controls.Clear();

    }
    protected void searchTB_TextChanged(object sender, EventArgs e)
    {
        searchTB.Controls.Clear();

    }

    
}


