Fabricator(:plan) do
  user_id { 1 }
  # transactions(count: 5)
  # subscribers(count: 3)
  name { Faker::Commerce.product_name }
  interval_count { Faker::Number.digit }
  interval_type { 'month' }
  amount { Faker::Number.number(2) }
  currency { 'AUD' }
end
