# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do

  before :each do
    create(:user)
    visit new_user_url
  end

  scenario 'has a new user page' do
    expect(page).to have_content "New User"
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end

  feature 'signing up a user' do
    before :each do
      visit new_user_url
      fill_in 'Username', with: "testing_username"
      fill_in 'Password', with: "starwars"
      click_button 'Create User'
    end

    scenario 'redirects to goals index page after sign in' do
      expect(page).to have_content "Life Goals"
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content "testing_username"
    end
  end
end

feature 'logging in' do

  let(:user) {create(:user)}

  before :each do
    visit new_session_url
    fill_in 'Username', with: user.username
    fill_in 'Password', with: "starwars"
    click_button 'Sign In'
  end

  scenario 'shows username on the homepage after login' do
    expect(page).to have_content user.username
  end
end

feature 'logging out' do

  scenario 'begins with a logged out state' do
    visit new_session_url
    expect(page).to_not have_content('Welcome')
  end

  let(:user) {create(:user)}

  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_session_url
    fill_in 'Username', with: user.username
    fill_in 'Password', with: "starwars"
    click_button 'Sign In'
    click_button 'Logout'
    expect(page).to_not have_content(user.username)
  end

end
