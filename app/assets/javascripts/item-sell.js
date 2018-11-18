$(function(){


  $(function() {
    $('.hidden1').css("display", "none");
    $('.hidden2').css("display", "none");
    $('.hidden3').css("display", "none");
    $('.hidden4').css("display", "none");
    $('.hidden5').css("display", "none");
  });



  $("#category").change(function(){
    if ($('#category').val() == "----" ){
       $('.hidden1').hide();
       $('.hidden2').hide();
       $('.hidden3').hide();
       $('.hidden4').hide();
    } else{
      $('.hidden1').show();
    }
  });

  $("#category2").change(function(){
    if ($('#category2').val() == "----" ){
       $('.hidden2').hide();
       $('.hidden3').hide();
       $('.hidden4').hide();
    } else{
      $('.hidden2').show();
    }
  });

  $("#category3").change(function(){
    if ($('#category3').val() == "----" ){
       $('.hidden3').hide();
       $('.hidden4').hide();
    } else{
      $('.hidden3').show();
      $('.hidden4').show();
    }
  });

  $("#cost").change(function(){
    if ($('#cost').val() == "----" ){
       $('.hidden5').hide();
    } else{
      $('.hidden5').show();
    }
  });





  $('#amount').on('keyup', function(){
    var amount = $('#amount').val();
    var commission = Math.floor(amount * 0.1);
    var profit = (amount - commission);
    if (!isNaN(amount)){
    $('#commission').html("¥" + commission);
    $('#sales-profit').html("¥" + profit);
    }else{
      alert("半角数字で入力してください");
    }
  });


});

