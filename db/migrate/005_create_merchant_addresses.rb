migration 5, :create_merchant_addresses do
  up do
    create_table :merchant_addresses do
      column :id, Integer, :serial => true
      column :address, DataMapper::Property::String, :length => 255
      column :merchant_id, DataMapper::Property::Integer
    end
  end

  down do
    drop_table :merchant_addresses
  end
end
