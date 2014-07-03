class BuildItemModel < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :media_path
      t.integer :checkpoint_id
      t.integer :checkpoint_association_id
    end
    add_index :items, :checkpoint_id
    add_index :items, :checkpoint_association_id
  end

  def down
    drop_table :items
  end
end
