$(document).on('turbolinks:load', function() {

  $('.select-burden').on('change', function(){

    let burdenForm = $('select.select-burden > option:selected').val();

    let deliveryMethodForm = $('#d-method').get(0);

    if (burdenForm !== "") {
      deliveryMethodForm.style.cssText = 'display: block;';
    } else {
      deliveryMethodForm.style.cssText = 'display: none;';
    }
  });

  $(document).on('change', '.third-category', function(){

    let brandForm = $('#brand-form').get(0);
    let sizeForm = $('#size-form').get(0);

    brandForm.style.cssText = 'display: block;';
    sizeForm.style.cssText = 'display: block;';
  });

  $('.top-category').on('change', function(){

    let sizeForm = $('#size-form').get(0);
    sizeForm.style.cssText = 'display: none;';

  });

});
