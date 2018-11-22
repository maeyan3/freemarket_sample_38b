$(document).on('turbolinks:load', function() {
  /*初期表示*/
  $('.ChangeElem_Panel').eq(0).show();
  $('.mypage-item-list.todo-content').hide();
  $('.ChangeElem_Btn').eq(0).addClass('is-active');
  /*クリックイベント*/
  $ (function () {
    $('.ChangeElem_Btn').on('click', function () {
      var index1 = $('.ChangeElem_Btn').index(this);
      $('.ChangeElem_Btn').removeClass('is-active');
      $(this).addClass('is-active');
      $('.mypage-item-list').hide();
      $('.mypage-item-list').eq(index1).show();
    });
  });
});

$(function () {
  /*初期表示*/
  $('.ChangeElem_Panel').eq(0).show();
  $('.mypage-item-list-two.old').hide();
  $('.ChangeElem_Btn_two').eq(0).addClass('is-active');
  /*クリックイベント*/
  $ (function () {
    $('.ChangeElem_Btn_two').on('click', function () {
      var index2 = $('.ChangeElem_Btn_two').index(this);
      $('.ChangeElem_Btn_two').removeClass('is-active');
      $(this).addClass('is-active');
      $('.mypage-item-list-two').hide();
      $('.mypage-item-list-two').eq(index2).show();
    });
  });
});
