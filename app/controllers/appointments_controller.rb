class AppointmentsController < ApplicationController
    before_action :authenticate_user!

    def index
        @appointments = Appointment.all

        respond_to do |format|
            format.html
            format.json {
                render :json => @appointments
            }
        end
    end

    def show
        @appointment = Appointment.find(params[:id])

        respond_to do |format|
            format.html
            format.json {
                render :json => @appointment
            }
        end
    end

    def new
        @appointment = Appointment.new
    end

    def create
        @appointment = Appointment.new(appointment_params)

        if @appointment.save
            redirect_to @appointment
            flash[:saved] = "Created a new appointment"
        else
            flash.now[:error] = "Something went wrong"
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @appointment = Appointment.find(params[:id])
    end

    def update
        @appointment = Appointment.find(params[:id])

        if @appointment.update(appointment_params)
            redirect_to @appointment
            flash[:updated] = "Updated details for appointment"
        else
            flash.now[:error] = "Something went wrong"
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @appointment = Appointment.find(params[:id])
        @appointment.destroy

        flash[:destroyed] = "Appointment removed"
        redirect_to root_path
    end

    private

    def appointment_params
        params.require(:appointment).permit(:start_date, :end_date, :category, :description, :provider_id, :patient_id)
    end
end
