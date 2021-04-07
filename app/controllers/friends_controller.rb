class FriendsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @friend = Friend.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @friend = Friend.new(friend_params)
    @friend.booking = @booking
    if @friend.save!
      redirect_to new_booking_friend_path(@booking)
    else
      flash[:alert] = "Something went wrong."
    end
  end

  private

  def friend_params
    params.require(:friend).permit(:first_name, :last_name)
  end
end
