class PlantsController < ApplicationController
  
  # GET /plants
  def index
    plant = Plant.all
    render json: plant, status: :ok
  end

  # GET /plants/:id
  def show
    plant = find
    if plant
      render json: plant, status: :ok
    else
      render json: { error: 'Plant not found'}, status: :not_found
    end
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  private
  def find
    Plant.find_by(id: params[:id])
  end

  def plant_params
    params.permit(:name, :image, :price)
  end


end
