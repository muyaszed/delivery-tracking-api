module V1
  class ItemsController < ApplicationController

    def index

      @items = Delivery.find(params[:delivery_id]).items.all
      json_response(@items)
    end

    def show
      @item = Item.find(params[:id])
      json_response(@item)
    end

    def create
      @delivery = Delivery.find(params[:delivery_id])
      @item = @delivery.items.create!(item_params)
      json_response(@item, :created)
    end

    def update
      @item = Item.find(params[:id])
      @item.update(item_params)
      head :no_content
    end

    def destroy
      @item = Item.find(params[:id])
      @item.destroy
      head :no_content
    end

    private

    def item_params
      params.permit(:descp)
    end
  end
end
