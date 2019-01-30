FactoryBot.define do

  factory :category do
    name Faker::Name.name
    ancestry nil
  end
end
