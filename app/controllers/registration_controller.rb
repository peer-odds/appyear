class RegistrationsController < ApplicationController

  private 
  def new
    @registration = Registration.new
  end
  def create 
    @registration = Registration.create(registration_params)
    if @registration.save
      render json: @registration
    else
      render json: @registration.errors, status: :unprocessable_entity
    end
  end
  def registration_params
    params.require(:registration).permit(:first_name, :last_name, :dob, :gender, :email, :phone, :subject)
  end
end