class AddAppointmentDateToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :appointment_at, :datetime
  end
end
