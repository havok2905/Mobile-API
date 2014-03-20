class CreateModelBases < ActiveRecord::Migration
  def change
    create_table :model_bases do |t|
      t.timestamps
    end
  end
end
