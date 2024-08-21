class AppointmentMailer < ApplicationMailer
  default from: 'your_email@example.com'

  def notify_doctor(appointment)
    @doctor = appointment.doctor
    @patient = appointment.patient
    mail(to: @doctor.email, subject: 'A new appointment has been booked')
  end

  def notify_patient(appointment)
    @doctor = appointment.doctor
    @patient = appointment.patient
    mail(to: @patient.email, subject: 'Your appointment has been confirmed')
  end
end
