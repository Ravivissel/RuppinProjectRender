﻿function init() {
    groupid = getParameterByName('gid');
    //projFilesNames = ["bgroup1.xml"];
    projFilesNames = new Array();
    projFilesNames[0] = groupid + ".xml";
    getProjects(projFilesNames, getProjectCB, errorCB);
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