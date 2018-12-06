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

    if create_service.success?
      redirect_to @short_url, notice: I18n.t('short_url.successfully_created')
    else
      render :new
    end
  end

  private
    def set_short_url
      #in future it could be replaced with some policy object (with help of 'pundit' for ex.)
      @short_url = ShortUrl.find(params[:id])
    end

    def short_url_params
      params.require(:short_url).permit(:link, :short_link)
    end
end
