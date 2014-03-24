class Pricing
  include DataMapper::Resource

  property :id, Serial
  property :price, Decimal

  validates_presence_of :price
  validates_numericality_of :price

  belongs_to :item
  has n, :purchases
end
