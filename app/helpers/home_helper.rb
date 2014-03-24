# Helper methods defined here can be accessed in any controller or view in the application

DataEngineering::App.helpers do
 def clear_database
   Purchaser.destroy
   Merchant.destroy
   MerchantAddress.destroy
   Item.destroy
   Pricing.destroy
   Purchase.destroy
 end
end
