/*============================================
RAJASTHAN MAP HOVERING
=============================================*/
function handleOver() {
    var imgFound = document.rajMap.src;
    if (document.images) document.rajMap.src = imgFound.replace("rajasthan.gif", "rajasthanhover.gif");
}

function handleOut() {
    var imgFound = document.rajMap.src;
    if (document.images) document.rajMap.src = imgFound.replace("rajasthanhover.gif", "rajasthan.gif");
}

/*============================================
EXPAND AND COLLAPSE LINK
=============================================*/

function ExpandCollapseLink(I) {
    strDivID = "News" + I;
    var linkHead = document.getElementById(I);
    var linkBody = document.getElementById(strDivID);

    if (linkBody.style.display == "block") {
        linkBody.style.display = "none";
        linkHead.title = "Expand"
    }
    else {
        linkBody.style.display = "block";
        linkHead.title = "Collapse"
    }
}

/*============================================
TYPING ANNOUNCEMENT IN MASTER PAGES
=============================================*/

var text;
var delay = 10;
var currentChar = 1;
var destination;
var textNode = "";

if (document.createTextNode)
    textNode = document.createTextNode("tempNode");

function type() {
    if (document.getElementById) {
        var dest = document.getElementById(destination);
        if (dest) {
            dest.innerHTML = text.substr(0, currentChar);
            currentChar++;

            if (currentChar > text.length) {
                currentChar = 1;
                setTimeout("type()", 5000);
            }
            else {
                setTimeout("type()", delay);
            }
        }
    }
}

function startTyping(delayParam, destinationParam) {
    hf = document.getElementById("ctl00_hfAnnounce");    
    text = hf.value;
    delay = delayParam;
    currentChar = 1;
    destination = destinationParam;
    type();
}

/*============================================
TYPING ANNOUNCEMENT IN PAGES
=============================================*/

var text;
var delay = 10;
var currentChar = 1;
var destination;
var textNode = "";

if (document.createTextNode)
    textNode = document.createTextNode("tempNode");

function type() {
    if (document.getElementById) {
        var dest = document.getElementById(destination);
        if (dest) {
            dest.innerHTML = text.substr(0, currentChar);
            currentChar++;

            if (currentChar > text.length) {
                currentChar = 1;
                setTimeout("type()", 5000);
            }
            else {
                setTimeout("type()", delay);
            }
        }
    }
}

function startType(delayParam, destinationParam) {
    hf = document.getElementById("hfAnnounce");
    text = hf.value;
    delay = delayParam;
    currentChar = 1;
    destination = destinationParam;
    type();
}

/*=======================
TIME SCRIPT
========================*/
var timerID = null;
var timerRunning = false;

function stopclock() {

    if (timerRunning)
        clearTimeout(timerID);
    timerRunning = false;
}

function showtime() {

    var now = new Date();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds()

    var timeValue = "" + ((hours > 12) ? hours - 12 : hours)
    if (timeValue == "0") timeValue = 12;
    timeValue += ((minutes < 10) ? ":0" : ":") + minutes
    timeValue += ((seconds < 10) ? ":0" : ":") + seconds
    timeValue += (hours >= 12) ? " PM" : " AM"

    var x = document.getElementById("lblTime");
    x.innerHTML = timeValue;

    timerID = setTimeout("showtime()", 1000);
    timerRunning = true;
}

function startclock() {

    stopclock();
    showtime();
}

/*============================================
DEPARTMENT MENU - CHANGE CSS DYNAMICALLY
=============================================*/
function menuClicked() {
    hf = document.getElementById("hfMenu");    
    document.getElementById(hf.value).className = "rmLinks";
}

function deptMenuClicked() {
    hf = document.getElementById("ctl00_hfMenu");

    var text = hf.value;
   /*alert(text);*/  

    if (text.indexOf("sideMenu") > -1) {
        document.getElementById('ctl00_' + text).className = "rmLinks";
    }
    else {
        document.getElementById(text).className = "rmLinks";
    }
}

/*====================================================
 SET BACKGROUND COLOR FOR DROPDOWNLIST SELECTED ITEM 
=====================================================*/
function ddlChange(selectElement) {
    ddl = document.getElementById(selectElement);

    for (j = 0; j < ddl.options.length; j++) {
        if (ddl.options[j].selected) {
            ddl.style.backgroundColor = "#E6F4D8";     
        }
        else {
            ddl.options[j].style.backgroundColor = "#FFFFFF";    
        }
    }
}
