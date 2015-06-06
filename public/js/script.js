$(document).ready(function(){
    $(".beer").on("swiperight",function(){

      $(this).addClass('rotate-left').delay(700).fadeOut(1);
      $('.beer').find('.status').remove();
      $(this).append('<div class="status like">PROST!</div>');

      if ( $(this).is(':first-child') ) {
        $('.beer:last-child').removeClass ('rotate-left rotate-right').fadeIn(300);
        console.log("yo-right");
      } else {
        $(this).prev().removeClass('rotate-left rotate-right').fadeIn(400);
      }
      $.post( "/statistics", { name: $(this).attr('id'), action: "like"} );
    });

   $(".beer").on("swipeleft",function(){
    $(this).addClass('rotate-right').delay(700).fadeOut(1);
    $('.beer').find('.status').remove();
    $(this).append('<div class="status dislike">WUARG!</div>');

    if ( $(this).is(':first-child') ) {
      $('.beer:last-child').removeClass ('rotate-left rotate-right').fadeIn(300);
      console.log("yo-left");
    } else {
      $(this).prev().removeClass('rotate-left rotate-right').fadeIn(400);
    }
      $.post( "/statistics", { name: $(this).attr('id'), action: "dislike"} );
  });
});
