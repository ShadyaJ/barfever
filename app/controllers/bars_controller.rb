class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :full_map, :full_map_home]

  def index
    if params[:query].present?
      @bars = Bar.where("address_city ILIKE?", "%#{params[:query]}%")
    elsif params[:tag]
      @bars = Bar.where(category: params[:tag])
    elsif params[:tag_2]
      @bars = Bar.where(terrace: params[:tag_2])
    else
      @bars = Bar.all
    end
  end

  def show
    @bar = Bar.find(params[:id])
    @markers = [{
      lat: @bar.latitude,
      lng: @bar.longitude
    }]
    @events = @bar.events
    @redirection = params[:redirection]
  end

  def full_map
    @bar = Bar.find(params[:id])
    @markers = [{
      lat: @bar.latitude,
      lng: @bar.longitude
    }]
  end

  def full_map_home
    @bars = Bar.all
    @markers = @bars.map do |bar|
     {
      lat: bar.latitude,
      lng: bar.longitude,
      infoWindow: render_to_string(partial: "bars/info_window", locals: { bar: bar })
     }
    end
  end

  private

  def bar_params
    params.require(:bar).permit(
      :name, :category, :description, :price,
      :address_street, :address_zipcode, :address_city, :user_id
    )
  end
end
