class ApartmentsController < ApplicationController
  before_filter :set_current_user
  before_filter :has_user_and_building, only:[:new,:create]
  

  def index
    @apartments = Apartment.all
  end


  def show
  end


  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)

    if @apartment.save
      flash[:notice] = "Apartment was sucessfully created."
      redirect_to building_apartments_path
    else
      redirect :back
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
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
    params.require(:apartment).permit(:building_id, :user_id, :apartment_number)
  end
end
