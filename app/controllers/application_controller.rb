class ApplicationController < ActionController::Base
  def home
    render json: 'Home page'
  end
end
