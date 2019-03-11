class CreateGardens < ActiveRecord::Migration[5.1]
  def change
    create_table :gardens do |t|
      t.integer :user_id
      t.integer :plant_id

      t.timestamps
    end
  end
end
