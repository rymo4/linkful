class Link
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :user
  
  attr_accessible :source, :reciever_id, :title, :parsely_url
  
  field :source, :type => String
  field :sender_id
  field :reciever_id
  field :title, :type => String
  field :parsely_url, :type => String
  
  private
  
  def self.makeAbsolute(link)
    if link !~ /http(s)?:\/\//
      'http://' + link
    else
      link
    end
  end
  
end
