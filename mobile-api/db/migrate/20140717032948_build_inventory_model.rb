class BuildInventoryModel < ActiveRecord::Migration
  def up
    create_table :inventories do |t|
      t.integer :game_id
      t.timestamps
    end
    add_index :inventories, :game_id

    create_table :inventory_items do |t|
      t.integer :inventory_id
      t.integer :item_id
      t.string :item_class
      t.timestamps
    end
    add_index :inventory_items, :inventory_id
    add_index :inventory_items, :item_id
  end

  def down
    drop_table :inventories
    drop_table :inventory_items
  end
end
