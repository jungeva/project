$(function () { // menu 
    $(".header").click(function () {
        $(this).toggleClass("ul>li>.contents").next().toggle();
    });
});



