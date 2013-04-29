FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobarbaz"
    password_confirmation "foobarbaz"
  end

  factory :baby do
    association :user
    birth 7.days.ago
    gender "Unknown"
    sequence(:name) { |n| "Baby #{n}"}
  end

  factory :measurement do
    association :baby
    height 10
    weight 15
  end

  factory :event do
    association :baby
    event_type "Defecation"
    title "foobarbaz"
    description "foobarbaz"
    happened_at Time.now
  end
end