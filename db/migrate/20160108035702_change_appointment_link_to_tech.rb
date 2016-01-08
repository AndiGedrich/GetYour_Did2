class ChangeAppointmentLinkToTech < ActiveRecord::Migration
  def change
    add_column :appointments, :technician_id, :integer
    remove_column :appointments, :user_id, :integer
  end
end
