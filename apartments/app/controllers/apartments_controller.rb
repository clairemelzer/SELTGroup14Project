class ApartmentsController < ApplicationController
  before_filter :set_current_user
  before_filter :has_user_and_building, only:[:new,:create]
  

  def index
    @apartments = Apartment.all
  end


  def show
    id = params[:id]
    @apartment = Apartment.find(id)
    @building_id = params[:building_id]
    @building = Building.find(@building_id)
    @reviews = Review.where(apartment_id:id)
  end


  def new
    if !@current_user
      redirect_to new_session_path
      flash[:warning]= 'Can only add apartment if you are signed in!'
    end
    @apartment = Apartment.new

  end

  # GET /apartments/1/edit
  def edit
    @building_id = params[:building_id]
    @apartment = Apartment.find params[:id]
    if !@current_user
      redirect_to building_apartment_path(@building_id, @apartment)
      flash[:warning]= 'Can only edit apartment if you are signed in!'
    end
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)
    @building_id = params[:building_id]
    @apartment.building_id = params[:building_id]
    #If apartment is saved, save the associated pictures
    if @apartment.save
      if params[:pictures]
        params[:pictures].each{ |picture|
          @apartment.images.create(picture: picture)
        }
      end
    
      flash[:notice] = "Apartment #{@apartment.apartment_number} was sucessfully created."
      redirect_to building_path(@building_id)
    else
      render 'new'
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
   
    @apartment = Apartment.find params[:id]
    @building_id = params[:building_id]
    @apartment.update_attributes!(apartment_params)
    if params[:pictures]
      params[:pictures].each{ |picture|
      @apartment.images.create(picture: picture)
    }
    end
    flash[:notice] = "Apartment Number #{@apartment.apartment_number} was successfully updated."
    redirect_to building_apartment_path(@building_id, @apartment)
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment = Apartment.find params[:id]
    @building_id = params[:building_id]
    if !@current_user
      redirect_to building_apartment_path(@building_id, @apartment)
      flash[:warning]= 'Can only delete apartment if you are signed in!'
    else
      @apartment = Apartment.find(params[:id])
      @building_id = params[:building_id]
      @apartment.destroy
      flash[:notice] = "Apartment Number '#{@apartment.apartment_number}' deleted."
      redirect_to building_path(@building_id)
    end
  end

  def has_user_and_building
    unless @current_user
     redirect_to new_session_path
     flash[:notice] = "You need to sign in first!"
    end
    unless (@building = Building.find_by_id(params[:building_id]))
      redirect_to buildings_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_apartment
    @apartment = Apartment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def apartment_params
    params.require(:apartment).permit(:building_id, :user_id, :apartment_number, :bedrooms, :bathrooms, :rent, :monthly_util, :central_air, :balcony, :laundry_in_unit)
  end
end
