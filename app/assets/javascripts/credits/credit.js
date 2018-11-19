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


