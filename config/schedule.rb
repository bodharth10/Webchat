
#Creates a output log for you to view previously run cron jobs
set :output, "log/cron.log" 

#Sets the environment to run during development mode (Set to production by default)
set :environment, "development"

every :monday, at: '6am' do # Use any day of the week or :weekend, :weekday
  rake "message_stats:run"
end