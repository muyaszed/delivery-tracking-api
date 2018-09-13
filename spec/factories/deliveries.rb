FactoryBot.define do
  factory :delivery do
    customer_first_name { Faker::Name.first_name }
    customer_last_name { Faker::Name.last_name }
    customer_email "#{Faker::Name.first_name }@gmail.com"
    tracking_number { Faker::Code.asin }
    user

    factory :delivery_with_items do
      transient do
        items_count { 10 }
      end

      after(:create) do |delivery, evaluator|
        create_list(:item, evaluator.items_count, delivery: delivery)
      end
    end
  end
end
