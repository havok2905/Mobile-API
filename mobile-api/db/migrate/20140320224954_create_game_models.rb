class CreateGameModels < ActiveRecord::Migration
  def change
    create_table :games_games do |t|
      t.string :name
      t.text   :description
      t.timestamps
    end
  end
end
