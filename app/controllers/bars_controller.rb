class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :full_map]

  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
    @markers = [{
      lat: @bar.latitude,
      lng: @bar.longitude
    }]
  end

  def full_map
    @bar = Bar.find(params[:id])
    @markers = [{
      lat: @bar.latitude,
      lng: @bar.longitude
    }]
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(
      :name, :category, :description, :price,
      :address_street, :address_zipcode, :address_city, :user_id
    )
  end
end
