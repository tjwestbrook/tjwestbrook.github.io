function openProject(pgNbr, elmnt) {
    var tablink = document.getElementsByClassName("tablink");
    var tabcontent = document.getElementsByClassName("tabcontent");
    var project = document.getElementsByClassName("project");
    var pN = tabcontent.length - pgNbr;
    var bgColor = "rgba(255, 255, 255, 0.5)";

    // Hide/Show elements .tabcontent class
    for (var i = 0; i < tabcontent.length; i++) {
        project[i].style.display = "none"
        if (pgNbr == 0 || i == pN) {
            tabcontent[i].style.display = "block"
            if (i == pN) { project[i].style.display = "block" }
        } else { tabcontent[i].style.display = "none" }
    }
  
    for (var i = 0; i < tablink.length; i++) {
        if (pgNbr == 0 || pgNbr != 0 && i == pN + 1) {
            // Set current tab to valid color
            tablink[i].style.backgroundColor = bgColor;
        } else {
             // Change color of null tabs
             tablink[i].style.backgroundColor = "rgba(255, 255, 255, 0.1)";
        }
    }
}