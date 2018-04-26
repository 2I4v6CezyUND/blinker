class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :update, :destroy]

  api!
  def index
    @vehicles = Vehicle.all

    render json: @vehicles
  end

  api!
  def show
    render json: @vehicle
  end

  api!
  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      render json: @vehicle, status: :created, location: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  api!
  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  api!
  def destroy
    @vehicle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vehicle_params
      params.require(:vehicle).permit(:model_variant_id, :description)
    end
end
