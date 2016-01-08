class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.integer :length_mins
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
