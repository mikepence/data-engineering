migration 3, :create_items do
  up do
    create_table :items do
      column :id, Integer, :serial => true
      column :description, DataMapper::Property::String, :length => 255
      column :merchant_id, DataMapper::Property::Integer
    end
  end

  down do
    drop_table :items
  end
end
