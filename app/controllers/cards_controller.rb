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
)
  redirect_to root_path
  end
end
=begin
charge = Payjp::Charge.retrieve(current_user.pay_id)
charge.capture
  binding.pry
  @item.buyer_id = current_user.id
  @item.save
=end
