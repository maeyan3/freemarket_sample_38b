$(function () {
  $(".accordion-parent .accordion-toggle").click(function () {
    $(this).next("ul").slideToggle(400);
    $(this).toggleClass("open");
  });





// 所持ポイントは500P、商品の値段は499円で仮置き


  $('#radio_button1').click(function() {

    $('.total_price').empty();
    var credit_pay = 499
    if ($('#radio_button1').val() == 'none'){
      $('.total_price').html(credit_pay);
    }

  });



  $('#radio_button2').click(function() {

    $('.total_price').empty();
    var point_pay = Math.floor(499 - 499);
    if ($('#radio_button2').val() == 'all'){
      $('.total_price').html(point_pay);
    }else{
      $('.total_price').html(499);
    }

  });



  $('.input-default_point').click(function() {
    $('input[name=consume_point_radio]').val(['partial']);
  });


  $('.input-default_point').on('keyup', function(){

    $('.total_price').empty();
    var input_point = $('.input-default_point').val();
    var total_price = Math.floor(499 - input_point );
    if (!isNaN(input_point)){
      $('.total_price').html(total_price);
    }else{
      alert("半角数字で入力してください");
    }

  });


});
