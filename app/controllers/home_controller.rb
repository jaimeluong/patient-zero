class HomeController < ApplicationController
    # Control what appears if user is signed in or not
    def index
        if user_signed_in?
            # Calculate metrics from database
            @provider_count = Provider.all.count
            @patient_count = Patient.all.count
            @appointment_count = Appointment.all.count

            respond_to do |format|
                format.html
            end
        else
            # Tell user to sign in if they are not
            render "splash"
        end
    end
end
