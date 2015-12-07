class BuildingsController < ApplicationController
  before_filter :set_current_user#, :only=> ['edit', 'update', 'delete']

  def building_params #pets-string, laundry-int, parking-string, num_apt-int
    params.require(:building).permit(:address, :management, :pets, :laundry, :parking, :number_apartments, :searchaddress, :searchcompany, :filterbalcony)
  end

  def show
    id = params[:id] # 
    @building = Building.find(id) # 
    @apartments = Apartment.where(building_id:id)
    

    @selected_balconies = params[:filterbalcony]
    if @selected_balconies == nil
      @apartments = Apartment.where(building_id:id)
    else
      @apartments = Apartment.filter(params[:filterbalcony])
    end

  end

  def index
    @buildings = Building.all
    
    @buildings = Building.search(params[:searchaddress], params[:searchcompany])


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
