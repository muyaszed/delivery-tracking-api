FactoryBot.define do
  factory :delivery do
    customer_first_name { Faker::Name.first_name }
    customer_last_name { Faker::Name.last_name }
    customer_email "#{Faker::Name.first_name }@gmail.com"
    tracking_number { Faker::Code.asin }
    user

  end
end
