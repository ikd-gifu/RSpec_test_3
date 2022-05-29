require 'rails_helper'

RSpec.describe 'Users', type: :system do
  it 'ユーザー新規作成画面に行けてアカウントを作成できること' do
    visit new_user_registration_path
    
    fill_in "user_email", with: "sampleemail@email.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"

    click_button 'Sign up'
    
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it 'ユーザーログイン画面に行けて、ログインできること' do
    User.create(email: "samples@email.com",password: "password")

    visit new_user_session_path
    
    fill_in "user_email", with: "samples@email.com"
    fill_in "user_password", with: "password"
    # fill_in "user_password_confirmation", with: "password"
    
    click_button 'Log in'
    
    expect(page).to have_content "Signed in successfully."
  end
end