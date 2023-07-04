require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:transaction_categories) }
    it { should have_many(:its_transactions).through(:transaction_categories) }
  end
end