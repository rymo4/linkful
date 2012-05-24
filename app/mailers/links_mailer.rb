class LinksMailer < ActionMailer::Base
  default from: "theAlexPoon@gmail.com"

  def daily_links(links, user)
    @links = links
    @user = user
    mail(:to => user.email, :subject => "Your daily linkful digest of links!")
  end
end
