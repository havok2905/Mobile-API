class BuildItemModel < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :media_path
      t.string :type
      t.integer :checkpoint_id
      t.integer :checkpoint_association_id
    end
    add_index :items, :checkpoint_id
    add_index :items, :checkpoint_association_id

    create_table :story_items do |t|
      t.boolean :priority
    end

    create_table :health_items do |t|
      t.integer :boost
      t.boolean :can_self
      t.boolean :can_target
      t.integer :limit
    end

    create_table :weapon_items do |t|
      t.integer :damage
      t.boolean :splash
      t.boolean :radius
      t.integer :integrity
      t.boolean :timed
      t.integer :time
    end
  end

  def down
    drop_table :items
    drop_table :story_items
    drop_table :health_items
    drop_table :weapon_items
  end
end
