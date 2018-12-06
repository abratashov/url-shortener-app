class ShortUrlsController < ApplicationController
  before_action :set_short_url, only: [:show]

  def show
  end

  def new
    @short_url = ShortUrl.new
  end

  def create
    create_service = ShortUrl::CreateService.call(current_user, short_url_params)
    @short_url = create_service.result

    respond_to do |format|
      if create_service.success?
        format.html { redirect_to @short_url, notice: 'Short url was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_short_url
      @short_url = ShortUrl.find(params[:id])
    end

    def short_url_params
      params.require(:short_url).permit(:link, :short_link)
    end
end
