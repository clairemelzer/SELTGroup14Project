class BuildingsController < ApplicationController
  before_filter :set_current_user

  def building_params
    params.require(:building).permit(:address, :management)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @building = Building.find(id) # look up movie by unique ID

  end

  def index
    @buildings = Building.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @building = Building.create!(building_params)
    flash[:notice] = "#{@building.address} was successfully created."
    redirect_to buildings_path
  end

  def edit
    @building = Building.find params[:id]
  end

  def update
    @building = Building.find params[:id]
    @building.update_attributes!(building_params)
    flash[:notice] = "#{@building.address} was successfully updated."
    redirect_to buildings_path(@building)
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    flash[:notice] = "Building '#{@building.address}' deleted."
    redirect_to buildings_path
  end

end
