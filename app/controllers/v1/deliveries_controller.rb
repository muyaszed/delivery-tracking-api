
module V1
  class DeliveriesController < ApplicationController

    def index
      @deliveries = current_user.deliveries

      json_response(@deliveries)
    end

    def show

      @delivery = Delivery.find(params[:id])
      json_response(@delivery)
    end

    def create
      @delivery = current_user.deliveries.create!(delivery_params)
      json_response(@delivery, :created)
    end

    def update
      @delivery = Delivery.find(params[:id])
      @delivery.update(delivery_params)
      head :no_content
    end

    def destroy
      @delivery = Delivery.find(params[:id])
      @delivery.destroy
      head :no_content
    end

    private

    def delivery_params
      params.permit(:customer_first_name, :customer_last_name, :customer_email, :tracking_number)
    end


  end
end
