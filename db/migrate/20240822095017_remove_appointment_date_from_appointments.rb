class RemoveAppointmentDateFromAppointments < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointments, :appointment_date, :string
  end
end
