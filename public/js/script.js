$(document).ready(function(){
    $(".buddy").on("swiperight",function(){

      $(this).addClass('rotate-left').delay(700).fadeOut(1);
      $('.buddy').find('.status').remove();
      $(this).append('<div class="status like">PROST!</div>');

      if ( $(this).is(':first-child') ) {
        $('.buddy:last-child').removeClass ('rotate-left rotate-right').fadeIn(300);
        console.log("yo-right");
      } else {
        $(this).prev().removeClass('rotate-left rotate-right').fadeIn(400);
      }
      // Add post request to /statistics here to update like count in db
    });

   $(".buddy").on("swipeleft",function(){
    $(this).addClass('rotate-right').delay(700).fadeOut(1);
    $('.buddy').find('.status').remove();
    $(this).append('<div class="status dislike">WUARG!</div>');

    if ( $(this).is(':first-child') ) {
      $('.buddy:last-child').removeClass ('rotate-left rotate-right').fadeIn(300);
      console.log("yo-left");
    } else {
      $(this).prev().removeClass('rotate-left rotate-right').fadeIn(400);
    }
      // Add post request to /statistics here to update dislike count in db
  });
});
