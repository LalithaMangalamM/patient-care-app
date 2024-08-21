class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @appointments=Appointment.all
  end
  def new
    @doctors=Doctor.all
    @patients=Patient.all
  end
end
