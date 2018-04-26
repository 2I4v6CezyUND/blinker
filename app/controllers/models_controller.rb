class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :update, :destroy]

  api!
  def index
    @models = Model.all

    render json: @models
  end

  api!
  def show
    render json: @model
  end

  api!
  def create
    @model = Model.new(model_params)

    if @model.save
      render json: @model, status: :created, location: @model
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  api!
  def update
    if @model.update(model_params)
      render json: @model
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  api!
  def destroy
    @model.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def model_params
      params.require(:model).permit(:make_id, :name)
    end
end
