class MerchantAddress
  include DataMapper::Resource

  property :id, Serial
  property :address, String

  validates_presence_of :address

  belongs_to :merchant
  has n, :purchases
end
