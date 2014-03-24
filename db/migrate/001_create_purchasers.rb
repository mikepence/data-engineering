migration 1, :create_purchasers do
  up do
    create_table :purchasers do
      column :id, Integer, :serial => true
      column :name, DataMapper::Property::String, :length => 255
    end
  end

  down do
    drop_table :purchasers
  end
end
