# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@example.com" }
    password 'changeme'
    password_confirmation 'changeme'
    confirmed_at Date.today
    user.first_name 'My first name'
    user.last_name 'My last name'

    factory :admin do
      is_admin true
    end
  end
end
