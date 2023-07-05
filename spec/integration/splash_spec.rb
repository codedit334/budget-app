require 'rails_helper'

RSpec.describe SplashController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'skips authentication before action' do
      expect(controller).to receive(:authenticate_user!).never
      get :index
    end
  end
end
