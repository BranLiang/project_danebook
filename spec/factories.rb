FactoryGirl.define do
  factory :comment do
    
  end
  factory :like do
    
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
