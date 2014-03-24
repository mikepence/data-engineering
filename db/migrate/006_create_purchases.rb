migration 6, :create_purchases do
  up do
    create_table :purchases do
      column :id, Integer, :serial => true
      column :purchase_count, DataMapper::Property::Integer
      column :purchaser_id, DataMapper::Property::Integer
      column :merchant_address_id, DataMapper::Property::Integer
      column :pricing_id, DataMapper::Property::Integer
    end
  end

  down do
    drop_table :purchases
  end
end
