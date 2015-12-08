class BuildingsController < ApplicationController
  before_filter :set_current_user#, :only=> ['edit', 'update', 'delete']

  def building_params #pets-string, laundry-int, parking-string, num_apt-int
    params.require(:building).permit(:address, :management, :pets, :laundry, :parking, :number_apartments)
  end

  def show
    id = params[:id] # 
    @building = Building.find(id) # 
    @apartments = Apartment.where(building_id:id)
    
    if params[:filterbalcony] == nil

    else
      params[:filterbalcony] = "t"
      @apartments = @apartments.filterbalcony(params[:filterbalcony])
   end
    if params[:filterlaundry] == nil 

    else 
      params[:filterlaundry] = "t"
      @apartments = @apartments.filterlaundry(params[:filterlaundry])
    end
    if params[:filterair] == nil 

    else 
      params[:filterair] = "t"
      @apartments = @apartments.filterair(params[:filterair])
    end
    if params[:filterbathrooms] != nil
      @apartments = @apartments.filterbathrooms(params[:filterbathrooms][:bathrooms])
    end
    if params[:filterbedrooms] != nil 
      @apartments = @apartments.filterbedrooms(params[:filterbedrooms][:bedrooms])
    end
    



  end

  def index

    
    @buildings = Building.all
  

    @buildings = @buildings.searchaddress(params[:searchaddress])
    if params[:searchcompany] != nil
      @buildings = @buildings.searchcompany(params[:searchcompany][:management])
    end
    if params[:searchparking] != nil
      @buildings = @buildings.searchparking(params[:searchparking][:parking])
    end
    if params[:searchpets] != nil 
      @buildings = @buildings.searchpets(params[:searchpets][:pets])
    end

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
