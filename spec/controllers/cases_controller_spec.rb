require 'rails_helper'

RSpec.describe CasesController, type: :controller do

  describe 'GET #f2l' do
    it 'returns http success' do
      get :f2l
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #oll' do
    it 'returns http success' do
      get :oll
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #pll' do
    it 'returns http success' do
      get :pll
      expect(response).to have_http_status(:success)
    end
  end

end
