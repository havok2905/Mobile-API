class CreateGameModels < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text   :description
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
