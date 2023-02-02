class HomeController < ApplicationController
    def index
        if user_signed_in?
            @provider_count = Provider.all.count
            @patient_count = Patient.all.count
            @appointment_count = Appointment.all.count

            respond_to do |format|
                format.html
            end
        else
            render "splash"
        end
    end
end
