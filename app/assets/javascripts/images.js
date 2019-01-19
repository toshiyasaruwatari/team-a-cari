$(function(){
    //↓ここでサムネイルにする小さい画像を呼びます
  $('.sub-image li img').hover(function(){
    //↓ここでメインにする大きい画像を持ってきます  .attr(src)を持ってきます
      $('.main-image img').attr('src', $(this).attr('src'));
  });
});
