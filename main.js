function openProject(pageName, elmnt) {
    var i, tabcontent, tablinks;
    var codeGreen = "rgb(50, 255, 200)"
    
    // Hide/Show elements with class="tabcontent"
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        if (pageName == "0" || i == tabcontent.length - pageName) {
        tabcontent[i].style.display = "block";
        } else {
            tabcontent[i].style.display = "none";
        }
    }
  
    // Change background color of tablinks/buttons
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "#000";
        tablinks[i].style.color = "rgb(50, 255, 200)";
    }

    // Set current tab and element to "open"
    elmnt.style.backgroundColor = "rgb(50, 255, 200)";
    elmnt.style.color = "#000";
}