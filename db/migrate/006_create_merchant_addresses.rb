migration 6, :create_merchant_addresses do
  up do
    create_table :merchant_addresses do
      column :id, Integer, :serial => true
      column :address, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :merchant_addresses
  end
end
