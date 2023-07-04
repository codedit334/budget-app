require 'rails_helper'
require 'devise'

RSpec.describe CategoriesController, type: :controller do
    include Devise::Test::ControllerHelpers
    
    let(:user) { FactoryBot.create(:user, email: 'oussama_elabdioui@hotmail.com') }

    
    describe "GET #index" do
    it "assigns @categories and @total_amount" do
    #   user = FactoryBot.create(:user)
      category1 = FactoryBot.create(:category, user: user)
      category2 = FactoryBot.create(:category, user: user)
      its_transaction1 = FactoryBot.create(:its_transaction, author: user)
      its_transaction2 = FactoryBot.create(:its_transaction, author: user)
      FactoryBot.create(:transaction_category, its_transaction: its_transaction1, category: category1)
      FactoryBot.create(:transaction_category, its_transaction: its_transaction2, category: category2)

      sign_in user

      get :index

      expect(assigns(:categories)).to include(category1)
      expect(assigns(:categories)).to include(category2)
      expect(assigns(:total_amount)).to eq(its_transaction1.amount + its_transaction2.amount)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "assigns a new Category instance variable" do
      user = FactoryBot.create(:user)

      sign_in user

      get :new

      expect(assigns(:category)).to be_a_new(Category)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new category and redirects to index" do
        user = FactoryBot.create(:user)

        sign_in user

        expect {
          post :create, params: { category: { name: "New Category", icon: "new_icon.png" } }
        }.to change(Category, :count).by(1)

        expect(response).to redirect_to(categories_path)
        expect(flash[:notice]).to eq('Category created successfully.')
      end
    end
  end
end
