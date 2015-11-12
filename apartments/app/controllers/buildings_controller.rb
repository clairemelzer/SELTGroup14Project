class BuildingsController < ApplicationController
  before_filter :set_current_user#, :only=> ['edit', 'update', 'delete']

  def building_params
    params.require(:building).permit(:address, :management)
  end

  def show
    id = params[:id] # 
    @building = Building.find(id) # 

  end

  def index
    @buildings = Building.all
    #
  end

  def new
    # default: render 'new' template
    if !@current_user
      redirect_to buildings_path 
      flash[:warning]= 'Can only add building if you are signed in!'
    end
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      flash[:notice] = "#{@building.address} was successfully created."
      redirect_to buildings_path
    else
      render 'new'
    end
  end

  def edit
     @building = Building.find params[:id]
    if !@current_user
      redirect_to buildings_path(@building)
      flash[:warning]= 'Can only edit building if you are signed in!'
    end
    @building = Building.find params[:id]
  end

  def update
    @building = Building.find params[:id]
    @building.update_attributes!(building_params)
    flash[:notice] = "#{@building.address} was successfully updated."
    redirect_to buildings_path(@building)
  end

  def destroy
     @building = Building.find params[:id]
    if !@current_user
      redirect_to buildings_path(@building) 
      flash[:warning]= 'Can only delete building if you are signed in!'
  else
    @building = Building.find(params[:id])
    @building.destroy
    flash[:notice] = "Building '#{@building.address}' deleted."
    redirect_to buildings_path
  end
  
  end

end
