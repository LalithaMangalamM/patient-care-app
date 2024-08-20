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
  end
end
