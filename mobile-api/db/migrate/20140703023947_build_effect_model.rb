class BuildEffectModel < ActiveRecord::Migration
  def up
    create_table :effects do |t|
      t.string :name
      t.string :description
      t.string :media_path
      t.string :effect_type
    end

    create_table :effects_items do |t|
      t.integer :item_id
      t.integer :effect_id
    end
    add_index :effects_items, :item_id
    add_index :effects_items, :effect_id
  end

  def down
    drop_table :effects
    drop_table :effects_items
  end
end
