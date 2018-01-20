
/* Place carousel.js where the carousel will be located on the page.                */
/* Place carousel_run.js at the bottom of the body on the page with the carousel.   */
var myIndex = 0;
carousel();

function carousel()
{
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, 3000); // Change image every 3 seconds
}
