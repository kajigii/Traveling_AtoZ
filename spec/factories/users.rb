FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.user_name}
    email    {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end