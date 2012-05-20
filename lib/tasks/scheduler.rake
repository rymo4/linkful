desc "This is called daily to send out emails of aggregated links for people who have received links since their last email."
task :daily_links_email => :environment do
      puts "Sending emails"

      sortedLinks = Hash.new

      links = Link.where(:emailed => false)

      links.each do |link|
        if not sortedLinks.has_key?(link.sender_id)
          sortedLinks[link.sender_id] = Array.new
        end

        if not sortedLinks.has_key?(link.reciever_id)
          sortedLinks[link.reciever_id] = Array.new
        end

        sortedLinks[link.reciever_id].push(link)
        sortedLinks[link.sender_id].push(link)

      end

      links.update_all(emailed: false)

      puts "done."
end
