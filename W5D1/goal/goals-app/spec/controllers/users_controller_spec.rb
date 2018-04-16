require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "brings up the form to create a user" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do

    context "with valid params" do
      it 'redirects user to goals index on success' do
        post :create, params: { user: {username: 'kylo1234', password: 'starwars' }}
        expect(response).to redirect_to(goals_url)
      end

      it 'logs in the user' do
        post :create, params: {user: {username: 'kylo1234', password: 'starwars' }}
        user = User.find_by_username("kylo1234")

        expect(session[:session_token]).to eq(user.session_token)
      end

    end

    context "with invalid params" do
      it "validates the presence of username and password" do
        post :create, params: { user: { username: 'pattycakes', password: '' }}
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end

      it "validates that the password is at least 6 characters long" do
        post :create, params: { user: {username: "watever", password: "12345" }}
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end
    end

  end
end
