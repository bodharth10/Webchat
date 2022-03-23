#command: rake create_users:run

namespace :create_users do
  desc "Seeds users"
  task :run => :environment do
    User.create!([{
      email: "chris@webchat.com",
      username: "chris10",
      password: "password"
    },
    {
      email: "adam@webchat.com",
      username: "adam10",
      password: "password"
    },
    ])
    p "Created #{User.count} users"
  end
end