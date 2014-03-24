class CreateStoryModels < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.text   :description
      t.string :media_type
      t.string :media_path
      t.timestamps
    end

=begin
    create_table :stories_stories_checkpoints_checkpoint_associations do |t|
      t.references
      t.references
    end
=end

    add_reference :stories, :checkpoint_associations
  end
end
