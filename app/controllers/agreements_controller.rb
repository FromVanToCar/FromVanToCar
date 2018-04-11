class AgreementsController < ApplicationController

    def contact

        #ContactMailer.contact_send(params).deliver_now 

        @message = params[:message]
        @detail = params[:detail]
        @date = params[:date]
        @vehicle_id = params[:vehicle_id]
        @vehicle = Vehicle.find(@vehicle_id)
        @customer = current_user
        @vehicle.user.email
        ContactMailer.contact_email(@message, @detail, @date, @vehicle, @customer).deliver_now
        redirect_to root_path

    end
end