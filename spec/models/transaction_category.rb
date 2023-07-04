require 'rails_helper'

RSpec.describe TransactionCategory, type: :model do
  describe "associations" do
    it { should belong_to(:its_transaction).with_foreign_key('its_transaction_id') }
    it { should belong_to(:category).with_foreign_key('category_id') }
  end
end