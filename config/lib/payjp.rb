module Payjp

require 'payjp'


def create_token
  Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
  Payjp::Token.create({
  :card => {
    :number => params["number"],
    :cvc => params["cvc"],
    :exp_month => params["exp_month"],
    :exp_year => params["expyear"]
  }},
  {
    'X-Payjp-Direct-Token-Generate': 'true'
  }
)
end
end
