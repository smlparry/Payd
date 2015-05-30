Fabricator(:stripe_user) do
  user_id { 1 }
  livemode { true }
  access_token { Faker::Bitcoin.address }
  refresh_token { Faker::Bitcoin.address }
  stripe_user_id { Faker::Number.digit }
  stripe_publishable_key { Faker::Bitcoin.address }
  name { Faker::Commerce.product_name }
  email { Faker::Internet.email }
  business_url { Faker::Internet.url }
  country { Faker::Address.country }
  phone_number { Faker::PhoneNumber.phone_number }
  business_name { Faker::Commerce.product_name }
  business_logo { Faker::Internet.url }
  name { Faker::Name.name }
  default_currency { 'AUD' }
  currencies_supported { Faker::Lorem.words(5) }
  timezone {  Faker::Address.time_zone }
  charge_enabled { true }
end
