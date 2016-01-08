class SalonsController < ApplicationController
  def index
    @paginate = true
    @salons = Salon.page(params[:page]).per(5) #would be nice to figure out how to change based on window size
  end

  def show
    @salon = Salon.find(params[:id])
  end

  def edit
  end
end
