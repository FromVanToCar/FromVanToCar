class AgreementsController < ApplicationController

    # Acción que se llama cuando un usuario rellena el form_tag de un vehículo
    def contact
       
        # Leer campos del formulario
        @message = params[:message]
        @detail = params[:detail]
        @date = params[:date]
        @vehicle_id = params[:vehicle_id]
        @vehicle = Vehicle.find(@vehicle_id)
        @customer = current_user
        
        # Guardar agreement       
        Agreement.create(message: @message, detail: @detail, date: @date, vehicle: @vehicle, user: @customer)
        
        # Avisar al propietario del vehículo por mail
        ContactMailer.contact_email(@message, @detail, @date, @vehicle, @customer).deliver_now
        
        # Redireccionar a otra página 
        redirect_to root_path

    end

    def list_agreements

        @user = current_user

    end

    def destroy
        Agreement.find(params[:id]).destroy
        redirect_to myagreements_path
    end
end