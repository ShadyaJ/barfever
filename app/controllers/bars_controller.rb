class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :full_map]

  def index
    if params[:query].present?
      sql_query = "address_city ILIKE :query OR name ILIKE :query"
      @bars = Bar.where(sql_query, query: "%#{params[:query]}%")
    elsif params[:tag_category]
      @bars = Bar.where(category: params[:tag_category])
    elsif params[:tag_terrace]
      @bars = Bar.where(terrace: params[:tag_terrace])
    elsif params[:tag_price]
      @bars = Bar.where(price: params[:tag_price])
    elsif params[:tag_music]
      @bars = Bar.where(bar_musics: {musics: {name: params[:tag_music]}})
    elsif params[:tag_review]
      @bars = Bar.order(:reviews)
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

  private

  def bar_params
    params.require(:bar).permit(
      :name, :category, :description, :price,
      :address_street, :address_zipcode, :address_city, :user_id
    )
  end
end
