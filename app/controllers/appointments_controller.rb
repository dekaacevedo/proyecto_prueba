class AppointmentsController < ApplicationController
	before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]

  def daily
    @appointments = Appointment.where(date: Date.today)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id

    if @appointment.save
      redirect_to root_path
    else
      flash[:alert] = "Algo no funcionó correctamente."
      render :new
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :time, :user_id, :patient_id)
  end

  def set_user
    @user = current_user
  end
end
