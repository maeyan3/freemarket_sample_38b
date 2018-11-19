$(function(){

  function build_category2(categories, category_num) {
    // console.log(categories);
    let options = ""
    categories.forEach(function(category) {
      options += `<option value="${category.id}">${category.name}</option>`
    })
    console.log(options)
    let html = `<select class="select-default" id="category${category_num}" name="item[category_ids][]">
                  ${options}
                </select>`
    console.log(html)
    $('#add-category2').append(html);
  }

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
      $('#add-category2').empty();
      let category2_parent_id = $(this).val();

      $.ajax({
        url: '/items/new',
        type: 'GET',
        dataType: 'json',
        data: {parent_id: category2_parent_id},
      })
      .done(function(categories2) {
        build_category2(categories2, 2);
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });

    }
  });

  $("#category2").change(function(){
    if ($('#category2').val() == "----" ){
       $('.hidden2').hide();
       $('.hidden3').hide();
       $('.hidden4').hide();
    } else{
      $('.hidden2').show();
      $('#add-category3').empty();
      let category3_parent_id = $(this).val();
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

