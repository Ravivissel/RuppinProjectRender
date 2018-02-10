isOn = 0;


function init() {
    groupid = getParameterByName('gid');
    var request = {
        filename: groupid


    }
    getProject(request, getProjectCB, errorCB);
}

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}



function getId(url) {
    var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
    var match = url.match(regExp);

    if (match && match[2].length === 11) {
        return match[2];
    } else {
        return 'error';
    }
}

function getProjectCB(result) {
    var proj = JSON.parse(result.d);
    initPage(proj)




}

function errorCB(e) {
    alert("I caught the exception :  The exception message is : " + e.responseText);
}

function initPage(project) {


    try {
        fillAboutTheProject(project);
        fillMoreAboutTheProject(project);
        fillCustomers(project);
        fillAboutUs(project);

        $(document).ready(function () {
            
            $("#renderPage").fadeIn();
            $("#loader").fadeOut();
        });
    }
    catch (err) {
        //TODO: make a error page
        $("#loader").fadeOut();
    }
    //fillSeeMoreLikeThis();

}

function fillAboutTheProject(project) {
    document.getElementById('projTitle').innerHTML = project.ProjectDetailes.ProjectName;
    var videoId = "https://www.youtube.com/embed/" + getId(project.ProjectDetailes.ProjectMovie);
    document.getElementById('movie').src = videoId;
    document.getElementById('projName').innerHTML = project.ProjectDetailes.ProjectName;
    document.getElementById('projType').innerHTML = project.ProjectDetailes.ProjectType.ProjTypeDescription;
    document.getElementById('projTags').innerHTML = getTags(project);
    document.getElementById('shortDescription').innerHTML = project.ProjectDetailes.ProjectDescription;
    document.getElementById('projLogo').src = project.ProjectDetailes.ProjectLogo;
    document.getElementById('projLandingPage').href = project.ProjectDetailes.ProjectSite;

    function getTags(project) {
        var tags = project.ProjectDetailes.ProjectTags;
        var str = "";
        for (var i = 0; i < tags.length; i++) {
            str += "<span>" + tags[i].TagsName + " </span>";
        }
        return str;
    }


}

function fillMoreAboutTheProject(project) {
    document.getElementById('projGoals').innerHTML = getGoals(project);
    document.getElementById('projAdvisors').innerHTML = getAdvisors(project);
    document.getElementById('projModules').innerHTML = getModules(project);
    document.getElementById('projTechnologies').innerHTML = getTechnologies(project);
    document.getElementById('projChallenges').innerHTML = project.ProjectDetailes.ProjectCallenges;
    document.getElementById('projNotes').innerHTML = project.ProjectDetailes.ProjectComments;

    fillScreenshots(project);

    function getGoals(project) {
        var str = "";
        var projectGoals = project.ProjectDetailes.ProjectGoals;

        for (var i = 0; i < projectGoals.length; i++) {
            str += "<li> <span class='headers'>" + projectGoals[i].GoalsDetails + ": </span><span>" + projectGoals[i].GoalsStatus + ".</span></li>";
        }
        return str;
    }
    function getAdvisors(project) {
        var str = "";
        var LectureA = project.ProjectDetailes.ProjectLectureA;
        var LectureB = project.ProjectDetailes.ProjectLectureB;

        if (LectureA.PersonFirstName !== "")
            str += "<span>" + LectureA.PersonFirstName + " " + LectureA.PersonLastName + "</span >";
        if (LectureB.PersonFirstName !== "")
            str += "<span>, " + LectureB.PersonFirstName + " " + LectureB.PersonLastName + "</span >";

        return str;
    }
    function getModules(project) {
        var str = "";
        var projectModlues = project.ProjectModule;


        for (var i = 0; i < projectModlues.length; i++) {
            str += "<li><span class='headers'>" + projectModlues[i].ModuleName + ": </span><span>" + projectModlues[i].ModuleDescription + ".</span></li>"

        }
        return str;

    }
    function getTechnologies(project) {
        var str = "";
        let projectTechnologies = project.ProjectTechnolgies;

        for (var i = 0; i < projectTechnologies.length; i++) {
            if (i < projectTechnologies.length - 1) str += "<span>" + projectTechnologies[i].TechnologyName + ", </span >";
            else str += "<span>" + projectTechnologies[i].TechnologyName + ".</span >";
        }
        return str;
    }

    function fillScreenshots(project) {
        document.getElementById('projScreenshots').innerHTML = getScreenshots(project);
        $(document).ready(function () {
            $('.pgwSlider').pgwSlider();
        });


        function getScreenshots(project) {
            var str = "";
            var screenshots = project.ScreenShotList;



            for (var i = 0; i < screenshots.length; i++) {
                var screenShotPath;
                if (screenshots[i].ScreenShotPath)
                    screenShotPath = screenshots[i].ScreenShotPath;
                else
                    screenShotPath = "images/imageNotFound.png";

                str += "<li><img class='slideShowImages' src='" + screenShotPath + "'alt='" + screenshots[i].ScreenShotName + "'/></li>";
            }
            return str;

        }
    }

}

function fillAboutUs(project) {
    document.getElementById("projNum").innerHTML = project.ProjectID;

    var facultyName;
    switch (project.Team.TeamFaculty.FacultyName) {


        case "IE": facultyName = "הנדסת תעשייה וניהול"
            break;
        case "BA": facultyName = "מנהל עסקים"
            break;
        default: facultyName = project.Team.TeamFaculty.FacultyName;
    }


    document.getElementById("projFaculty").innerHTML = facultyName;
    document.getElementById("projYear").innerHTML = project.Team.TeamYear;
    document.getElementById("studentsDiv").innerHTML = getStudents(project.Team);


    function getStudents(team) {
        str = "";
        var students = team.TeamMembers;
        project.Team.TeamMembers[0].PersonFirstName

        for (var i = 0; i < students.length; i++) {
            var size = 12 / students.length;

            str += "<div class='col-sm-" + size + " col-xs-6'><p class='projNames'>" + students[i].PersonFirstName + " " + students[i].PersonLastName + "</p><img class=' img-circles img-responsive portfolio-item ' src=" + students[i].Image + " alt=''></div>";
        }
        return str;

    }

}

function fillCustomers(project) {
    initCustomerArea(project)
    var customer = project.Customer;
    var customerLogo;

    document.getElementById('projCustomerName').innerHTML = customer.CustomerName;
    document.getElementById('projCustomerShortDescription').innerHTML = customer.CustomerDescription;
    document.getElementById('projStakeholders').innerHTML = getStakeholders(customer);
    document.getElementById('projUsers').innerHTML = getUsers(customer);
    if (customer.Logo)
        customerLogo = customer.Logo
    else
        customerLogo = "images/default.jpg";
    document.getElementById("projCustomerImage").src = customerLogo;






    function initCustomerArea(project) {
        var projCustomer = project.Customer;

        var str = "";
        str = "<li><span class='headers'> שם:</span> <span id='projCustomerName" + "'></span></li ><li><span class='headers'>תיאור קצר:</span> <span id='projCustomerShortDescription" + "'></span></li><li><span class='headers'>בעלי עניין:</span> <span id='projStakeholders" + "'> </span></li><li><span class='headers'>משתמשי המערכת:</span> <span id='projUsers" + "'></span></li>"
        str += "<img id='projCustomerImage" + "' class='img-responsive portfolio-item customerPhoto img-circles' src='' alt='' >"

        document.getElementById("projCustomers").innerHTML = str;
    }

    function getStakeholders(customer) {
        var str = '';
        var steckholders = customer.CustomerStakeholders;

        for (var i = 0; i < steckholders.length; i++) {

            if (i < steckholders.length - 1) str += "<span>" + steckholders[i] + ", </span >";
            else str += "<span>" + steckholders[i] + ".</span >";
        }
        return str;
    }
    function getUsers(customer) {
        var str = '';
        var users = customer.CustomerUsers;

        for (var i = 0; i < users.length; i++) {

            if (i < users.length - 1) str += "<span>" + users[i] + ", </span >";
            else str += "<span>" + users[i] + ".</span >";
        }
        return str;
    }

}

$(window).load(function () {


    $("#moreDetailsContainer").hide();

    $("#button").click(function () {

        if (isOn === 1) {
            $("#moreDetailsContainer").slideUp("slow", function () {
                isOn = 0;
                $("#button").text("עוד פרטים");
            });
        }
        else {
            $("#moreDetailsContainer").slideDown("slow", function () {
                $("#button").text("פחות פרטים");
                isOn = 1;
            });
        }
    });



})

function fillSeeMoreLikeThis() {

    const requiredNumberOfLogos = 1;


    let projFilesNames = [];
    getProjectsNames(function (result) {

        let allProjectsNames = JSON.parse(result.d);


        for (let numberOfLogo = 0; numberOfLogo < requiredNumberOfLogos; numberOfLogo++) {

            let projectId = getRandomProjectFromList(allProjectsNames);
            //projectId += ".xml"
            projFilesNames.push(projectId);



            getProject(projFilesNames, function (results) {

                let projectsObjectsArray = JSON.parse(results.d);
                let str = "";
                str += "<a href='renderProject.html?gid=" + projectsObjectsArray[0].ProjectID + "'>";
                str += "<img class='img-responsive portfolio-item' src='" + projectsObjectsArray[0].ProjectDetailes.ProjectLogo + "' alt=''/>";
                str += "   </a>";




            }, function (err) {

                console.log(err);
            });


        }

        document.getElementById('relatedProjects').innerHTML = str;

        //relatedProjects
        //  <a href='renderProject.html?gid=bgroup14'>
        //    <img class='img-responsive portfolio-item' src='http://proj.ruppin.ac.il/bgroup14/prod/tar6/pic/logo_black.png' alt=''>
        //          </a>


        function getRandomProjectFromList(allProjectsNames) {


            let projectsIdsArray = Object.keys(allProjectsNames);
            let randomProjectKey = Math.floor(Math.random() * projectsIdsArray.length);

            return projectsIdsArray[randomProjectKey];


        }



    }, function (err) { console.log(err) });



}
