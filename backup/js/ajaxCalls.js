projPath = "http://proj.ruppin.ac.il/igroup13/projects/showProject.aspx?XMLName=";


function getFileNames() {
    //$loading.show();

    var request = {
    }
    getProjectsList(request, getFileNamesCB, errorCB);
}

function getAllProjects() {
    getProjects(projFilesNames, getAllProjectsCB, errorCB);
}

//-----------------------------------------------------------------------------
// A Method for presenting the results, called on success
//-----------------------------------------------------------------------------
function getFileNamesCB(resutls) {
    projFilesNames = $.parseJSON(resutls.d)
    getAllProjects();
}

function getAllProjectsCB(resutls) {

    projects = $.parseJSON(resutls.d);
    // at this point you have all the data returning from the server in an array of objects
    // called projects
    renderProjects()
}

//-----------------------------------------------------------------------------
// A Method for presenting the error, called on error
//-----------------------------------------------------------------------------
function errorCB(e) {
    alert("I caught the exception :  The exception message is : " + e.responseText);
}

//-----------------------------------------------------------------------
// Call an ajax function on the server
//-----------------------------------------------------------------------
function getProjectsList(request, successCB, errorCB) {

    // serialize the object to JSON string
    var dataString = JSON.stringify(request);

    $.ajax({ // ajax call starts
        url: 'projectsWS.asmx/getProjectsList',       // server side web service method
        data: dataString,                          // the parameters sent to the server
        type: 'POST',                              // can be also GET
        dataType: 'json',                          // expecting JSON datatype from the server
        contentType: 'application/json; charset = utf-8', // sent to the server
        success: successCB,                // data.d id the Variable data contains the data we get from serverside
        error: errorCB
    }) // end of ajax call
}


function getProjects(request, successCB, errorCB) {

    // serialize the object to JSON string
    var dataString = JSON.stringify({ projFilesNames: request });

    $.ajax({ // ajax call starts
        url: 'projectsWS.asmx/getProjects',       // server side web service method
        data: dataString,                          // the parameters sent to the server
        type: 'POST',                              // can be also GET
        dataType: 'json',                          // expecting JSON datatype from the server
        contentType: 'application/json; charset = utf-8', // sent to the server
        success: successCB,                // data.d id the Variable data contains the data we get from serverside
        error: errorCB
    }) // end of ajax call
}