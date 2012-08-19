desc "This is called daily to send out emails of aggregated links for people who have received links since their last email."
task :daily_links_email => :environment do
  puts "Sending emails"

  sortedLinks = Hash.new

  links = Link.where(:emailed => false)

  links.each do |link|
    if not sortedLinks.has_key?(link.reciever_id)
      sortedLinks[link.reciever_id] = Array.new
    end
    sortedLinks[link.reciever_id].push(link)
  end
  
  sortedLinks.each do |reciever_id, userLinks|
    user = User.find(reciever_id)
    puts "Sending email for #{user.name}"
    puts userLinks.inspect

    LinksMailer.daily_links(userLinks, user).deliver
  end

  links.update_all(emailed: true)

  puts "done."
end
