$(document).on('turbolinks:load', function() {

  $(".price-base__form").on("keyup", function(){

    let input = $(".price-base__form").val();

    if(input >= 300){

      let commission = 0.1;
      let itemCommission = Math.floor(input * commission);
      let itemProfit = (input - itemCommission);

      $(".fee-right").text("¥" + itemCommission);
      $(".profit-right").text("¥" + itemProfit);

    }else{
      $(".fee-right").text("-");
      $(".profit-right").text("-");
    }
  });
});
