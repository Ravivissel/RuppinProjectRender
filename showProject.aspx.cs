using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Web.Script.Serialization;

public partial class showProject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        
        if (Request.QueryString == null)
        {

            return;

        }

        NameValueCollection coll = Request.QueryString;
        String projID = coll["XMLName"];
        String priview = coll["priview"];

        // Redirecting to the new website - added by Raviv
        Response.Redirect("renderProject.html?gid=" + projID);

        try
        {
            projRup.WebServiceSupplier rp = new projRup.WebServiceSupplier();
            projRup.Project p = rp.GetProject(projID);
            p.ProjectDetailes.HasPublish = priview;
            if (p.ProjectDetailes.HasPublish != "1")
            {
                throw new Exception("The project Is not published  - Change the project setting to publish");
            }

            showProjectDetails(p);
        }
        catch (Exception ex)
        {
            Response.Write("There was an error in reading the XML: " + ex.Message);
            return;
        }

    }

    public void showProjectDetails(projRup.Project p)
    {
        // set all Tags in List
        List<string> Ptags = new List<string>();
        foreach (var item in p.ProjectDetailes.ProjectTags)
        {
            Ptags.Add(item.TagsName);
        }

        ProjectName.Text = p.ProjectDetailes.ProjectName; // p.name;
        ProjectType.Text = p.ProjectDetailes.ProjectType.ProjTypeDescription;
        Tags.Text = string.Join(", ", Ptags.ToArray());

        Faculty.Text = p.Team.TeamFaculty.FacultyName;
        Year.Text = p.Team.TeamYear.ToString();


        CustomerName.Text = p.Customer.CustomerName;// p.customers[i].name;
        Image img = new Image();
        img.CssClass = "box-content-logo";
        img.ImageUrl = p.Customer.Logo.Replace(" ", string.Empty);
        CustomerLogoImg.Controls.Add(img);
        CustomershortDescription.Text = p.Customer.CustomerDescription;
        CustomerStakeHolders.Text = string.Join(" , ", p.Customer.CustomerStakeholders);
        CustomerUsers.Text = String.Join(", ", p.Customer.CustomerUsers);

        GroupNum.Text = p.ProjectID;

        int countStu = p.Team.TeamMembers.Count();
        Table table0 = new Table();
        table0.ID = "table0";
        if (countStu == 4)
        {
            for (int k = 0; k < 1; k++)
            {
                TableRow row = new TableRow();
                TableRow row1 = new TableRow();
                for (int i = 0; i < countStu; i++)
                {

                    TableCell cell = new TableCell();
                    Label txtValue = new Label();
                    txtValue.Text = p.Team.TeamMembers[i].PersonFirstName + " " + p.Team.TeamMembers[i].PersonLastName + " " + "</br>";
                    cell.Controls.Add(txtValue);
                    Image img1 = new Image();
                    img1.CssClass = "box-content-image";
                    img1.ImageUrl = p.Team.TeamMembers[i].Image.Replace(" ", string.Empty);

                    if (i >= 2)
                    {

                        TableCell cell1 = new TableCell();
                        cell1.Controls.Add(txtValue);
                        cell1.Controls.Add(img1);
                        row1.Controls.Add(cell1);
                        table0.Rows.Add(row1);
                    }
                    else
                    {
                        cell.Controls.Add(img1);
                        row.Cells.Add(cell);
                    }
                }
                table0.Rows.Add(row);
                GroupZone.Controls.Add(table0);
            }
        }
        else
        {
            for (int k = 0; k < 1; k++)
            {
                TableRow row = new TableRow();
                for (int i = 0; i < countStu; i++)
                {

                    TableCell cell = new TableCell();
                    Label txtValue = new Label();
                    txtValue.Text = p.Team.TeamMembers[i].PersonFirstName + " " + p.Team.TeamMembers[i].PersonLastName + " " + "</br>";
                    cell.Controls.Add(txtValue);
                    Image img2 = new Image();
                    img2.CssClass = "box-content-image";

                    img2.ImageUrl = p.Team.TeamMembers[i].Image.Replace(" ", string.Empty);
                    cell.Controls.Add(img2);
                    row.Cells.Add(cell);
                }
                table0.Rows.Add(row);
                GroupZone.Controls.Add(table0);
            }
        }


        Image prologoimg = new Image();
        prologoimg.CssClass = "box-content-logo";
        prologoimg.ImageUrl = p.ProjectDetailes.ProjectLogo;
        ProLogoImg.Controls.Add(prologoimg);

        HyperLink prologoLnk = new HyperLink();
        prologoLnk.Text = " לאתר הפרויקט לחץ כאן. . .";
        prologoLnk.NavigateUrl = p.ProjectDetailes.ProjectSite.Trim();
        ProLandPage.Controls.Add(prologoLnk);


        int search = p.ProjectDetailes.ProjectMovie.IndexOf("youtube");
        if (search == -1)
        {
            HyperLink promovLnk = new HyperLink();
            promovLnk.ImageUrl = "images/movie.jpg";
            promovLnk.NavigateUrl = p.ProjectDetailes.ProjectMovie;
            ProMovLink.Controls.Add(promovLnk);
        }

        else
        {
            Label ShowYouTube1 = new Label();
            ShowYouTube1.Text = "<object width='400' height='300'><param name='movie' value= '" + p.ProjectDetailes.ProjectMovie + "'></param><param name='wmode' value='transparent'></param><embed src='" +
              p.ProjectDetailes.ProjectMovie + "'type='application/x-shockwave-flash' wmode='transparent' width='400' height='300'></embed></object>";
            ProMovLink.Controls.Add(ShowYouTube1);

        }



        int countScreens = p.ScreenShotList.Count();
        Label ScreenSLBL = new Label();
        ScreenSLBL.Text += "<div style='clear:both;height:20px;width:100%'></div>";
        ScreenSLBL.Text += "<div id='hislider2' style='max-width:960px;  max-height:360px; margin: 0 auto;'>";
        ScreenSLBL.Text += "<ul style='display: none;overflow: hidden; height: 0; visibility: hidden; opacity: 0;'>";

        for (int i = 0; i < countScreens; i++)
        {
            ScreenSLBL.Text += "<li>" + "<div>";
            ScreenSLBL.Text += "<img data-src='" + p.ScreenShotList[i].ScreenShotPath + "' data-thumb-src=Screen Shot" + i + " title='" + p.ScreenShotList[i].ScreenShotName
                + "' alt='' data-content-type='image' data-content='' data-interval='-1'/>";
            ScreenSLBL.Text += "<div data-type='effect' data-effect-type='Random'>" + "</div>";
            ScreenSLBL.Text += "</div>" + "</li>";

        }
        ScreenSLBL.Text += "</ul>" + "</div>";
        ScreenshotZone.Controls.Add(ScreenSLBL);


        List<string> adv = new List<string>() { p.ProjectDetailes.ProjectLectureA.PersonFirstName + " " + p.ProjectDetailes.ProjectLectureA.PersonLastName,
        p.ProjectDetailes.ProjectLectureB.PersonFirstName + " " + p.ProjectDetailes.ProjectLectureB.PersonLastName};
        advisores.Text = String.Join(", ", adv);
        ProShortDes.Text = p.ProjectDetailes.ProjectDescription;

        int countGoal = p.ProjectDetailes.ProjectGoals.Count();
        BulletedList bl = new BulletedList();
        bl.CssClass = "list1";
        for (int i = 0; i < countGoal; i++)
        {
            ListItem li = new ListItem();
            li.Text = p.ProjectDetailes.ProjectGoals[i].GoalsDetails + ": " + p.ProjectDetailes.ProjectGoals[i].GoalsStatus;
            bl.Items.Add(li);
        }
        GoalsZone.Controls.Add(bl);

        int countModu = p.ProjectModule.Count();
        BulletedList mo = new BulletedList();
        mo.CssClass = "list1";
        for (int i = 0; i < countModu; i++)
        {
            ListItem li = new ListItem();
            //int feach = p.ProjectModule[i].ModuleName.Count();
            //string str = null;
            //if (feach > 0)
            //{
            //    for (int j = 0; j < feach; j++)
            //    {
            //        str = str + (j + 1) + ". " + p.modules[i].features[j] + ". ";

            //    }
            //}
            li.Text = "שם המודול: " + p.ProjectModule[i].ModuleName + ". תיאור המודול: " + p.ProjectModule[i].ModuleDescription;
            mo.Items.Add(li);
        }
        ModulesZone.Controls.Add(mo);

        List<string> tech = new List<string>();
        foreach (var item in p.ProjectTechnolgies)
        {
            tech.Add(item.TechnologyName);
        }


        technologies.Text = string.Join(", ", tech);
        chalenges.Text = p.ProjectDetailes.ProjectCallenges;
        personalNotes.Text = p.ProjectDetailes.ProjectComments;
        string r = "לא נמצאו הערות בדף זה";
        if (personalNotes.Text == "")
        {
            personalNotes.Text = r;

        }


    }


}


