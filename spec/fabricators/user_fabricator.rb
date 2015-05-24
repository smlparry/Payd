Fabricator(:user) do
  plans(count: 2)
  email { Faker::Internet.email }
  encrypted_password { Faker::Internet.password }
  sign_in_count { Faker::Number.digit }
  amount { Faker::Number.number(2) }
end
