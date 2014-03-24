migration 5, :create_pricings do
  up do
    create_table :pricings do
      column :id, Integer, :serial => true
      column :price, DataMapper::Property::Decimal
    end
  end

  down do
    drop_table :pricings
  end
end
