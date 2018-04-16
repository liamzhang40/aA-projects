class GoalsController < ApplicationController

  before_action :ensure_logged_in
  
  def index
    @indices = current_user.goals.all
  end
end
