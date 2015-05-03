FactoryGirl.define do
  factory :user do |f|
    f.email "test@example.com"
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.address_1 { Faker::Address.street_address }
    f.address_2 { Faker::Address.secondary_address }
    f.address_city { Faker::Address.city }
    f.address_state { Faker::Address.state }
    f.address_zipcode { Faker::Address.postcode }
    f.phone_number { Faker::PhoneNumber.phone_number }
  end
end