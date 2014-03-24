require 'smarter_csv'

class Importer

  def self.import(io)

    Purchaser.transaction do |t|
      begin
        SmarterCSV.process(io, :col_sep => "\t").each_with_index do |raw_purchase, index|

          purchaser = Purchaser.first_or_create(:name => raw_purchase[:purchaser_name])
          merchant = Merchant.first_or_create(:name => raw_purchase[:merchant_name])
          merchant_address = MerchantAddress.first_or_create(
              :merchant => merchant,
              :address => raw_purchase[:merchant_address])
          item = Item.first_or_create(
              :merchant => merchant,
              :description => raw_purchase[:item_description])
          pricing = Pricing.first_or_create(
              :item => item,
              :price => raw_purchase[:item_price])

          purchase = Purchase.new(
              :purchaser => purchaser,
              :merchant_address => merchant_address,
              :pricing => pricing,
              :purchase_count => raw_purchase[:purchase_count])

          raise "The purchase at line #{index + 1} could not be saved. Database changes will be rolled back." unless purchase.save
        end
      rescue Exception => e
        t.rollback
        raise e
      end
    end
  end
end