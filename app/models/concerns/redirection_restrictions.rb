# module RedirectionRestrictions
#   extend ActiveSupport::Concern

#   included do
#     validate :acceptance_by_counter_and_ip
#   end

#   private

#     def acceptance_by_counter_and_ip
#       REDIRECTION_PER_DAY = 100
#       if short_url.redirections.where(
#            user_info: { ip: user_info[:ip] },
#            created_at: Time.now.strftime("%d/%m/%Y")).count > REDIRECTION_PER_DAY

#         errors.add(:link, "you exceeded the limit of redirection for today.")
#       end
#     end

#     def acceptance_by_time_interval
#     end

#     # some another criterias ...
# end
