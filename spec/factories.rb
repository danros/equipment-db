FactoryGirl.define do
  factory :user do
    name 'Joe Example'
    email 'joe@example.com'

    after(:create) do |user, evaluator|
      user.confirm!
    end
  end

  factory :user_with_password_foobar, class: User do
    name 'Joe Example'
    email 'Joe_Example@example.com'
    password 'foobar'
    password_confirmation 'foobar'

    after(:create) do |user, evaluator|
      user.confirm!
    end
  end
end
