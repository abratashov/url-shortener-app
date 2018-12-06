class DashboardController < ApplicationController
  def index
    @short_urls = current_user.short_urls
    # of course it needs to add some pagination

    # also need some time to find why CSV isn't supported by MIME
    # respond_to do |format|
    #   format.html
    #   format.csv { send_data(CsvExporter.to_csv(@short_urls, %w(link short_link redirections_count)), filename: "short_urls-#{Date.today}.csv") }
    # end
  end

  def statistics
    @short_url = current_user.short_urls.find_by(short_link: params[:short_link])
    # needs to add some pagination too

    # the same with CSV format supporting
  end

  def csv_short_links
    send_data(CsvExporter.to_csv(current_user.short_urls, %w(link short_link redirections_count)), filename: "short_urls-#{Date.today}.csv")
  end

  def csv_statistics
    short_url = current_user.short_urls.find_by(short_link: params[:short_link])
    send_data(CsvExporter.to_csv(short_url.redirections, %w(user_info created_at)), filename: "#{short_url.short_link}-redirections-#{Date.today}.csv")
  end
end
