class Category < ApplicationRecord
    has_many :transaction_categories
    has_many :its_transactions, through: :transaction_categories
end
  
