FactoryGirl.define do
  factory :comment do
    body "this is a comment"
    likes_count '0'
    post
    user
  end
  factory :like do
    user
  end
  factory :post do
    body "hello this is post body"
    likes_count '0'
    author
  end

  factory :user, aliases: [:author] do
    sequence(:username){ |n| "Foo#{n}"}
    email  { "#{username}@email.com" }
    password "foobar"
    about_me "I am a badass"
  end
end
