FactoryBot.define do
  factory :test do
    date Date.new(2018, 4, 1)
    min 6
    max 10
  end
end
