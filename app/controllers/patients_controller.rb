class PatientsController < ApplicationController
	before_action :set_patient, only: [:show, :edit, :update, :destroy]

	def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.name = @patient.name.capitalize
    @patient.last_name = @patient.last_name.titleize

    if @patient.save
      redirect_to patients_path
    else
      flash[:alert] = "Algo no funcionó correctamente."
      render :new
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      flash[:notice] = "El paciente ha sido actualizado con éxito."
      redirect_to patients_path
    else
      flash[:alert] = "Algo no funcionó correctamente."
      render :edit
    end
  end



	private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :last_name, :phone)
  end
end
