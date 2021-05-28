FactoryBot.define do

  factory :user do
    name 'Alexandra'
    email 'alexandra@gmail.com'
    password '123456'
    password_confirmation '123456'
  end

  factory :product do
    title 'Pizza Salami'
    description 'Pizza'
    price 12.0

    after(:build) do |product|
      product.picture.attach(io: File.open('public/images/Pizza Salami.webp'), filename: 'Pizza Salami.webp', content_type: 'image/webp')
    end
  end
end