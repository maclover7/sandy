FactoryGirl.define do
  factory :user do |f|
    f.email "test@example.com"
    f.password "password"
  end
end