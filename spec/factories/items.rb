FactoryBot.define do
  factory :item do
    descp {Faker::Starwars.character}
    delivery_id nil

  end
end
