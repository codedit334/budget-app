FactoryBot.define do
  factory :transaction_category do
    association :its_transaction, factory: :its_transaction
    association :category, factory: :category
  end
end
