class BuildItemModel < ActiveRecord::Migration
  def up
    create_table :items, :as_relation_superclass => true do |t|
      t.string :name
      t.string :description
      t.string :media_path
      t.integer :checkpoint_id
      t.integer :checkpoint_association_id
      t.timestamps
    end
    add_index :items, :checkpoint_id
    add_index :items, :checkpoint_association_id

    create_table :story_items do |t|
      t.boolean :priority
      t.integer :item_id
      t.timestamps
    end
    add_index :story_items, :item_id

    create_table :health_items do |t|
      t.integer :boost
      t.boolean :can_self
      t.boolean :can_target
      t.integer :limit
      t.integer :item_id
      t.timestamps
    end
    add_index :health_items, :item_id

    create_table :weapon_items do |t|
      t.integer :damage
      t.boolean :splash
      t.boolean :radius
      t.integer :integrity
      t.boolean :timed
      t.integer :time
      t.integer :item_id
      t.timestamps
    end
    add_index :weapon_items, :item_id
  end

  def down
    drop_table :items
    drop_table :story_items
    drop_table :health_items
    drop_table :weapon_items
  end
end
