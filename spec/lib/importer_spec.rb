require 'spec_helper'

describe Importer do

  it 'imports successfully' do
    Importer.import(StringIO.new(good_data))

    # check the last purchase
    last = Purchase.last
    expect(last.purchaser.name).to eq('Snake Plissken')
    expect(last.pricing.item.description).to eq('$20 Sneakers for $5')
    expect(last.pricing.price).to eq(5.0)
    expect(last.purchase_count).to eq(4)
    expect(last.merchant_address.address).to eq('123 Fake St')
    expect(last.merchant_address.merchant.name).to eq('Sneaker Store Emporium')

    # check the row counts
    expect(Purchase.count).to eq(4)
    expect(Purchaser.count).to eq(3)
    expect(Item.count).to eq(3)
    expect(Pricing.count).to eq(3)
    expect(Merchant.count).to eq(3)
    expect(MerchantAddress.count).to eq(3)
  end

  it 'imports with an exception due to bad data' do
    lambda {Importer.import(StringIO.new(bad_data))}.should raise_error
    expect(Purchase.count).to eq(0)
  end
end
