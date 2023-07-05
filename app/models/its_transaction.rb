class ItsTransaction < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :transaction_categories
  has_many :categories, through: :transaction_categories

  validates :name, presence: true
  validates :amount, presence: true
end
