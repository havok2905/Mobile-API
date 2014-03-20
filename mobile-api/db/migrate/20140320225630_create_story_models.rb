class CreateStoryModels < ActiveRecord::Migration
  def change
    create_table :stories_stories do |t|
      t.string :name
      t.text   :description
      t.string :media_type
      t.string :media_path
      t.timestamps
    end
  end
end
