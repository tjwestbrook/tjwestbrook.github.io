function openPage(pageName, elmnt) {
    var i, tabcontent, tablinks;
    
    // Hide all elements with class="tabcontent" by default */
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
  
    // Remove the background color of all tablinks/buttons
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "black";
    }
  
    // Show the specific tab content
    document.getElementById(pageName).style.display = "block";
}
  
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();