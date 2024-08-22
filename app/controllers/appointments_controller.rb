class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = Appointment.all
  end

  def new
    @doctors = Doctor.all
    @patients = Patient.all
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment created successfully.'
    else
      @doctors = Doctor.all
      @patients = Patient.all
      flash.now[:alert] = 'There was an error creating the appointment.'
      render :new
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    @doctor =@appointment.doctor
    @patient = @appointment.patient
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment.destroy
      redirect_to appointments_path, notice: "Appointment deleted successfully"
    else
      render :show
    end
  end

  def send_email_to_doctor
    appointment = Appointment.find(params[:id])
    AppointmentMailer.notify_doctor(appointment).deliver_now
    redirect_to appointment_path(appointment), notice: 'Email sent to doctor.'
  end

  def send_email_to_patient
    appointment = Appointment.find(params[:id])
    AppointmentMailer.notify_patient(appointment).deliver_now
    redirect_to appointment_path(appointment), notice: 'Email sent to patient.'
  end
  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :appointment_at)
  end
end
