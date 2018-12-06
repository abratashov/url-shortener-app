class ShortUrl::CreateService < ApplicationService

  def initialize(user, params)
    @user = user
    @params = params
  end

  def call
    short_url = ShortUrl.new(@params.merge({ user: @user }))

    @success  = short_url.save
    @errors   = short_url.errors.to_a
    @result   = short_url
  end
end
