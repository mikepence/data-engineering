class Item
  include DataMapper::Resource

  property :id, Serial
  property :description, String

  validates_presence_of :description

  belongs_to :merchant
  has n, :pricings
end
