class CreateCheckpointModels < ActiveRecord::Migration
  def up
    create_table :checkpoints do |t|
      t.string   :latitude
      t.string   :longitude
      t.string   :name
      t.text     :description
      t.integer  :followed
      t.datetime :last_visited
      t.integer  :game_id
      t.timestamps
    end
    add_index :checkpoints, :game_id

    create_table   :checkpoint_associations do |t|
      t.integer    :followed
      t.datetime   :last_visited
      t.timestamps
    end

    create_table :checkpoint_conditions do |t|
      t.string  :name
      t.text    :description
      t.boolean :achieved
      t.timestamps
    end
    add_reference :checkpoints, :checkpont_conditions
  end
end
