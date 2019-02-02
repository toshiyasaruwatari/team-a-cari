$(document).on('turbolinks:load', function(){

  $('.btn-default.btn-red').on('click', function(){
    $('#overlay').fadeIn();
    $('#modal__window').fadeIn();
    $('html, body').css('overflow', 'hidden');
  });

  $('#overlay').on('click', function(){
    $('#overlay').fadeOut();
    $('#modal__window').fadeOut();
    $('html, body').removeAttr('style');
  });

  $('#modal__cancel-btn').on('click', function(){
    $('#overlay').fadeOut();
    $('#modal__window').fadeOut();
    $('html, body').removeAttr('style');
  });

  $('#modal__delete-btn').on('click', function(){
    $('html, body').removeAttr('style');
  });
});


