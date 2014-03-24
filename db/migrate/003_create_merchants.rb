migration 3, :create_merchants do
  up do
    create_table :merchants do
      column :id, Integer, :serial => true
      column :name, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :merchants
  end
end
