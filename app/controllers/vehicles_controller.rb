class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

    # GET method to get a product by id   
    def show   
      @vehicle = Vehicle.find(params[:id])   
    end  

   # GET method for the new product form   
   def new   
    @vehicle = Vehicle.new   
  end   

   # POST method for processing form data   
   def create   
    @vehicle = Vehicle.new(vehicle_params)   
    if @vehicle.save   
      flash[:notice] = 'Vehicle added!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit vehicle!'   
      render :new   
    end   
  end   

  # GET method for editing a product based on id   
  def edit   
    @vehicle = Vehicle.find(params[:id])   
  end   

  # PUT method for updating in database a product based on id   
  def update   
    @vehicle = Vehicle.find(params[:id])   
    if @vehicle.update_attributes(vehicle_params)   
      flash[:notice] = 'Vehicle updated!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to edit vehicle!'   
      render :edit   
    end   
  end   


  # DELETE method for deleting a vehicle from database based on id   
  def destroy   
    @vehicle = Vehicle.find(params[:id])   
    if @vehicle.delete   
      flash[:notice] = 'Vehicle deleted!'   
      redirect_to root_path   
    else   
      flash[:error] = 'Failed to delete this Vehicle!'   
      render :destroy   
    end   
  end   


    # we used strong parameters for the validation of params   
    def vehicle_params   
      params.require(:vehicle).permit(:name, :price, :picture)   
    end   





end
