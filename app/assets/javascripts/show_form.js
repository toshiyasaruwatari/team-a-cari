$(document).on('turbolinks:load', function() {

  $('.select-burden').on('change', function(){

    let deliveryWay = document.getElementById('d-method');

    let burdenForm = $('select.select-burden > option:selected').val();

    if (burdenForm !== "") {
      deliveryWay.style.cssText = "display: block;";
    } else {
      deliveryWay.style.cssText = "display: none;";
    }
  });


  $(document).on('change', '.sub-sub-category', function(){

    let brandForm = document.getElementById('brand-form');
    brandForm.style.cssText = "display: block;";

    let sizeForm = document.getElementById('size-form');
    sizeForm.style.cssText = "display: block;";

  });

  $('.top-category').on('change', function(){

    let sizeForm = document.getElementById('size-form');
    sizeForm.style.cssText = "display: none;";

  });

});
