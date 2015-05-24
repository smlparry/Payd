# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  Plan.create(name: Faker::Lorem.word,
              amount: Faker::Number.number(2),
              period_type: 'month',
              period_amount: Faker::Number.digit
              )
end
