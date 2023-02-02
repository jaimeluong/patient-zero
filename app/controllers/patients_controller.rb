class PatientsController < ApplicationController
    def index
        @patients = Patient.all

        respond_to do |format|
            format.html
            format.json {
                render :json => @patients
            }
        end
    end

    def show
        @patient = Patient.find(params[:id])

        respond_to do |format|
            format.html
            format.json {
                render :json => @patient
            }
        end
    end

    def new
        @patient = Patient.new
    end

    def create
        @patient = Patient.new(patient_params)

        if @patient.save
            redirect_to @patient
            flash[:saved] = "Created a new patient"
        else
            flash.now[:error] = "Something went wrong"
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @patient = Patient.find(params[:id])
    end

    def update
        @patient = Patient.find(params[:id])

        if @patient.update(patient_params)
            redirect_to @patient
            flash[:updated] = "Updated details for patient"
        else
            flash.now[:error] = "Something went wrong"
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @patient = Patient.find(params[:id])
        @patient.destroy

        flash[:destroyed] = "Patient removed"
        redirect_to root_path
    end

    private

    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :age, :sex, :medical_notes)
    end
end
