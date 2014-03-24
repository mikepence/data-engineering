migration 7, :create_purchases do
  up do
    create_table :purchases do
      column :id, Integer, :serial => true
      column :purchase_count, DataMapper::Property::Integer
    end
  end

  down do
    drop_table :purchases
  end
end
