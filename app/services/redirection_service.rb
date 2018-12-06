class RedirectionService < ApplicationService
  def initialize(params, request)
    @short_link = params[:short_link]
    @user_ip = request.remote_ip
  end

  def call
    short_url = ShortUrl.find_by(short_link: @short_link )
    redirection = Redirection.new(short_url: short_url, user_info: { ip: @user_ip })
    # Also we can fetch additional info about user in the async job
    # GetExtraUserInfoJob.perform_later(redirection)
    # (like this service https://api.ip2country.info/ip?5.6.7.8)

    @success  = redirection.save
    @errors   = redirection.errors.to_a
    @result   = short_url
  end
end
