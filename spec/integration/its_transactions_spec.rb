require 'rails_helper'
require 'devise'

RSpec.describe ItsTransactionsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user:) }
  let(:transaction) { FactoryBot.create(:its_transaction, author: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns @category, @its_transactions, and @total_amount' do
      get :index, params: { category_id: category.id }

      expect(assigns(:category)).to eq(category)
      expect(assigns(:its_transactions)).to eq(category.its_transactions.order(created_at: :desc))
      expect(assigns(:total_amount)).to eq(category.its_transactions.sum(:amount))
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'assigns @category and initializes a new transaction' do
      get :new, params: { category_id: category.id }

      expect(assigns(:category)).to eq(category)
      expect(assigns(:transaction)).to be_a_new(ItsTransaction)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid transaction parameters' do
      it 'creates a new transaction and redirects to the index page' do
        expect do
          post :create, params: {
            category_id: category.id,
            its_transaction: { name: 'New Transaction', amount: 100.0 }
          }
        end.to change(ItsTransaction, :count).by(1)

        expect(response).to redirect_to(category_its_transactions_path(category))
        expect(flash[:notice]).to eq('Transaction created successfully.')
      end
    end
  end
end
