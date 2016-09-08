FactoryGirl.define do
  factory :comment do
    body "this is a comment"
    user
  end
  factory :like do
    user
  end
  factory :post do
    body "hello this is post body"
    author
  end

  factory :user, aliases: [:author] do
    sequence(:username){ |n| "Foo#{n}"}
    email  { "#{username}@email.com" }
    password "foobar"
  end
end
