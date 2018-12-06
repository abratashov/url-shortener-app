class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def home
    render json: 'Home page'
  end
end
