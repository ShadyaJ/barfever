class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @bar = Bar.find(params[:bar_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @bar = Bar.find(params[:bar_id])
    @booking.bar = @bar
    if @booking.save!
      redirect_to new_booking_friend_path(@booking)
    else
      # flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :table_booking?)
  end
end
