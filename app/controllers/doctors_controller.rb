class DoctorsController < ApplicationController
  before_action :authenticate_user!
  def index
    @doctors = Doctor.all
  end
  def new
    @check = "This is a variable"
  end
  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor, notice: "Doctor was saved successfully"
    else
      redirect_to :new
    end
  end

  private
  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :contact, :email, :degree)
  end
end
