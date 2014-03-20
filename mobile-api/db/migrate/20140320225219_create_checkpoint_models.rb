class CreareCheckpointModels < ActiveRecord::Migration
  def change
    create_table :checkpoints_checkpoints do |t|
      t.string   :latitude
      t.string   :longitude
      t.string   :name
      t.text     :description
      t.integer  :followed
      t.datetime :last_visited
      t.timestamps
    end

    create_table :checkpoints_checkpoint_associations do |t|
      t.integer  :followed
      t.datetime :last_visited
      t.timestamps
    end

    create_table :checkpoints_checkpoint_conditions do |t|
      t.string  :name
      t.text    :description
      t.boolean :achieved
      t.timestamps
    end
  end
end
