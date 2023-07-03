class TransactionCategory < ApplicationRecord
  belongs_to :its_transaction
  belongs_to :category
end
