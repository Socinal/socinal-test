FactoryBot.define do
  factory :user do
    sequence(:nickname) { "john_doe_#{_1}" }
  end

  trait :user_with_roles do
    roles { build_list :role, 2 }
  end
end
