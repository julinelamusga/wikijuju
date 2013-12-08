FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    name                  Faker::Name.name
    password              "helloworld"
    password_confirmation "helloworld"
    confirmed_at          Time.now
    factory :premium_user do
      premium true
    end
  end

  factory :premium_wiki, class: Wiki do
    sequence(:name) {|n| "premium juju #{n}" }
    premium true
    association :user, factory: :premium_user
    factory :premium_wiki_with_collaborator do
      after(:build) { |wiki| wiki.users << FactoryGirl.create(:premium_user) }
    end
  end

  factory :public_wiki, class: Wiki do
    sequence(:name) {|n| "public juju #{n}" }
    user
  end
end