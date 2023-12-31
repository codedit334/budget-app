class Category < ApplicationRecord
  belongs_to :user
  has_many :transaction_categories
  has_many :its_transactions, through: :transaction_categories

  validates :name, presence: true
  validates :icon, presence: true
end
