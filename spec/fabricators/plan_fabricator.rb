Fabricator(:plan) do
  user
  transactions(count: 5)
  subscribers(count: 3)
  name { Faker::Lorem.words(4) }
  period_amount { Faker::Number.digit }
  period_type { 'month' }
  amount { Faker::Number.number(2) }
end
