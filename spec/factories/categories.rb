FactoryBot.define do
  factory :category do
    name { 'Category' }
    icon { 'icon.png' }
    association :user, factory: :user
  end
end
