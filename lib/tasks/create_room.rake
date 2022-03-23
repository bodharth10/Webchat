#command: rake create_room:run

namespace :create_room do
  desc "Seed room"
  task :run => :environment do
    Room.create!({name: "Group Discussion"})
  end
end