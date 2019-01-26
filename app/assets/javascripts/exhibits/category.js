$(document).on('turbolinks:load', function() {

  $('.top-category').change(function(){

    $('.sub-category').remove();
    $('.sub-sub-category').remove();

    function subCategory(){
      let html =
        `<div class= "category-wrap sub-category" >
          <select class="select-category sub-category name="item[category]">
            <option value>---</option>
          <i class="fa fa-angle-down category-icon"></i>
        </div>`
      return html;
    }

    function appendOptions(children){
      let html =
                `<option value="${children.id}">${children.name}</option>`
      return html;
    }

    let topCategory = $('.top-category').val();

    $('.category-form').append(subCategory());

    if(topCategory !== ""){
      $.ajax({
        type: 'GET',
        url: '/items/new',
        data: { parent_id: topCategory },
        dataType: 'json'
      })
      .done(function(childrens){
        childrens.forEach(function(children){
          $('.select-category.sub-category').append(appendOptions(children))
        });
      })
      .fail(function() {
        alert('カテゴリー情報取得に失敗しました')
      });
    }else{
      $('.sub-category').remove();
      $('.sub-sub-category').remove();
    }
  });

  $(document).on('change', '.sub-category', function(){

    $('.sub-sub-category').remove();

    function subSubCategory(){
      let html =
        `<div class= "category-wrap sub-sub-category" >
          <select class="select-category sub-sub-category name="item[category]">
            <option value>---</option>
          <i class="fa fa-angle-down category-icon"></i>
        </div>`
      return html;
    }

    function addOptions(children){
      let html =
                `<option value="${children.id}">${children.name}</option>`
      return html;
    }

    let subCategory = $('select.sub-category').val();

    $('.category-form').append(subSubCategory());

    if(subCategory !== ""){
      $.ajax({
        type: 'GET',
        async: false,
        url: '/items/new',
        data: { parent_id: subCategory },
        dataType: 'json'
      })
      .done(function(childrens){
        childrens.forEach(function(children){
          $('select.sub-sub-category').append(addOptions(children))
        });
      })
      .fail(function() {
        alert('カテゴリー情報取得に失敗しました')
      });
    }
  });

  $('.exhibit-button').on('click', function(){
    let categoryId = $('select.sub-sub-category').val();
    $('select.top-category > option:selected').attr('value',categoryId)
  });

});
