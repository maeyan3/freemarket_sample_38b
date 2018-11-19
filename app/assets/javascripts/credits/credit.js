$(function(){

    $('#modal-open').on('click', function(){
      $('.modal').fadeIn('slow');
      $('#modal_overlay').fadeIn('slow');
      $('.signup-seqcode').css('overflow', 'hidden');
    });

    $('.modal').on('click', function(){
      $('.modal').fadeOut();
      $('#modal_overlay').fadeOut();
      $('.signup-seqcode').css('overflow', 'auto');
    });

});



$(function() {

    $("#input_credit_number").on('keyup', function() {
      if($("#input_credit_number").val() == "") {
        $(".input_error_message_1").html('必須項目です');
        $(".input_error_message_1").css('color','red');
      } else if(!$("#input_credit_number").val().match(/^\d+$/)) {
        $(".input_error_message_1").html('半角数字で入力してください');
        $(".input_error_message_1").css('color','red');
      } else if($("#input_credit_number").val().match(/^\d+$/)) {
        $(".input_error_message_1").empty();
      }
    })

    $("#input_security_code").on('keyup', function() {
      if($("#input_security_code").val() == "") {
        $(".input_error_message_2").html('必須項目です');
        $(".input_error_message_2").css('color','red');
      } else if(!$("#input_security_code").val().match(/^\d+$/)) {
        $(".input_error_message_2").html('半角数字で入力してください');
        $(".input_error_message_2").css('color','red');
      } else if($("#input_security_code").val().match(/^\d+$/)) {
        $(".input_error_message_2").empty();
      }
    })

});

