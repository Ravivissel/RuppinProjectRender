isOn = 0;

function getId(url) {
    var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
    var match = url.match(regExp);

    if (match && match[2].length == 11) {
        return match[2];
    } else {
        return 'error';
    }
}



function getProjectCB(result) {
    projects = JSON.parse(result.d);
    proj = projects[0];
    // Riki, in this point in the code you get in object proj all the fields you need.
    initPage(proj);


}


function errorCB(e) {
    alert("I caught the exception :  The exception message is : " + e.responseText);
}


function initPage(project) {

    fillAboutTheProject(project);
    fillMoreAboutTheProject(project);
    fillCustomers(project);
    fillAboutUs(project);

}

function fillAboutTheProject(project) {
    document.getElementById('projTitle').innerHTML = project.name;
    var videoId = "https://www.youtube.com/embed/" + getId(project.movie);
    document.getElementById('movie').src = videoId;
    document.getElementById('projName').innerHTML = project.name;
    document.getElementById('projType').innerHTML = project.type;
    document.getElementById('projTags').innerHTML = getTags(project);
    document.getElementById('shortDescription').innerHTML = project.shortDescription;
    document.getElementById('projLogo').src = project.projectImageUrl;
    document.getElementById('projLandingPage').href = project.projectLandingPage;

    function getTags(project) {
        tags = project.tags;
        var str = "";
        for (var i = 0; i < proj.tags.length; i++) {
            str += "<span><a href=''> " + tags[i] + "</a></span>";
        }
        return str;
    }


}
function fillMoreAboutTheProject(project) {
    document.getElementById('projGoals').innerHTML = getGoals(project);
    document.getElementById('projAdvisors').innerHTML = getAdvisors(project);
    document.getElementById('projModules').innerHTML = getModules(project);
    document.getElementById('projTechnologies').innerHTML = getTechnologies(project);
    document.getElementById('projChallenges').innerHTML = project.challenges;
    document.getElementById('projNotes').innerHTML = project.personalNote;

    fillScreenshots(project);

    function getGoals(project) {
        var str = "";
        for (var i = 0; i < project.goals.length; i++) {
            str += "<li> <span class='headers'>" + project.goals[i].description + ": </span><span>" + project.goals[i].status + ".</span></li>";
        }
        return str;
    }

    function getAdvisors(project) {
        var str = "";
        for (var i = 0; i < project.advisors.length; i++) {

            if (i < project.advisors.length - 1) str += "<span>" + project.advisors[i] + ", </span >";
            else str += "<span>" + project.advisors[i] + ".</span >";
        }
        return str;
    }

    function getModules(project) {
        var str = "";

        for (var i = 0; i < project.modules.length; i++) {
            str += "<li><span class='headers'>" + project.modules[i].name + ": </span><span>" + project.modules[i].description + ".</span></li>"

        }
        return str;

    }

    function getTechnologies(project) {
        var str = "";
        for (var i = 0; i < project.technologies.length; i++) {
            if (i < project.technologies.length - 1) str += "<span>" + project.technologies[i] + ", </span >";
            else str += "<span>" + project.technologies[i] + ".</span >";
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
            for (var i = 0; i < project.screenshots.length; i++) {
                str += "<li><img class='slideShowImages' src='" + project.screenshots[i].imageUrl + "'alt='" + project.screenshots[i].description + "'/></li>";
            }
            return str;

        }
    }

}
function fillAboutUs(project) {
    document.getElementById("projNum").innerHTML = project.groupCode;
    document.getElementById("projFaculty").innerHTML = project.faculty;
    document.getElementById("projYear").innerHTML = project.year;
    document.getElementById("studentsDiv").innerHTML = getStudents(project);


    function getStudents(project) {
        str = "";
        students = project.students;
        for (var i = 0; i < students.length; i++) {
            var size = 12 / students.length;

            str += "<div class='col-sm-" + size + " col-xs-6'><p class='projNames'>" + students[i].name + "</p><a href='#'><img class=' img-circles img-responsive portfolio-item ' src=" + students[i].imageUrl + " alt=''></a></div>";
        }
        return str;

    }

}
function fillCustomers(project) {
    initCustomerArea()
    for (var i = 0; i < project.customers.length; i++) {
        document.getElementById('projCustomerName' + i).innerHTML = project.customers[i].name;
        document.getElementById('projCustomerShortDescription' + i).innerHTML = project.customers[i].shortDescription;
        document.getElementById('projStakeholders' + i).innerHTML = getStakeholders(project, i);
        document.getElementById('projUsers' + i).innerHTML = getUsers(project, i);
        document.getElementById("projCustomerImage" + i).src = project.customers[i].logoUrl;
    }



    function initCustomerArea() {
        var str = "";
        for (var i = 0; i < project.customers.length; i++) {
            str = "<li><span class='headers'> שם:</span> <span id='projCustomerName" + i + "'></span></li ><li><span class='headers'>תיאור קצר:</span> <span id='projCustomerShortDescription" + i + "'></span></li><li><span class='headers'>בעלי עניין:</span> <span id='projStakeholders" + i + "'> </span></li><li><span class='headers'>משתמשי המערכת:</span> <span id='projUsers" + i + "'></span></li>"
            str += "<a id='projCustomerLink'" + i + " href='http://www.linkedin.com'><img id='projCustomerImage" + i + "' class='img-responsive portfolio-item customerPhoto img-circles' src='' alt='' ></a>"
        }
        document.getElementById("projCustomers").innerHTML = str;
    }

    function getStakeholders(project, index) {
        var str = '';
        var currentInterestParties = project.customers[index].interstedParties;
        for (var i = 0; i < currentInterestParties.length; i++) {


            if (i < currentInterestParties.length - 1) str += "<span>" + currentInterestParties[i] + ", </span >";
            else str += "<span>" + currentInterestParties[i] + ".</span >";
        }
        return str;
    }
    function getUsers(project, index) {
        var str = '';
        var currentUsers = project.customers[index].users;
        for (var i = 0; i < currentUsers.length; i++) {

            if (i < currentUsers.length - 1) str += "<span>" + currentUsers[i] + ", </span >";
            else str += "<span>" + currentUsers[i] + ".</span >";
        }
        return str;
    }

}

$(document).ready(function () {

    
    $("#moreDetailsContainer").hide();

    $("#button").click(function () {

        if (isOn == 1)
            {
        $("#moreDetailsContainer").slideUp("slow", function () {
            isOn = 0;
            $("#button").text("עוד פרטים");
            });
        }
        else {
            $("#moreDetailsContainer").slideDown("slow", function () {
                $("#button").text("פחות פרטים");
                isOn = 1;
            });}
    });





})
