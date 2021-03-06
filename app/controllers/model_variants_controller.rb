class ModelVariantsController < ApplicationController
  before_action :set_model_variant, only: [:show, :update, :destroy]

  api :GET, "model_variants", "List: variants"
  def index
    @model_variants = ModelVariant.all

    render json: @model_variants
  end

  api :GET, "model_variants/:id", "variant"
  def show
    render json: @model_variant
  end

  def create
    @model_variant = ModelVariant.new(model_variant_params)

    if @model_variant.save
      render json: @model_variant, status: :created, location: @model_variant
    else
      render json: @model_variant.errors, status: :unprocessable_entity
    end
  end

  def update
    if @model_variant.update(model_variant_params)
      render json: @model_variant
    else
      render json: @model_variant.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @model_variant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_variant
      @model_variant = ModelVariant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def model_variant_params
      params.require(:model_variant).permit(:model_id, :name, :year, :starting_price_cents, :features)
    end
end
