class RedirectionsController < PublicController
  def show
    redirecion_service = RedirectionService.call(params, request)
    short_url = redirecion_service.result

    if redirecion_service.success?
      redirect_to short_url.link
    else
      render_404
    end
  end

  private

    def render_404
      render file: "#{Rails.root}/public/404", status: :not_found
    end
end
