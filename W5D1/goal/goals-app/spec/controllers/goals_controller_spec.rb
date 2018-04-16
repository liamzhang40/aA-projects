require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

  describe "GET #index" do
    it "renders index if logged in" do
      # current_user = create(:user)
      # session[:session_token] = current_user.session_token
      # create(:goal, user_id: current_user.id)
      #
      # get :index
      # expect(current_user).to receive(:goals)
      # expect(response).to render_template(:index)
    end
  end
end
