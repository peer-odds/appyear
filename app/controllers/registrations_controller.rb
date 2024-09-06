class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.all
  end
  def edit
    @registration = Registration.find(params[:id])
  end
  def new
    puts "new"
    @registration = Registration.new
  end
  def destroy
    puts "destroy"
    @registration = Registration.find(params[:id])
    @registration.destroy
    redirect_to root_path
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
  def update
    @registration = Registration.find(params[:id])
    if @registration.update(registration_params)
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