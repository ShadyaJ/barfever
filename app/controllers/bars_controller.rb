class BarsController < ApplicationController
  def index
    if params[:category].present?
      @bars = Bars.where(category: params[:category])
    else
      @bars = Bars.all
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(
      :name, :category, :description, :price,
      :address_street, :address_zipcode, :address_city, :user_id
    )
  end
end
