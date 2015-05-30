Fabricator(:subscriber) do
  user
  plan
  name { Faker::Name.name }
  email { Faker::Internet.email }
  card { Faker::Business.credit_card_number }
end
