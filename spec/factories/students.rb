FactoryBot.define do
  factory :student do
    name { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    identification { Faker::Number.unique.number(8) }
    number { "#{Faker::Number.unique.number(7)}/#{Faker::Number.digit}" }
  end
end
