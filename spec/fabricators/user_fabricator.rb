Fabricator(:user) do
  email { Faker::Internet.email }
  password { 'secret123' }
  password_confirmation { 'secret123' }
end
