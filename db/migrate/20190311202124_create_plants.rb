class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :image
      t.string :name
      t.string :breed
      t.string :summary
      t.string :water_history
      t.string :date_added

      t.timestamps
    end
  end
end
