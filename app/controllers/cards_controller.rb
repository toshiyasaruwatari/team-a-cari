class CardsController < ApplicationController
protect_from_forgery except: :pay

  def index
  end

  def new
  end
  def buy_confirm
    @item = Item.find(params[:id])
  end

  def pay
  Payjp.api_key = 'sk_test_6c9491bce7beee9bc4c8bf2f'
  token = Payjp::Token.create({
    :card => {
    :number => params["number"],
    :cvc => params["cvc"],
    :exp_month => params["exp_month"],
    :exp_year => params["exp_year"]
  }},
  {
    'X-Payjp-Direct-Token-Generate': 'true'
  }
)

  customer = Payjp::Customer.create(
    card: token.id,
)
  user = User.find(current_user.id)
  user[:pay_id] = customer.id
  user.save
  end

  def buy
  @item = Item.find(params[:id])
  Payjp.api_key = 'sk_test_6c9491bce7beee9bc4c8bf2f'
  charge = Payjp::Charge.create(
  :amount => @item.price,
  :customer => current_user.pay_id,
  :currency => 'jpy',
  :capture => 'false'
)
if charge.paid == true
    @item[:buyer_id] = current_user.id
    @item.save
  end
  redirect_to root_path, notice: "決済が完了しました。"
  end
end
    #items の購入stsを変える ifでstsが購入ずみならsoldつける

