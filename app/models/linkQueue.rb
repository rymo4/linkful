class Linkquene
  include Mongoid::Document
  include Mongoid::Timestamps

  #store_in :linkqueue, capped: true, size: 6_400_000_000, max: 100_000_000
  has_and_belongs_to_many :links, inverse_of: nil
end
