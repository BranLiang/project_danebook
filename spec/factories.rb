FactoryGirl.define do

  factory :user do
    sequence(:username){ |n| "Foo#{n}"}
    email  { "#{username}@email.com" }
    password "foobar"
  end
end
