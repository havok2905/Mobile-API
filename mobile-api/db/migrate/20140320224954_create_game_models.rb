class CreateGameModels < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text   :description
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
