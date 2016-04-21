require 'rails_helper'

RSpec.describe CubeAlgsController, type: :controller do
  describe 'GET #home' do
    it 'returns http success' do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #about' do
    it 'returns http success' do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #cross' do
    it 'returns http success' do
      get :cross
      expect(response).to have_http_status(:success)
    end
  end

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
