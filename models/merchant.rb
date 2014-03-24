class Merchant
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  validates_presence_of :name

  has n, :items
  has n, :merchant_addresses
end
