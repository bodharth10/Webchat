#command: rake message_stats:run

namespace :message_stats do
  desc "Calculate Message Stats"
  task :run => :environment do
    users = User.all
    users.find_in_batches(batch_size: 50) do  |obj|
      obj.each do |user|
        begin
          MessageStatsWorker.perform_async(user.id)
        rescue Exception => e
          puts ">>>>>>>> Error #{user.id} - #{e.message} >>>>>>>"
        end
      end
    end
  end
end