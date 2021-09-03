FactoryBot.define do
  factory :user do
    user_name             {'山田太郎'}
    email                 {Faker::Internet.email}
    password              {'123abc'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birth_date            {"1995-01-01"}
  end
end