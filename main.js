function openProject(pageName, elmnt) {
    var i, tabcontent, tablinks, projects;
    var codeGreen = "rgb(50, 255, 200)"
    
    // Hide/Show elements with class="tabcontent"
    tabcontent = document.getElementsByClassName("tabcontent");
    projects = document.getElementsByClassName("project");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
        projects[i].style.display = "none";
        if (pageName == "0" || i == tabcontent.length - pageName) {
            tabcontent[i].style.display = "block";
            if (i == tabcontent.length - pageName) {
                projects[i].style.display = "block";
            }
        }
    }
  
    // Change background color of tablinks/buttons
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "#000";
        tablinks[i].style.color = codeGreen;
    }

    // Set current tab and element to "open"
    elmnt.style.backgroundColor = codeGreen;
    elmnt.style.color = "#000";
}