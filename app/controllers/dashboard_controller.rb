class DashboardController < ApplicationController
  def index
    @short_urls = current_user.short_urls
  end

  def statistics
    @short_url = ShortUrl.find_by(short_link: params[:short_link])
  end
end
