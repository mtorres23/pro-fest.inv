// Initialize Bootstrap's Carousel, set timeout for click and to set visibility to visible

$(document).ready(function(){
    $('.carousel').carousel();
 
    setTimeout(function(){$(".carousel").click()}, 1);
    setTimeout(function(){$(".carousel-item").css({'visibility': 'visible'})}, 100);
});