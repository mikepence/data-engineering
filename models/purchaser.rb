class Purchaser
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  validates_presence_of :name

  has n, :purchases
end
