$(document).on('turbolinks:load',function(){

  function build_category2(categories) {
    let options = ""
    categories.forEach(function(category) {
      options += `<option value="${category.id}">${category.name}</option>`
    })
    let html = `<select class="select-default" id="category2" name="item[category_ids][]">
                  <option value="---">---</option>
                  ${options}
                </select>`
    $('#add-category2').append(html);
  }

  function build_category3(categories) {
    let options = ""
    categories.forEach(function(category) {
      options += `<option value="${category.id}">${category.name}</option>`
    })
    let html = `<select class="select-default" id="category3" name="item[category_ids][]">
                  <option value="---">---</option>
                  ${options}
                </select>`
    $('#add-category3').append(html);
  }

  function appendBrand(brand) {
    let html = `<div class="js-brand" data-id="${brand.id}">${brand.name}</div>`
    $('#add-brands-list').append(html);
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
    } else {
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
        build_category2(categories2);
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });
    }
  });

  $('#add-category2').on("change", "#category2", function(){
    if ($('#category2').val() == "----" ){
       $('.hidden2').hide();
       $('.hidden3').hide();
       $('.hidden4').hide();
    } else {
      $('.hidden2').show();
      $('#add-category3').empty();
      let category3_parent_id = $(this).val();
      $.ajax({
        url: '/items/new',
        type: 'GET',
        dataType: 'json',
        data: {parent_id: category3_parent_id},
      })
      .done(function(categories3) {
        build_category3(categories3);
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });
    }
  });


  $("#add-category3").on("change", "#category3" ,function(){
    if ($('#category3').val() == "----" ){
       $('.hidden3').hide();
       $('.hidden4').hide();
    } else {
      $('.hidden3').show();
      $('.hidden4').show();
    }
  });

  $('#brand').on('input', function() {
    let input = $('#brand').val();

    $.ajax({
      type: 'GET',
      url: '/items/search_brand',
      dataType: 'json',
      data: { keyword: input }
    })
    .done(function(brands) {
      $('#add-brands-list').empty();
      if (brands.length !== 0) {
        brands.forEach(function(brand) {
          appendBrand(brand);
        });
        $('#add-brands-list').addClass('shadow');
      }
    })
    .fail(function(XMLHttpRequest, textStatus, errorThrown) {
      console.log('failed');
    })
  });

  $('#add-brands-list').on('click', '.js-brand', function(e) {
    let id = $(this).attr('data-id');
    let name = $(this).text();
    console.log(name)
    $('#brand').val(name);
    $('#brand-hidden').val(id);
    $('#add-brands-list').empty().removeClass('shadow');
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

