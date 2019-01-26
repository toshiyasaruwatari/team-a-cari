$(document).on('turbolinks:load', function() {

  $("form").on('change', 'input[type="file"]', function(e){

    let file = e.target.files[0];
    let reader = new FileReader();

    //画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    reader.onload = function(){

      let img = document.createElement('img');
      img.style.cssText = "width: 11.7rem;"
                          + "height: 11.7rem;"
                          + "object-fit: contain;";
      img.src = reader.result;

      $('.have-item-0').removeClass('have-item-0').addClass('have-item-1');

      $(".sell-upload-items ul").append(appendList())

      function appendList() {
        let html =
        `<li class="sell-upload-item" id="preview" >
            <div class="sell-upload-button">
              <a class="sell-upload-edit">編集</a><a class="sell-upload-delete">削除</a>
            </div>
        </li>`
        return html;
      }

      $("#preview").prepend(img);
    };

    reader.readAsDataURL(file);
  });

  $(document).on("click", ".sell-upload-delete", function(){
    $(".sell-upload-item").remove();
    $('.have-item-1').removeClass('have-item-1').addClass('have-item-0');
  });

});
