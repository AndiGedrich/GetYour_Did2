class CreateSalons < ActiveRecord::Migration
  def change
    create_table :salons do |t|
      t.string :name
      t.string :address
      t.string :zip_code
      t.integer :price_range
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
