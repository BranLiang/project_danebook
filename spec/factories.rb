FactoryGirl.define do
  factory :comment do
    body "this is a comment"
    likes_count
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
    about_me "I am a badass"
  end
end
