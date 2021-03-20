class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bars = Bar.all
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(
      :name, :category, :description, :price,
      :address_street, :address_zipcode, :address_city, :user_id
    )
  end
end
