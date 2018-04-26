class MakesController < ApplicationController
  before_action :set_make, only: [:show, :update, :destroy]

  api!
  def index
    @makes = Make.all

    render json: @makes
  end

  api!
  def show
    render json: @make
  end

  api!
  def create
    @make = Make.new(make_params)

    if @make.save
      render json: @make, status: :created, location: @make
    else
      render json: @make.errors, status: :unprocessable_entity
    end
  end

  api!
  def update
    if @make.update(make_params)
      render json: @make
    else
      render json: @make.errors, status: :unprocessable_entity
    end
  end

  api!
  def destroy
    @make.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_make
      @make = Make.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def make_params
      params.require(:make).permit(:name)
    end
end
