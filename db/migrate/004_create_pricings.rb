migration 4, :create_pricings do
  up do
    create_table :pricings do
      column :id, Integer, :serial => true
      column :price, DataMapper::Property::Decimal
      column :item_id, DataMapper::Property::Integer
    end
  end

  down do
    drop_table :pricings
  end
end
