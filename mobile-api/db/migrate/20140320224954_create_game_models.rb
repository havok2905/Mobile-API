class CreateGameModels < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.string :name
      t.text   :description
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.timestamps
    end
    add_index :games, :user_id
  end

  def down
    drop_table :games
  end
end
