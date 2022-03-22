class MessageStatsWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find_by(id: user_id)

    total_no_of_msgs_since_last_week  = user.calculate_total_no_of_msgs_since_last_week
    
    total_no_of_message_since_last_message = user.total_no_of_message_since_last_message  

    if user
      begin
        WeeklyReportMailer.send_report( user, total_no_of_msgs_since_last_week , total_no_of_message_since_last_message).deliver_now
      rescue Exception => e
      end
    end
  end
end