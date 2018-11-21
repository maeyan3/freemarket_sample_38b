$(function () {
  $(".accordion-parent .accordion-toggle").click(function () {
    $(this).next("ul").slideToggle(400);
    $(this).toggleClass("open");
  });



  $('.input-default_point').click(function() {
    $('input[name=consume_point_radio]').val(['partial']);
  });

  $('.input-default_point').on('keyup', function(){
    var input_point = $('.input-default_point').val();
    var total_price = Math.floor(499 - input_point );
    if (!isNaN(input_point)){
    $('.total_price').html(total_price);
    }else{
      alert("半角数字で入力してください");
    }
  });



});
