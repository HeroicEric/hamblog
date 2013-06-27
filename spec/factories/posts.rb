# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Post Title ##{n}" }
    content "Some sample content for a fake post!"
    author "Eric Kelly"

    trait :published do
      state "published"
    end

    factory :published_post, traits: [:published]
  end
end
