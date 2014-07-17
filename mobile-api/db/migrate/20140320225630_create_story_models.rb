class CreateStoryModels < ActiveRecord::Migration
  def up
    create_table :stories do |t|
      t.string :name
      t.text   :description
      t.string :media_type
      t.string :media_path
      t.integer :condition_id
      t.timestamps
    end

    add_index :stories, :condition_id
  end

  def down
    drop_table :stories
  end
end
