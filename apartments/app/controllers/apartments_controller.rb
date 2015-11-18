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
    @reviews = Review.where(apartment_id:id)
  end


  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
         
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
    if @apartment.save
      flash[:notice] = "Apartment #{@apartment.apartment_number} was sucessfully created."
      redirect_to building_path(@building_id)
    else
      redirect :back
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
   
    @apartment = Apartment.find params[:id]
    @building_id = params[:building_id]
    @apartment.update_attributes!(apartment_params)
    flash[:notice] = "Apartment Number #{@apartment.apartment_number} was successfully updated."
    redirect_to building_apartment_path(@building_id, @apartment)
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
   @apartment = Apartment.find params[:id]
    if !@current_user
      redirect :back
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
      flash[:notice] = 'You must be logged in to create a review.'
      redirect_to login_path
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
