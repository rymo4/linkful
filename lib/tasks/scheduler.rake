desc "This task is called by the Heroku scheduler add-on"
task :daily_links_email => :environment do
      puts "Sending emails"

      User.all.each do |u|
        u.sendDailyEmail
      end
      puts "done."
end
