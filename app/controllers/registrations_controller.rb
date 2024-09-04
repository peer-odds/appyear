class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.all
  end
  def new
    puts "new"
    @registration = Registration.new
  end
  def create 
    puts "create"
    @registration = Registration.new(registration_params)
      if @registration.save
        redirect_to root_path
      else
        redirect_to root_path
      end
  end

  private 
  def registration_params
    params.require(:registration).permit(:first_name, :last_name, :dob, :gender, :email, :phone, :subject)
  end
end