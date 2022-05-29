require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user = User.create(email:"samples@email.com", password:"password")
  end
  
  describe 'GET index' do
    before do
      sign_in(@user)
    end
    
    it '200httpレスポンスを返す' do
      get posts_path
      expect(response.status).to eq 200
    end
    
    it 'indexページが表示される' do
      get posts_path
      expect(response).to render_template :index
    end
  end

  describe 'GET index ログインしていない' do    
    it '302レスポンスを返す' do
      get posts_path
      expect(response.status).to eq 302
    end
    
    it 'ログインページにリダイレクトされる' do
      get posts_path
      expect(response).to redirect_to new_user_session_url
    end
  end

  describe 'ログインページにアクセス' do
    before do
      sign_in(@user)
    end
    
    it 'ログインページにアクセスすると302レスポンスを返す' do
      get new_user_session_url
      expect(response.status).to eq 302
    end
    
    it 'indexページにリダイレクトされる' do
      get root_path
      expect(response).to redirect_to posts_url
    end
  end
end