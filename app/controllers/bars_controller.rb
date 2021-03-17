class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @bar = Bar.find(params[:id])
  end
end
