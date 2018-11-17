
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

