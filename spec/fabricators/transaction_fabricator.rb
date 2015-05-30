Fabricator(:transaction) do
  user
  plan
  invoice { Faker::Bitcoin.address }
  subscriber(count: 2)
end
