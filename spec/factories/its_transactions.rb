FactoryBot.define do
  factory :its_transaction do
    name { 'Transaction' }
    amount { 100.0 }
    association :author, factory: :user, strategy: :create
  end
end
