class User < ApplicationRecord
    has_many :its_transactions, foreign_key: 'author_id'
end
  