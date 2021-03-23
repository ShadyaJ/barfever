class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :showmap_full]

  def index
    if params[:query].present?
      @bars = Bar.where("address_city ILIKE?", "%#{params[:query]}%")
    elsif params[:tag]
      @bars = Bar.where(bars: { category: params[:tag] })
    else
      @bars = Bar.all
    end
  end

  def show
    @bar = Bar.find(params[:id])
  end

  def showmap_full
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(
      :name, :category, :description, :price,
      :address_street, :address_zipcode, :address_city, :user_id
    )
  end
end
