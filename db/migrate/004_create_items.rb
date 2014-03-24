migration 4, :create_items do
  up do
    create_table :items do
      column :id, Integer, :serial => true
      column :description, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :items
  end
end
