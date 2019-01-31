$(document).on('turbolinks:load', function() {

  let imgNum = 0

  $("form").on('change', 'input[type="file"]', function(e){

    let file = e.target.files[0];
    let reader = new FileReader();

    reader.onload = function(){

      function appendListHTML(num) {
        let html =
                  `<li class="sell-upload-item">
                      <img alt="" class="preview-image image${num}">
                      <div class="sell-upload-item__button">
                        <a class="sell-upload-edit">編集</a><a class="sell-upload-delete">削除</a>
                      </div>
                  </li>`
        return html;
      }

      let imgSrc = reader.result;

      $(".sell-upload-items ul").append(appendListHTML(imgNum))
      $(".image" + imgNum).attr("src", imgSrc)

      $(".upload__drop-box").addClass("hidden");

      imgNum += 1

      function buildLabelHTML(num) {
        let html =
                  `<label class="upload__drop-box have-item-${num}">
                      <pre class="drop-text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード</pre>
                      <input type="file" class="hidden" name="item[item_images_attributes][${num}][image]">
                  </label>`
        return html;
      }

      $(".upload__drop.clearfix").append(buildLabelHTML(imgNum));

    };

    reader.readAsDataURL(file);
  });

  $(document).on("click", ".sell-upload-delete", function(){

    $(this).parent().parent().remove();

  });

});
