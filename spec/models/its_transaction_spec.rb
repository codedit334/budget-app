require 'rails_helper'

RSpec.describe ItsTransaction, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:transaction_categories) }
    it { should have_many(:categories).through(:transaction_categories) }
  end
end
