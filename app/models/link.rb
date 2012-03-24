class Link
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :user
  
  #attr_accessible :source
  
  field :source, :type => String
  field :sender_id
  field :reciever_id
  
  
end
