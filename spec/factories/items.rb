FactoryBot.define do
  factory :item do
    descp {Faker::StarWars.character}
    delivery

  end
end
