class Link
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :user
  
  attr_accessible :source, :reciever_id, :title, :parsely_url, :tags
  
  field :source, :type => String
  field :sender_id
  field :reciever_id
  field :title, :type => String
  field :parsely_url, :type => String
  field :tags, :type => Array

  after_save :add_to_queue
  
  private
  def self.makeAbsolute(link)
    link = URI.unescape(link)
    puts 'linkage ' + link
    if link !~ /http(s)?:\/\//
      'http://' + link
    else
      link
    end
  end

  def add_to_queue()

  end

end
