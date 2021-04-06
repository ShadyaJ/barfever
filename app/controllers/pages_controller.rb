class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :welcome ]

  def home
    @bars = Bar.all
    @events = chunk(Event.all, 2)
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
