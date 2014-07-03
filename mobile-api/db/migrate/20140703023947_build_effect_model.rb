class BuildEffectModel < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :media_path
      t.string :type
    end

    create_table :items_effects do |t|
      t.integer :item_id
      t.integer :effect_id
    end
    add_index :items_effects, :item_id
    add_index :items_effects, :effect_id
  end

  def down
    drop_table :items
    drop_table :items_effectss
  end
end
