Fabricator(:plan) do
  user_id { 1 }
  # transactions(count: 5)
  # subscribers(count: 3)
  name { Faker::Commerce.product_name }
  period_amount { Faker::Number.digit }
  period_type { 'month' }
  amount { Faker::Number.number(2) }
end
