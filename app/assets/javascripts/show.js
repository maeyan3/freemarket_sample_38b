$(function(){
  $("img.owl").hover(function(){
    var src = $(this).attr('src');
    $("img#main_image").attr({src});
    $("img#main_image").hide();
    $("img#main_image").fadeIn(50);
    return false;
  });
});
