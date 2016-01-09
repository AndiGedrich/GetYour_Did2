class RemoveTechTable < ActiveRecord::Migration
  def change
    drop_table :technicians
    add_column :users, :body, :text
    add_column :users, :salon_id, :integer
  end
end
