class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :welcome ]

  def home
    @bars = Bar.all
    @events = Event.all
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
end
