RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

RSpec.configure do |conf|
  conf.include Rack::Test::Methods

  DataMapper.finalize

  Purchaser.auto_migrate!
  Merchant.auto_migrate!
  MerchantAddress.auto_migrate!
  Item.auto_migrate!
  Pricing.auto_migrate!
  Purchase.auto_migrate!
end

def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end

def good_data
  <<-eos
  purchaser name	item description	item price	purchase count	merchant address	merchant name
  Snake Plissken	$10 off $20 of food	10.0	2	987 Fake St	Bob's Pizza
  Amy Pond	$30 of awesome for $10	10.0	5	456 Unreal Rd	Tom's Awesome Shop
  Marty McFly	$20 Sneakers for $5	5.0	1	123 Fake St	Sneaker Store Emporium
  Snake Plissken	$20 Sneakers for $5	5.0	4	123 Fake St	Sneaker Store Emporium
  eos
end

def bad_data
  <<-eos
  purchaser name	item description	item price	purchase count	merchant address	merchant name
  Snake Plissken
  eos
end

