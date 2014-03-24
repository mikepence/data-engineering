class Purchase
  include DataMapper::Resource

  property :id, Serial
  property :purchase_count, Integer

  validates_presence_of :purchase_count
  validates_numericality_of :purchase_count

  belongs_to :purchaser
  belongs_to :merchant_address
  belongs_to :pricing
end
