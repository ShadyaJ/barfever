class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :full_map, :full_map_home]

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
      @bars = Bar.joins(:bar_musics).where(bar_musics: params[:tag_music])
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
    @events = chunk(@bar.events, 2)
    @redirection = params[:redirection]
    @musics = @bar.musics
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

  private

  def chunk(array, chunk_size)
    i = 0
    new_array = []
    array_size = array.size
    while i < array_size
      new_array << array.slice(i ... i + chunk_size)
      i += chunk_size
    end
    return new_array
  end
end
