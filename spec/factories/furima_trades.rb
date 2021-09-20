FactoryBot.define do
  factory :furima_trade do
    user_id { (FactoryBot.create(:user).id) }
    item_id { (FactoryBot.create(:item).id) }
    token { make_token }
    postal_code { '123-4567' }
    prefecture_id { rand(1..47) }
    city { '山川市' }
    address { '123-45' }
    building { 'ABCマンション' }
    phone_number { '0123456789' }
  end
end

def make_token
  return token = {number: 4242424242424242, cvc: 123, exp_month: rand(1..12), exp_year: rand(23..30)}
end