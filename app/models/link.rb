class Link
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :user
  
  attr_accessible :source, :sender_id, :reciever_id, :title, :parsely_url, :tags
  
  field :source, :type => String
  field :sender_id
  field :reciever_id #TODO: FIX MISSPELLING
  field :title, :type => String
  field :parsely_url, :type => String
  field :tags, :type => Array
  field :emailed, :type => Boolean, default: false
  
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

end
