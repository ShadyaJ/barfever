class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :welcome ]

  def home
    @bars = Bar.all
    @events = Event.all
  end

  def welcome
  end

end
