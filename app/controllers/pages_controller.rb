class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :welcome ]

  def home
    @bars = Bar.all
    @events = chunk(Event.all, 2)
    @bars_nearby = chunk(Bar.all, 2)
    @trendy_bars = []
    Bar.all.each do |bar|
      if bar.average_rating.to_i >= 4
        @trendy_bars << bar 
      end
    end
    @markers = @bars.map do |bar|
     {
      lat: bar.latitude,
      lng: bar.longitude,
      infoWindow: render_to_string(partial: "bars/info_window", locals: { bar: bar })
     }
    end
  end

  def welcome
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
