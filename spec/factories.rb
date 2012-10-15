FactoryGirl.define do
  factory :user do
    name 'Joe Example'
    email 'joe@example.com'
  end

  factory :user_with_password_foo, class: User do
    name 'Joe Example'
    email 'Joe_Example@example.com'
    password 'foo'
    password_confirmation 'foo'
  end
end
