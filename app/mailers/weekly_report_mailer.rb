class WeeklyReportMailer < ApplicationMailer
  def send_report(user, total_no_of_msgs_since_last_week, total_no_of_message_since_last_message)
    @user = user, @total_no_of_msgs_since_last_week = total_no_of_msgs_since_last_week, @total_no_of_message_since_last_message = total_no_of_message_since_last_message
    mail(to: @user[0].email, subject: "Weekly Report")
  end
end